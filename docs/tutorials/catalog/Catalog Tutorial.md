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
For more detail information on each schemas, the reader is referred to [XML Schema Reference](https://pages.nist.gov/OSCAL/documentation/schema/catalog/xml-schema/) 
and [JSON Schema Reference](https://pages.nist.gov/OSCAL/documentation/schema/catalog/json-schema/), respectively.

The root of the Control Catalog format is `catalog`. 
The tag also captures the document's *universally unique identifier* (`uuid`), a unique 128-bit number made of hexadecimal digits displayed as 32 characters with four hyphens in between.

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
Current tutorial will only illustrate next the mandatory elements used to represent the information available in the [Sample Security Catalog](./Catalog%20Sample.md)

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
The date needs to include the time zone. The published date is not a mandatory field for the `OSCAL Catalog`

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
Even though we finished representing the information available in the header of the file, the `metadata` has one other field that is mandatory - the OSCAL version. 
Current OSCAL version is 1.0.0 and the tag <oscal-version></oscal-version> is used to represent it.

```xml
      <oscal-version>1.0.0</oscal-version>
```
When necessary, revision history can be also documented. See additional information [here](https://pages.nist.gov/OSCAL/documentation/schema/catalog/xml-model-map/)


The `metadata` is also designed to accommodate the representation of other information related to the content of the catalog and the entity (individual or organization) that created it in OSCAL. 
For example, we can select and represent *keywords* using the property tag <prop></prop>, for which we define the `name` of the property as being *keywords*. 
The *keywords* will be a `string` comprised of a comma-separated list of significant words, in alphabetical order.

The information will look as follows:
```xml
       <prop name="keywords">Assurance, computer security, FISMA, Privacy Act, Risk Management Framework, security controls, security requirements</prop>
```

To do so, one can use the tags <role></role> and <party></party> each instance with a distinct `id`, and the tag <responsible-party></responsible-party> with the field `role-id` that identifies the id of the pointed role and the tag <party-id></party-id> that points to the `id` of the defined <party>.
In this example the <party> is an organization (NIST) for which the name is provided using the tag <or-name></org-name>, an email address is listed using the tag <email></email> and the URL using the tag <url>. 
Below is all this information assembled in OSCAL.

```xml
      <role id="creator">
         <title>Document creator</title>
      </role>
      <role id="contact">
         <title>Contact</title>
      </role>
      <party id="NIST">
         <org>
            <org-name>National Institute of Standards and Technology</org-name>
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
            <org-name>National Institute of Standards and Technology</org-name>
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

Analyzing the body of the [Catalog Sample](./Catalog%20Sample.md), we observe that the catalog has two sections:
1 and 2, each section contains subsections 1.1 and 2.1, which have an *Objective* and group together *Controls* that meet the same *Objective*. 
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

The above formatting of the document will be represented using nested `groups` for Section 1 with the nested Subsection 1.1 and for Section 2 with the nested Subsection 2.1.
A `group` tag <group> has an `id` and a `class`. 

Each `group` must contain a `title` identified by the tag <title></title> and may have none or many of the following elements:

```    
    * `parameters` identified by the tags <param></param>
    * `properties` identified by the tags <prop></prop>, and
    * `parts` identified by the tags <part></part>.
```

It is important to note here that the `id` of a `group` is expected to be a string. 

The Sections of the original document have numbers, and therefore, we define the `id` for each `group` to be 
the number of the Section and the Subsection respectively, with a leading character such as *s* in front.

We also represent the numerical value of the Section and of the Subsection as a `property` named *label*.

The structure of the Section 1 and the Subsection 1.1:

```
1 Organization of Information Security
  1.1 Internal Organization 
  [...]
```
 
could be represented as follows:

```
  <group class="section" id="s1">
    <title>Organization of Information Security</title>
    <prop name="label">1</prop>    
    <group class="ssc-iso-sc27" id="s1.1">
      <title>Internal Organization</title>
      <prop name="label">1.1</prop>
      [...]
    </group>
  </group>
```  
  
Let us put together the high-level information for both Sections' and their Subsections':
 
```
  <group class="section" id="s1">
    <title>Organization of Information Security</title>
    <prop name="label">1</prop>    
    <group class="ssc-iso-sc27" id="s1.1">
      <title>Internal Organization</title>
      <prop name="label">1.1</prop>
      [...]
    </group>
  </group> 
  <group class="section" id="s2">
    <title>Access control</title>
    <prop name="label">2</prop>    
    <group class="ssc-iso-sc27" id="s2.1">
      <title>Business requirements of access control</title>
      <prop name="label">2.1</prop>
      [...]
    </group>
  </group> 
```

To represent the information of each Subsection, we need to identify the appropriate OSCAL elements for the *Objective* and the `Controls`.
An *Objective* can be represented as a `part` named *item*. 
This `part` will also have an unique-to-the-document string `id` which can be used to reference the *Objective*.

An original *Objective* statement like the one below:

```
Objective: To establish a management framework [...] within the organization.
```
is represented as follows:

```
     <part id="s1.1_smt" name="item">
        <prop name="label">Objective:</prop>
          <p>To establish a management framework [...] within the organization.</p>
     </part>
```

Integrating the *Objective* into the above structure of the *Sample Security Catalog*, we get:

```
  <group class="section" id="s1">
    <title>Organization of Information Security</title>
    <prop name="label">1</prop>    
    <group class="ssc-iso-sc27" id="s1.1">
      <title>Internal Organization</title>
      <prop name="label">1.1</prop>
        <part id="s1.1_smt" name="item">
        <prop name="label">Objective:</prop>
          <p>To establish a management framework [...] within the organization.</p>
        </part>      
        [...]
    </group>
  </group>   
```

Following the *Objective*, the *Sample Security Catalog* describes the related *Controls*, their *Implementation guidance* and often
some additional information titled *Other information*. 

The structure of the first control, *1.1.1 Information security roles* is represented below:

```
    1.1.1 Information security roles 
    Control 
        All information security [...].  
    Implementation guidance
        Allocation of information security [...]
    Other information
        Many organizations appoint an [...]
```

To represent a *Control* and its content, the OSCAL element `control` identified by the tag <control></control> is used. 
The element `control` must have a <title></title>, and it may have none or many of the following elements:
 
```   
    * `parameter` identified by the tags <param></param>,
    * `property` identified by the tags <prop></prop>,
    * `annotation` identified by the tags <annotation></annotation>,
    * `link` identified by the tags <link</link>, and
    * `part` identified by the tags <part></part>.
```

Using the OSCAL elements in the same manner as for the `group`, the first *Control* in the *Sample Security Catalog* can be 
represented as below:

```
      <control class="ssc-iso-sc27" id="s1.1.1">
        <title>Information security roles and responsibilities</title>
        <prop name="label">1.1.1</prop>
        <prop name="sort-id">c01</prop>
        <part id="s1.1.1_stm" name="statement">
          <prop name="label">Control</prop>
            <p>All information security [...].</p>
        </part>
        <part id="s1.1.1_gdn" name="guidance">
          <prop name="label">Implementation guidance</prop>
          <part id="s1.1.1_gdn.1" name="guidance">
            <p>Allocation of information security [...]</p>
          </part>
          [...]
        </part>
        <part id="s1.1.1_inf" name="information">
          <prop name="lable">Other information</prop>
          <p>Many organizations appoint an [...]</p>
        </part>
      </control>
```

A similar approach of expressing the data is used to reformat the rest of all the `Controls` (1.1.2, 2.1.1 and 2.2.1)

#### Formatting a Back-matter

Often documents have references, links to other documents, diagrams/images, citations, remarks. 
OSCAL defines elements that can be used to represent such information.

Back-matters are optional elements and therefore often the OSCAL Catalogs will not contain any.

A back-matter element is identified by the tag <back-matter></back-matter>. 
This element may have `resources` which are identified with the tag <resources></resources>.     

Each `resource` may have:

```
    * `title` identified by the tags <title></title>
    * `description` identified by the tags <desc></desc>
    * `property` identified by the tags <prop></prop>
    * `document id` identified by the tags <doc-id></doc-id>
    * `citation` identified by the tags <citation></citation>
    * `link` identified by the tags <rlink></rlink>
    * `base64-binary-data` identified by the tags <base64></base64>
    * `remarks` identified by the tags <remarks></remarks>
```
Our catalog does not contain any back-matter, but additional information about the available 
elements and their fields, can be found [here](https://pages.nist.gov/OSCAL/documentation/schema/catalog/xml-model-map/)

### The Final Catalog

Assembling all the elements described above, we obtain the arching structure of the *Sample Security Catalog*: 

```
<?xml version="1.0" encoding="UTF-8"?>
<catalog xmlns="http://csrc.nist.gov/ns/oscal/1.0" 
         id="uuid-ed364452-47f8-4e70-b3a4-ef54de5f46ef">
  <metadata>
      <title>Sample Security Catalog</title>
      <published>2020-02-02T11:01:04.736-04:00</published>
      <last-modified>2020-10-02T11:01:04.736-04:00</last-modified>
      <version>1.0</version>
      <oscal-version>1.0.0</oscal-version>
      <prop name="keywords">Assurance, computer security, FISM, security controls, security requirements</prop>
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
  <group class="section" id="s1">
    <title>Organization of Information Security</title>
    <group class="ssc-iso-sc27" id="s1.1">
      <title>Internal Organization</title>
      <prop name="label">1.1</prop>
      <part id="s1.1_smt" name="item">
        <prop name="label">Objective:</prop>
          <p>To establish a management framework to initiate and control the implementation and operation of information security within the organization.</p>
      </part>
      <control class="ssc-iso-sc27" id="s1.1.1">
        <title>Information security roles and responsibilities</title>
        <prop name="label">1.1.1</prop>
        <prop name="sort-id">c01</prop>
        <part id="s1.1.1_stm" name="statement">
          <prop name="lable">Control</prop>
            <p>All information security responsibilities should be defined and
            allocated.</p>
        </part>
        <part id="s1.1.1_gdn" name="guidance">
          <prop name="lable">Implementation guidance</prop>
          <part id="s1.1.1_gdn.1" name="guidance">
            <p>Allocation of information security [...]</p>
          </part>
          <part id="s1.1.1_gdn.2" name="guidance">
            <p>Individuals with allocated information [...].</p>
          </part>
          <part id="s1.1.1_gdn.2" name="guidance">
            <p>Areas for which individuals are [...]</p>
              [...]
          </part> 
        </part>
        <part id="s1.1.1_inf" name="information">
          <prop name="lable">Other information</prop>
          <p>Many organizations [...].</p>
          
        </part>
      </control>
      <control class="ssc-iso-sc27" id="s1.1.2">
        <title>Segregation of duties</title>
        <prop name="label">1.1.2</prop>
        <prop name="sort-id">c02</prop>
        <part id="s1.1.2_stm" name="statement">
          <prop name="lable">Control</prop>
            <p>Conflicting duties [...]</p>
        </part>
        <part id="s1.1.2_gdn" name="guidance">
          <prop name="lable">Implementation guidance</prop>
          <part id="s1.1.2_gdn.1" name="guidance">
            <p>Care should be taken [...].</p>
          </part>
          <part id="s1.1.2_gdn.2" name="guidance">
            <p>Small organizations may [...].</p>
          </part>
        </part>
        <part id="s1.1.2_inf" name="information">
          <prop name="lable">Other information</prop>
          <p>Segregation of duties is [...].</p>
        </part>
      </control>
    </group>
  </group>
  <group class="section" id="s2">
    <title>Access control</title>
    <group class="ssc-iso-sc27" id="s2.1">
      <title>Business requirements of access control</title>
      <prop name="label">2.1</prop>
      <part id="s2.1_smt" name="item">
        <prop name="label">Objective:</prop>
          <p>To limit access to information and information processing facilities.</p>
      </part>
      <control class="ssc-iso-sc27" id="s2.1.1">
      <title>Access control policy</title>
        <prop name="label">2.1.1</prop>
        <prop name="sort-id">c03</prop>
        <part id="s2.1.1_stm" name="statement">
        <prop name="lable">Control</prop>
          <p>An access control policy should [...].</p>
        </part>
        <part id="s2.1.1_gdn" name="guidance">
          <prop name="lable">Implementation guidance</prop>
          <part id="s2.1.1_gdn.1" name="guidance">
            <p>Asset owners should determine [...].</p>
          </part>
          <part id="s2.1.1_gdn.2" name="guidance">
            <p>Access controls are both logical and physical [...].</p>
          </part>
          <part id="s2.1.1_gdn.3" name="guidance">
            <p>Users and service providers should [...].</p>
          </part>
          <part id="s2.1.1_gdn.4" name="guidance">
            <p>The policy should take account of the following:</p>
            [...]
          </part>
        </part>
        <part id="s2.1.1_stm" name="information">
          <prop name="lable">Other information</prop>
          <part id="s2.1.1_stm.1" name="information">
            <p>Care should be taken [...]</p>
            [...]
          </part>
          <part id="s2.1.1_stm.2" name="information">
            <p>Access control rules should [...].</p>
          </part>
          <part id="s2.1.1_stm.3" name="information">
            <p>Role based access control is [...].</p>
          </part>
          <part id="s2.1.1_stm.4" name="information">
            <p>Two of the frequent principles [...]:</p>
            [...]
          </part>
        </part>
      </control>
      <control class="ssc-iso-sc27" id="s2.1.2">
        <title>Access to networks and network services</title>
        <prop name="label">2.1.2</prop>
        <prop name="sort-id">c04</prop>
        <part id="s2.1.2_stm" name="statement">
          <prop name="lable">Control</prop>
          <p>Users should only be provided [...].</p>
        </part>
        <part id="s2.1.2_gdn" name="guidance">
          <prop name="label">Implementation guidance</prop>
          <part id="s2.1.2_gdn.1" name="guidance">
            <p>A policy should be [...]</p>
            [...]
          </part>
          <part id="s2.1.2_gdn.2" name="guidance">
            <p>The policy on the use of network [...]</p>
          </part>
        </part>      
      </control>
    </group>
  </group>
  <back-matter>
  </back-matter>
</catalog>
```


