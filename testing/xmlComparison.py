# imports
from lxml import etree
from StringIO import StringIO
import sys
from printColors import bcolors

# get the file names from the command line arguments
xml1 = sys.argv[1]
xml2 = sys.argv[2]

# open and read xml file 1
with open(xml1, 'r') as xml1_file:
    xml1_to_parse = xml1_file.read()

# open and read xml file 2
with open(xml2, 'r') as xml2_file:
    xml2_to_parse = xml2_file.read()

# parse the documents
doc1 = etree.parse(StringIO(xml1_to_parse))
doc2 = etree.parse(StringIO(xml2_to_parse))

# get the root element
root1 = doc1.getroot()
root2 = doc2.getroot()

# class for comparing elements
class Element:
    def __init__(self,e, intLevel):
        self.name = e.tag
        self.subs = {}
        self.atts = {}
        self.value = e.text
        self.level = intLevel
        for child in e:
            self.subs[child.tag + str(self.level + 1)] = Element(child, (self.level + 1))

        for att in e.attrib.keys():
            self.atts[att] = e.attrib[att]

        #debugging print
        #print "name: %s, Number of Children = %d, Number of Attributes = %d" % ( self.name, len(self.subs), len(self.atts) )

    # function to compare two XML branches
    def compare(self,el):
        if self.name != el.name:
            raise RuntimeError("Two names are not the same")
        print("----------------------------------------------------------------")
        print(self.name + ", Level: " + str(self.level))
        print("----------------------------------------------------------------")
        
        # check values
        if self.value == el.value:
            print(bcolors.OKGREEN + "Value Match" + bcolors.ENDC)
            if self.value is not None:
                print(bcolors.OKGREEN + "Original: " + self.name + " = " + self.value + bcolors.ENDC)
            else:
                print(bcolors.OKGREEN + "Original: " + self.name + " = N/A (No value provided)" + bcolors.ENDC)
            if el.value is not None:
                print(bcolors.OKGREEN + "Composed: " + el.name + " = " + el.value + bcolors.ENDC)
            else:
                print(bcolors.OKGREEN + "Composed: " + el.name + " = N/A (No value provided)" + bcolors.ENDC)
        else:
            print(bcolors.FAIL + "ERROR: Value Mismatch" + bcolors.ENDC)
            if self.value is not None:
                print(bcolors.FAIL + "Original: " + self.name + " = " + self.value + bcolors.ENDC)
            else:
                print(bcolors.FAIL + "Original: " + self.name + " = N/A (No value provided)" + bcolors.ENDC)
            if el.value is not None:
                print(bcolors.FAIL + "Composed: " + el.name + " = " + el.value + bcolors.ENDC)
            else:
                print(bcolors.FAIL + "Composed: " + el.name + " = N/A (No value provided)" + bcolors.ENDC)
        
        # check attribute count
        if len(self.atts) != len(el.atts):
            print(bcolors.FAIL + "ERROR: Different number of attributes between original and composed." + bcolors.ENDC)
            print(bcolors.FAIL + "Original Count: " + str(len(self.atts)) + bcolors.ENDC)
            print(bcolors.FAIL + "Composed Count: " + str(len(el.atts)) + bcolors.ENDC)
        
        # see which attributes are missing
        if len(self.atts) > len(el.atts):
            # see what is missing
            for att in self.atts.keys():
                if att not in el.atts.keys():
                    print(bcolors.FAIL+ "ERROR: Missing Attribute" + bcolors.ENDC)
                    print(bcolors.FAIL + att + " attribute not found in composed file." + bcolors.ENDC)
        elif len(el.atts) > len(self.atts):
            # see what is missing
            for att in el.atts.keys():
                if att not in self.atts.keys():
                    print(bcolors.FAIL+ "ERROR: Missing Attribute" + bcolors.ENDC)
                    print(bcolors.FAIL + att + " attribute not found in original file." + bcolors.ENDC)

        # loop through each attribute and make sure the values match
        for att in self.atts.keys():
            if att in el.atts.keys():
                if self.atts[att] == el.atts[att]:
                    #attribute match
                    print(bcolors.OKGREEN + "Attribute Match" + bcolors.ENDC)
                    print(bcolors.OKGREEN + "Original: " + att + " = " + self.atts[att] + bcolors.ENDC)
                    print(bcolors.OKGREEN + "Composed: " + att + " = " + el.atts[att] + bcolors.ENDC)
                else:
                    print(bcolors.FAIL + "ERROR: Attributes Do Not Match" + bcolors.ENDC)
                    print(bcolors.FAIL + "Original: " + att + " = " + self.atts[att] +  bcolors.ENDC)
                    print(bcolors.FAIL + "Composed: " + att + " = " + el.atts[att] + bcolors.ENDC)
                    
            
        # check children count
        if len(self.subs) != len(el.subs):
            print(bcolors.FAIL + "ERROR: Different number of children between original and composed." + bcolors.ENDC)
            print(bcolors.FAIL + "Original Count: " + str(len(self.subs)) + bcolors.ENDC)
            print(bcolors.FAIL + "Composed Count: " + str(len(el.subs)) + bcolors.ENDC)
        else:
            print(bcolors.OKGREEN + "Number of children matches: " + str(len(self.subs)) + bcolors.ENDC)

        # check children
        for subName in self.subs.keys():
            if subName not in el.subs.keys():
                print(bcolors.FAIL + "ERROR: Missing Children" + bcolors.ENDC)
                print(bcolors.FAIL + subName + " is not in both files." + bcolors.ENDC)
            else:
                print(bcolors.OKGREEN + "Matching Children" + bcolors.ENDC)
                print(bcolors.OKGREEN + subName + " child is in both files." + bcolors.ENDC)
        
        # if they match, keep going down the tree, moved out of the if statement above to ensure all matching shows
        for subName in self.subs.keys():
            if subName in el.subs.keys():
                self.subs[subName].compare(el.subs[subName])

#set the initial level
level = 0

# establish the elements to compare
e1 = Element(root1, level)
e2 = Element(root2, level)

# do the detailed comparison
e1.compare(e2)
