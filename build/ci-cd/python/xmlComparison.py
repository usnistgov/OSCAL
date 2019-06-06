# imports
import sys
from lxml import etree
from printColors import bcolors

def compare(e1, e2):
    return compareElements(e1, e2, "/*[1]", 0)

def compareElements(e1, e2, xpath, position):
    #print "xpath: "+xpath
    #print e1.tag + " : " +e2.tag

    e1Qname = etree.QName(e1.tag);
    e2Qname = etree.QName(e2.tag);

    if e1Qname.localname != e2Qname.localname:
        print(bcolors.FAIL + "Element names differ at path: "+xpath + bcolors.ENDC)
        return False
    if e1Qname.namespace != e2Qname.namespace:
        print(bcolors.FAIL + "Element namespaces differ at path: "+xpath + bcolors.ENDC)
        return False

    retval=True
    # check attributes
    if len(e1.attrib) != len(e2.attrib):
#        print("%d != %d" % (len(e1.attrib), len(e2.attrib)))
        print(bcolors.FAIL + "Different number of attributes at path: "+xpath + bcolors.ENDC)
        retval = False
    else:
        for attrKey in e1.attrib.keys():
            attrValue1 = e2.get(attrKey)
            attrValue2 = e2.get(attrKey)
#            print attrKey + ": " + attrValue1 + " : " + attrValue2
            if attrValue1 != attrValue2:
                print(bcolors.FAIL + "Different attribute values at path: "+xpath+"/@"+ attrKey + bcolors.ENDC)
                retval = False
    # check text
    if e1.text != e2.text:
        print(bcolors.FAIL + "Different text at path: "+xpath+"/text()" + bcolors.ENDC)
        retval = False

    # check child elements
    children1=e1.getchildren()
    children2=e2.getchildren()
    if len(children1) != len(children2):
#        print("%d != %d" % (len(children1), len(children2)))
        print(bcolors.FAIL + "Different number of children at path: "+xpath + bcolors.ENDC)
        retval = False
    else:
        # Check children
        pos=0
        for child1 in children1:
            pos += 1
            if etree.iselement(child1):
                child2 = children2[pos-1]
                if not compareElements(child1, child2, xpath + "/*["+str(pos)+"]" , 0):
                    retval = False

    return retval


###########################################################################
#   Main Program Logic
###########################################################################

# get the file names from the command line arguments
xml1 = sys.argv[1]
xml2 = sys.argv[2]

# parse the documents
doc1 = etree.parse(xml1)
doc2 = etree.parse(xml2)

# get the root element
root1 = doc1.getroot()
root2 = doc2.getroot()

if not compare(root1, root2):
    print ("compare failed")
    sys.exit(1)
