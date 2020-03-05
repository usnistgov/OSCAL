# OSCAL Catalog Tutorial

## What is an OSCAL Catalog
##	Example of a Proprietary Catalog 

An [OSCAL](https://www.nist.gov/oscal) Control Catalog is a machine-readable representation of a *catalog of security controls* which is a collection of *security controls* and related *control enhancements*, along with contextualizing documentation and metadata.

For the purpose of this tutorial, a proprietary catalog is created. The file is available for download [here](./Catalog%20Sample.md)

##	Formatting the Control Catalog into an OSCAL Catalog 

The OSCAL Catalog Model supports representation of a *catalog of security controls* in either XML or JSON.
This tutorial describes the formatting of such catalog in XML.
The [OSCAL](https://www.nist.gov/oscal) website provides comprehensive information about the [OSCAL Catalog Model](https://pages.nist.gov/OSCAL/documentation/schema/catalog/)

###	Control Catalog Model

An OSCAL catalog (in XML or JSON) uses the respective schemas that describe the XML tag sets or the JSON data objects.
However, this tutorial is not focusing on the schemas themselves but rather on the formatting in OSCAL of the proprietary control catalog listed above. 
For more detail information on each schemas, the reader is referred to [XML Schema Reference](https://pages.nist.gov/OSCAL/documentation/schema/catalog/xml-schema/) and [JSON Schema Reference](https://pages.nist.gov/OSCAL/documentation/schema/catalog/json-schema/), respectivly.

The root of the Control Catalog format is `catalog`. The tag also captures the document's *universally unique identifier* (`uuid`), a unique 128-bit number made of hexadecimal digits dispalyed as 32 characters with four hyphens in between.

```xml
       <?xml version="1.0" encoding="UTF-8"?>
       <catalog xmlns="http://csrc.nist.gov/ns/oscal/1.0"
            id="uuid-ed364452-47f8-4e70-b3a4-ef54de5f46ef">
```

A `catalog` contains:

- `metadata`    – it is mandatory to have one metadata
- `groups`      – may have none, or as many as necessary, and they can be nested
- `controls`    – may have none, or as many as necessary, and they can be nested
- `back-matter` – may have none, or as many as necessary 

Let's discuss each of these elements in the following sections and identify which ones can be used to represent our catalog.

#### Catalog's Metadata
The `metadata` has identical structure for all OSCAL files. 

A separate tutorial focuses on the elements of the `metadata`. 
Current tutorial will only ilustrate next the mandatory elements used to represent the information available in the [Sample Security Catalog](./Catalog%20Sample.md)

```
# Sample Security Catalog
            Version 1.0
            Published: 02.02.2020
            Last Modified: 02.10.2020
```
The `metadata` must include the `title` of the catalog using the <title></title> tag.

```xml
      <title>Sample Security Catalog</title>
```

To represent the date when the document was published we use the tag <published></published>. 
The date needs to include the timezone. The published date is not a mandotory field for the `OSCAL Catalog`

```xml
      <published>2020-02-02T11:01:04.736-04:00</published>
```

The `OSCAL Catalog Model` requires the file to contain in the `metadata` the date and time with the timezone of the last modification of the file. This information is represented using the tag <last-modified></last-modified>

```xml
       <last-modified>2020-10-02T11:01:04.736-04:00</last-modified>
```

Another mandatory field for the `metadata` is the `version` of the file which must be included using the tag <version>/<version>

```xml
      <version>1.0</version>
```
Eventhough we finished representing the information available in the header of the file, the `metadata` has one other field that is mandatory - the OSCAL version. 
Current OSCAL version is 1.0.0 and the tag <oscal-version></oscal-version> is used to represent it.

```xml
      <oscal-version>1.0.0</oscal-version>
```
When necessary, revision history can be also documented. See additional information [here](https://pages.nist.gov/OSCAL/documentation/schema/catalog/xml-model-map/)


The `metadate` is also designed to accomodate the representation of other information related to the content of the catalog and the entity (individual or organization) that created it in OSCAL. 
For example, we can select and represent *keywords* using the property tag <prop></prop>, for which we define the `name` of the property as being *keywords*. 
The *keywords* will be a `string` comprised of a comma-separated list of significant words, in alphabetical order.

The information will look as follows:
```xml
       <prop name="keywords">Assurance, computer security, FISMA, Privacy Act, Risk Management Framework, security controls, security requirements</prop>
```

To do so, one can use the tags <role></role> and <party></party> each instance with a distinct `id`, and the tag <responsible-party></responsible-party> with the field `role-id` that identifies the id of the pointed role and the tag <party-id></party-id> that points to the `id` of the defined <party>.
In this example the <party> is an organization (NIST) for which the name is provided using the tag <or-name></org-name>, an email address is listed using hte tag <email></email> and the URL using the tag <url>. 
Below is all this information assambled in OSCAL.

```xml
      <role id="creator">
         <title>Document creator</title>
      </role>
      <role id="contact">
         <title>Contact</title>
      </role>
      <party id="NIST">
         <org>
            <org-name>National Institute ofStandards and Technology</org-name>
            <email>oscal@nist.gov</email>
            <url>https://www.nist.gov/oscal</url>
         </org>
      </party>
      <responsible-party role-id="creator">
         <party-id>NIST</party-id>
      </responsible-party>
      <responsible-party role-id="contact">
         <party-id>NIST</party-id>
      </responsible-party>
```
We managed so far to complete the `metadata` of the [Sample Security Catalog](./Catalog%20Sample.md). 
Putting together all the `metadata` information, we get:

```xml
   <metadata>
      <title>Sample Security Catalog</title>
      <published>2020-02-02T11:01:04.736-04:00</published>
      <last-modified>2020-10-02T11:01:04.736-04:00</last-modified>
      <version>1.0</version>
      <oscal-version>1.0.0</oscal-version>
      <prop name="keywords">Assurance, computer security, FISMA, Privacy Act, Risk Management Framework, security controls, security requirements</prop>
      <role id="creator">
         <title>Document creator</title>
      </role>
      <role id="contact">
         <title>Contact</title>
      </role>
      <party id="NIST">
         <org>
            <org-name>National Institute ofStandards and Technology</org-name>
            <email>oscal@nist.gov</email>
            <url>https://www.nist.gov/oscal</url>
         </org>
      </party>
      <responsible-party role-id="creator">
         <party-id>NIST</party-id>
      </responsible-party>
      <responsible-party role-id="contact">
         <party-id>NIST</party-id>
      </responsible-party>
   </metadata>
```

#### Formatting the Body of the Control Catalog in OSCAL

Analyzing the body of the [Catalog Sample](./Catalog%20Sample.md), we observe that the catalog has two sections: 1 and 2, each section contains subsections 1.1 and 2.1, which have an `Objective` and group together controls that meet the same `Objective`. 
```
1 Organization of Information Security
  1.1 Internal Organization
      Objective: [...]
      1.1.1 Information security roles and responsibilities
            [...]      
      1.1.2 Segregation of duties
            [...]
2 Access Control
  2.1 Business Requirements of Access Control
      Objective: [...]
      2.1.1 Access control policy
            [...]
      2.1.2 Access to networks and network services
            [...]     
```
The above structure will be represented using nested `groups` for Section 1 with nested Subsection 1.1 and for Section 2 with nested Subsection 2.1.
A `group` tag <group> has an `id` and a `class`. Each `group` must contain a title identified by the tag <title></title> and may have `parameters` tagged with <param></param>.
A group may also contain `parts` tagged with the label <param></param>.

```
  <group class="section" id="s1">
    <title>Organization of Information Security</title>
    <group class="ssc-iso-sc27" id="s1.1">
      <title>Internal Organization</title>
      <prop name="label">1.1</prop>
      [...]
    </group>
  </group>
  <group class="section" id="s2">
    <title>Access control</title>
    <group class="ssc-iso-sc27" id="s2.1">
      <title>Business requirements of access control</title>
      <prop name="label">2.1</prop>
      [...]
    </group>
  </group>
```  


For each `Control`, the docuemnt provide also the `Implementation guidance` and often some additional information titled `Other information` 

        - Control [skip]
        - Implementation guidance [skip]
        - Other information [skip]

```
#### Formatting a Back-matter


