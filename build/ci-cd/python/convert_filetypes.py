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

def find(data={}, lookups=[], path=None):
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

def find_xml(data={}, namespaces={}, lookups=None):
    for result in list(data.xpath(lookups, namespaces=namespaces)):
        yield { 
            'path': get_full_xpath(result),
            **result.attrib
        }

def get_full_xpath(element=None):
    if element.getparent() is None: return f"/{element.tag}"
    return f"{get_full_xpath(element.getparent())}/{element.tag}"

def replace(items=[{}], old='', new=''):
    for i in items:
        update = {}

        for k in i.keys():
            old_value = i[k]
            update[k] = old_value.replace(old, new) if isinstance(old_value, str) else old_value

            if k != 'path' and update[k] != old_value:
                update['original'] = {} if not update.get('original') else update.get('original')
                update['original'][k] = old_value

        if update == i:
            yield

        else:
            yield update

def pick(data={}, path=[]):
    return reduce(operator.getitem, path, data)

def pick_xml(data={}, namespaces={}, path=None):
    results = data.xpath(path, namespaces=namespaces)
    if len(results) > 0: return results[0]

def update(data, updates=[{}], originals=[{}], compare_key=None):
    maybe_dupes = [o.get(compare_key) for o in originals]

    for update in updates:
        if update.get(compare_key) in maybe_dupes:
            continue

        target = pick(data, update.get('path'))

        for k in update.keys():
            if target.get(k) and not k == 'path' and not k == 'original':
                target[k] = update[k]

def update_xml(data, namespaces={}, updates=[{}], originals=[{}], compare_key=None):
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
    try:
        with open(file) as fd:
            raw_data = fd.read()
            data = json.loads(raw_data)
            links = list(find(data, ['href', 'media-type']))
            replacements = list(r for r in replace(links, 'xml', 'json') if r)
            update(data, replacements, links, 'href')

        new_file = dry_run_file(file) if dry_run else file

        with open(new_file, 'w') as fd:
            json.dump(data, fd, indent=2)

    except Exception as err:
        logging.exception(err)

def process_xml(file, old='', new='', dry_run=False):
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
    file, file_ext = os.path.splitext(file)
    return f"{file}_test{file_ext}"

def process():
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
    process()