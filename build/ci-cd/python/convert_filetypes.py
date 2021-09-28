#!/usr/bin/env python3

from argparse import ArgumentParser
import logging
from functools import reduce 
import operator
import json
import os
from pprint import pprint
from ruamel.yaml import YAML
from lxml import etree
import sys

def find(data, lookups=None, path=None):
    """Search data from an OSCAL JSON or YAML document instance in dictionary
    form and perform lookups to find one or more keys for the names of OSCAL
    fields or flags.

    :param data: a parsed OSCAL JSON or YAML document instance in dictionary
    form
    :type data: dict

    :param lookups: a list of zero, one, or more key names when looking for key
    value pairs to match
    :type lookups: list[str]

    :param path: an optional path for the JSON or YAML location of the current
    path, if not at the beginning of traversing the nested dictionaries, and
    will update the path as it walks the recursive nested structure
    :type path: str

    :return: an iterable sequence (from yield) with a dictionary of each match
    found
    :rtype: Iterable[dict]
    """
    lookups = lookups if lookups else []
    path = path if path else []    

    # In case this is a list
    if isinstance(data, list):
        for index, value in enumerate(data):
            new_path = list(path)
            new_path.append(index)
            for result in find(value, lookups, path=new_path):
                yield result 

    # In case this is a dictionary
    if isinstance(data, dict):
        for key, value in data.items():
            new_path = list(path)
            new_path.append(key)
            for result in find(value, lookups, path=new_path):
                yield result

            if key == lookups[0]:
                new_path = list(path)
                matches = { l: data[l] for l in lookups if data.get(l) }
                yield { 'path': new_path, **matches }

def find_xml(data, namespaces=None, lookups=None):
    """Search data from an OSCAL XML document instance with a XPath query
    to perform lookups to find one or more keys for the names of OSCAL
    fields or flags.

    :param data: XML data to search
    :type data: lxml.etree._ElementTree

    :namespaces: an optional list of XML namespaces to constrain your search
    :type namespaces: dict

    :param lookups: a XPath query used to perform the search
    :type lookups: str

    :return: an iterable sequence (from yield) with a dictionary of each match
    found
    :rtype: Iterable[dict]
    """
    namespaces = namespaces if namespaces else {}
    lookups = lookups if lookups else ''

    for result in list(data.xpath(lookups, namespaces=namespaces)):
        yield { 
            'path': get_full_xpath(result),
            **result.attrib
        }

def get_full_xpath(element=None):
    """Construct a XPath query with an absolute path to the instance of the
    element passed in place of a relative one.

    :param element: the target XML element
    :type element: lxml.etree._ElementTree

    :return: the absolute path to the element
    :rtype: str
    """
    if element.getparent() is None: return f"/{element.tag}"
    return f"{get_full_xpath(element.getparent())}/{element.tag}"

def replace(items, old='', new=''):
    """Takes OSCAL JSON, XML, and YAML source data matches as key value pairs
    in memory and makes changes in place, before persisting results to disk.

    This uses the python str.replace function, so substring or complete string
    replacements are supported. If `old` does not match the complete original
    string of an item in `items` it only replaces that substring.

    :param items: the list of matched items that will be changed and have values
    replaced.
    :type items: list[dict]

    :param old: the 'old' target value that is a candidate for replacement
    :type old: str

    :param new: the 'new' value to replace
    :type new: str
    """
    items = items if items else [{}]

    for i in items:
        # Iterate through each item dict i in list of potential replacement points.
        # Initialize empty update object.
        update = {}

        for k in i.keys():
            # Iterate through each key-value pair in dict i (one i from list i of items)
            old_value = i[k]
            update[k] = old_value.replace(old, new) if isinstance(old_value, str) else old_value

            # ignore `path` as this key is added by this script for another pre-processing step
            # to encode an array to walk the JSON/YAML path or a full XPath query for XML source
            # data; we do not want to process this path key-value, it is internal metadata.
            if k != 'path' and update[k] != old_value:
                # This is the first key to be added to the `update` nested dict `original`, so
                # initialize if there has not been a previous use.
                update['original'] = {} if not update.get('original') else update.get('original')
                # Now a new key-value can be added and maintain previous additions as well.
                update['original'][k] = old_value

        if update == i:
            # if the update is equivalent to the potentially changed `i` item, yield None
            yield

        else:
            # the `i` item is different, and has an original key to stuff what value changed
            # for future processing, yield the discrete update
            yield update

def pick(data, path=None):
    """
    Convenience function to flatten nested collections of OSCAL data (from JSON
    and YAML) data and pick on the relevant elements by their "path" identifier.

    :param data: the data from the document instance in dictionary form
    :type data: dict

    :param path: a list of one or more key names to find, and if found, return key
    value pairs while discarding those keys not in the path list.
    :type path: list(str)

    :return: the flattened collection of only the relevant key-value pairs from the
    data.
    :rtype: collections.OrderedDict
    """
    path = path if path else []
    return reduce(operator.getitem, path, data)

def pick_xml(data, namespaces=None, path=None):
    """
    Convenience function to use composable XPath queries to select specific
    key-value data from OSCAL data sourced from OSCAL XML document instances.

    :param data: the data from the document instance in dictionary form
    :type data: dict

    :param namespaces: an optional allow list of XML namespaces to use exclusively
    to query the data for results.
    :type namespaces: dict

    :param path: a XPath query used to collect the key-value pairs.
    :type path: str

    :return: the flattened collection of only the relevant key-value pairs from the
    data.
    :rtype: collections.OrderedDict
    """
    namespaces = namespaces if namespaces else {}
    path = path if path else ''

    results = data.xpath(path, namespaces=namespaces)
    if len(results) > 0:
        return results[0]
    else:
        return None

def update(data, updates=None, originals=None, compare_key=None):
    """Iterates through a list of potential updates matched from an OSCAL JSON
    or YAML document instance, checking for duplicates as defined by a compare
    key to avoid modifications where post-update there would be duplicate adjacent 
    elements.

    :param data: the OSCAL XML document data to be modified, passed by reference to
    modify the data in place 
    :type data: dict

    :param namespaces: a collection of additional XML namespaces to consider when
    processing additional updates, not including `oscal` or `o`, the default XML
    for NIST OSCAL development.
    :type namespaces: dict

    :param updates: a subset list of potential updates with confirmed matches for given
    key-value pairs from originals, the complete list of matching keys (whether or not
    the value is a match) from the target OSCAL XML document instance.
    :type updates: list

    :param originals: the complete list of all fields that match a given key found by
    searching a target OSCAL XML document instance.
    :type originals: list

    :param compare_key: the key of a key-value pair used to test for equivalence where
    two items are considered equal iff this key in both objects has the same value
    :type compare_key: str

    :return: None
    :rtype: None
    """
    updates = updates if updates else [{}]
    originals = originals if originals else [{}]
    maybe_dupes = [o.get(compare_key) for o in originals]

    for update in updates:
        if update.get(compare_key) in maybe_dupes:
            continue

        target = pick(data, update.get('path'))

        for k in update.keys():
            if target.get(k) and not k == 'path' and not k == 'original':
                target[k] = update[k]

def update_xml(data, namespaces=None, updates=None, originals=None, compare_key=None):
    """Iterates through a list of potential updates matched from an OSCAL XML
    document instance, checking for duplicates as defined by a compare key to
    avoid modifications where post-update there would be duplicate adjacent 
    elements.

    :param data: the OSCAL XML document data to be modified, passed by reference    
    :type data: dict

    :param namespaces: a collection of additional XML namespaces to consider when
    processing additional updates, not including `oscal` or `o`, the default XML
    for NIST OSCAL development.
    :type namespaces: dict

    :param updates: a subset list of potential updates with confirmed matches for given
    key-value pairs from originals, the complete list of matching keys (whether or not
    the value is a match) from the target OSCAL XML document instance.
    :type updates: list

    :param originals: the complete list of all fields that match a given key found by
    searching a target OSCAL XML document instance.
    :type originals: list

    :param compare_key: the key of a key-value pair used to test for equivalence where
    two items are considered equal iff this key in both objects has the same value
    :type compare_key: str

    :return: None
    :rtype: None
    """
    namespaces = namespaces if namespaces else {}
    updates = updates if updates else [{}]
    originals = originals if originals else [{}]
    maybe_dupes = [o.get(compare_key) for o in originals]

    for update in updates:
        if update.get(compare_key) in maybe_dupes:
            continue

        path = update.get('path').replace(f"{{{namespaces.get('xmlns')}}}",'oscal:')
        path += f"[@{compare_key}=\"{update.get('original').get(compare_key)}\"]"

        target = pick_xml(data, namespaces, path)

        for k in update.keys():
            if not k == 'path' and not k == 'original':
                target.attrib[k] = update[k]

def process_json(file, old='', new='', dry_run=False):
    """Analyze OSCAL JSON document instances and replace extensions for the
    specified fields, replace fields, and modify results in the target file
    or optionally a separate file for testing purposes.

    :param file: the original target path and file
    :type file: str

    :param old: the original file extension to match
    :type old: str

    :param new: the replacement file extension to replace upon match
    :type new: str

    :param dry_run: a setting, when True, that enables dry-run mode to prevent
    editing of the original target file; defaults to False
    :type dry_run: bool

    :return: an updated path and filename for writing dry run results
    :rtype: str    
    """
    try:
        with open(file) as fd:
            raw_data = fd.read()
            data = json.loads(raw_data)
            links = list(find(data, ['href', 'media-type']))
            replacements = list(r for r in replace(links, old, new) if r)
            update(data, replacements, links, 'href')

        new_file = dry_run_file(file) if dry_run else file

        with open(new_file, 'w') as fd:
            json.dump(data, fd, indent=2)

    except Exception as err:
        logging.exception(err)

def process_xml(file, old='', new='', dry_run=False):
    """Analyze OSCAL XML document instances and replace extensions for the
    specified fields, replace fields, and modify results in the target file
    or optionally a separate file for testing purposes.

    :param file: the original target path and file
    :type file: str

    :param old: the original file extension to match
    :type old: str

    :param new: the replacement file extension to replace upon match
    :type new: str

    :param dry_run: a setting, when True, that enables dry-run mode to prevent
    editing of the original target file; defaults to False
    :type dry_run: bool

    :return: an updated path and filename for writing dry run results
    :rtype: str    
    """

    try:
        with open(file) as fd:
            namespaces = {
                'xmlns': 'http://csrc.nist.gov/ns/oscal/1.0',
                'oscal': 'http://csrc.nist.gov/ns/oscal/1.0'
            }
            data = etree.parse(fd)
            links = list(find_xml(data, namespaces, "//*[@href or @media-type]"))
            replacements = list(r for r in replace(links, 'yaml', 'xml') if r)
            update_xml(data, namespaces, replacements, links, 'href')

        new_file = dry_run_file(file) if dry_run else file

        with open(new_file, 'wb') as fd:
            fd.write(etree.tostring(data, encoding='utf-8', xml_declaration=True, pretty_print=True))

    except Exception as err:
        logging.exception(err)

def process_yaml(file, old='', new='', dry_run=False):
    """Analyze OSCAL YAML document instances and replace extensions for href
    fields accordingly.

    :param file: the original target path and file
    :type file: str

    :param old: the original file extension to match
    :type old: str

    :param new: the replacement file extension to replace upon match
    :type new: str

    :param dry_run: a setting, when True, that enables dry-run mode to prevent
    editing of the original target file; defaults to False
    :type dry_run: bool

    :return: an updated path and filename for writing dry run results
    :rtype: str    
    """
    try:
        with open(file) as fd:
            raw_data = fd.read()
            # Keep orderiing and formatting to the best extent possible, with
            # the round trip mode, rt.
            yaml = YAML(typ='rt')
            # Add back leading --- to output
            yaml.explicit_start = True
            # Indent sequences properly, to prevent this, no spaces before id.
            # roles:
            # - id: role-a
            yaml.indent(mapping=2, sequence=4, offset=2)
            # Do not rewrite " as ', keep double quotes.
            yaml.preserve_quotes = True
            # If you do not do this, datetimes are reformatted with microseconds.
            # See: https://stackoverflow.com/a/51002826
            yaml.constructor.yaml_constructors.pop(u'tag:yaml.org,2002:timestamp', None)
            data = yaml.load(raw_data)
            links = list(find(data, ['href', 'media-type']))
            replacements = list(r for r in replace(links, 'json', 'yaml') if r)
            update(data, replacements, links, 'href')

        new_file = dry_run_file(file) if dry_run else file

        with open(new_file, 'w') as fd:
            yaml.dump(data, fd)

    except Exception as err:
        logging.exception(err)

def dry_run_file(file):
    """Format a file name properly for dry-run mode, e.g. do not edit the original
    target file and return a modified path to modify a temporary file.

    :param file: the original target path and file
    :type file: str

    :return: an updated path and filename for writing dry run results
    :rtype: str
    """
    file, file_ext = os.path.splitext(file)
    return f"{file}_test{file_ext}"

def handler():
    """Core function that encapsulates complete operational logic of the script,
    as not to pollute the '__main__' scope.

    :return: None
    :rtype: None
    """
    parser = ArgumentParser(description='Convert file extensions in fields with hyperlinks for OSCAL JSON, XML, and YAML document instances.')
    parser.add_argument('--old-extension', '-o', dest='old', type=str, help='original file extension you want to convert from')
    parser.add_argument('--new-extension', '-n', dest='new', type=str, help='target file extension you want to convert to')
    parser.add_argument('-d', '--dry-run', action='store_true', help='Provide this argument to test by modifying an adjacent test file.')
    parser.add_argument('file', type=str, help='path of original file')

    args = parser.parse_args()

    _, file_ext = os.path.splitext(args.file)

    if file_ext == '.json':
        process_json(**vars(args))
    elif file_ext == '.xml':
        process_xml(**vars(args))
    elif file_ext == '.yaml':
        process_yaml(**vars(args))
    else:
        logging.error(f"Cannot convert invalid OSCAL file with extension '{file_ext}'.")
        sys.exit(1)

if __name__ == '__main__':
    handler()