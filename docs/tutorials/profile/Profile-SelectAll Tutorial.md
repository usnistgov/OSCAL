# OSCAL Profile Tutorial

## What is an OSCAL Profile

The OSCAL Profile layer defines a [model](https://pages.nist.gov/OSCAL/documentation/schema/profile/)  for selecting a specific set of security 
control requirements from one or more control catalogs. The term *profile* in OSCAL
is also called a *baseline* in the NIST SP 800-53 catalog or in FedRAMP's documentation. 
Additionally, the term *profile* in OSCAL covers the overlay concept defined in the 
NIST SP 800-53 catalog allowing for further tailoring of controls, modification of the requirements,
customization, interpretation and parameter values assignment. 

An OSCAL Profiles can be based on one or more catalogs of controls, or on other OSCAL Profiles.
 [OSCAL](https://www.nist.gov/oscal) website provides comprehensive information about the [OSCAL Profile Model](https://pages.nist.gov/OSCAL/documentation/schema/profile/)

Current tutorial focuses solely on a proprietary profile that **selects all the controls** from a catalog of security controls. 
The catalog of security controls used in this tutorial is the [Sample Security Catalog](../catalog/Catalog%20Tutorial.md), version 1.0, created for educational purpose.
The profile also *tailors* (modifies) control **1.1.1** to add additional *implementation guidance* and additional *information*.
This profile can be viewed [here](./Profile-SelectAll%20Sample.md).

##	Formatting the Profile into an OSCAL Profile

The OSCAL Model supports representation of a *profile* in either XML or JSON.
This tutorial describes the formatting of such *profile* in XML.

###	Profile Catalog Model

An `OSCAL Profile` (in XML or JSON) uses the respective schemas that describe the XML tag sets or the JSON data objects.
However, this tutorial is not focusing on the schemas themselves but rather on the formatting in OSCAL of the *profile* described above. 
For more information on each *profile* schemas, the reader is referred to [XML Schema Reference](https://pages.nist.gov/OSCAL/documentation/schema/profile/xml-schema/) 
and [JSON Schema Reference](https://pages.nist.gov/OSCAL/documentation/schema/profile/json-schema/), respectively.

The root of the Profile format is `profile`. 
The tag also captures the document's *universally unique identifier* (`uuid`), a unique 128-bit number made of hexadecimal digits displayed as 32 characters with four hyphens in between.

```xml
       <?xml version="1.0" encoding="UTF-8"?>
        <profile xmlns="http://csrc.nist.gov/ns/oscal/1.0" 
        id="uuid-956c32af-8a15-4732-a4d9-f976a1149c4b">
```

A `profile` contains:

- `metadata`    – it is mandatory to have one metadata
- `imports`     – may have none, or as many as necessary
- `merge`       – may have none, or as many as necessary
- `modify`      - may have none, or as many as necessary
- `back-matter` – may have none, or as many as necessary 

Let's discuss each of these elements in the following sections and identify which ones can be used to represent our catalog.

#### Profile's Metadata

The `metadata` has identical structure for all OSCAL files. 

A separate tutorial focuses on the elements of the `metadata`. 
Current tutorial will only illustrate next the mandatory elements used to represent the information available in the [Sample Security Catalog](./Catalog%20Sample.md)

```
# Sample Security Profile

## Case 1: Sellect All Controls 

            Version 1.0
            Published: 03.24.2020
            Last Modified: 03.24.2020
```
The `metadata` must include the `title` of the *profile* using the `<title></title>` tag.

```xml
      <title>Sample Security Profile - Select All Controls</title>
```

To represent the date when the document was published we use the tag `<published></published>`. 
The date needs to include the time zone. The published date is not a mandatory field for the `OSCAL Profile`

```xml
      <published>2020-03-24T11:01:04.736-04:00</published>
```

The `OSCAL Profile Model` requires the file to contain in the `metadata` the date and time with the timezone of the last modification of the file. 
This information is represented using the tag `<last-modified></last-modified>`

```xml
       <last-modified>2020-03-24T11:01:04.736-04:00</last-modified>
```

Another mandatory field for the `metadata` is the `version` of the file which must be included using the tag `<version>/<version>`.

```xml
      <version>1.0</version>
```
Even though we finished representing the information available in the header of the file, the `metadata` has one other field that is mandatory - the OSCAL version. 
Current OSCAL version is 1.0.0 and the tag `<oscal-version></oscal-version>` is used to represent it.

```xml
      <oscal-version>1.0.0</oscal-version>
```
When necessary, revision history can be also documented. See additional information [here](https://pages.nist.gov/OSCAL/documentation/schema/profile/xml-model-map/)


The `metadata` is also designed to accommodate the representation of other information related to the content of the *profile* and the entity (individual or organization) that created it in OSCAL. 
For example, we can select and represent *keywords* using the property tag `<prop></prop>`, for which we define the `name` of the property as being *keywords*. 
The *keywords* will be a `string` comprised of a comma-separated list of significant words, in alphabetical order.

The information will look as follows:
```xml
       <prop name="keywords">Assurance, computer security, FISMA, Privacy Act, Risk Management Framework, security controls, security requirements</prop>
```

To do so, one can use the tags `<role></role>` and `<party></party>`, each instance with a distinct `id`, and the tag `<responsible-party></responsible-party>` with the field `role-id` that identifies the id of the pointed role and the tag `<party-id></party-id>` that points to the `id` of the defined <party>.
In this example the `<party>` is an organization (NIST) for which the name is provided using the tag `<org-name></org-name>`, an email address is listed using the tag `<email></email>` and the URL using the tag `<url>`. 
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
We managed so far to complete the `metadata` of the [OSCAL Profile-SelectAll Sample](./Profile-SelectAll%20Sample.md). 

Putting together all the `metadata` information, we get:

```xml
   <metadata>
        <title>Sample Security Profile - Select All Controls</title>
        <published>2020-03-24T11:01:04.736-04:00</published>
        <last-modified>2020-03-24T11:01:04.736-04:00</last-modified>
        <version>1.0</version>
        <oscal-version>1.0.0</oscal-version>
        <prop name="keywords">Assurance, computer security, FISMA, security controls, security requirements</prop>
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

#### Formatting the Body of the OSCAL Profile

We discussed earlier that this [OSCAL Profile Sample](./Profile-SelectAll%20Sample.md) selects all the controls from the catalog.
The `OSCAL Profile` model defines the `<import></import>` element that designates the catalog, profile or resources from where the controls are selected.
The <import> element has the following content:
- `href`    - a required field that provides the URL of the referred resource
- `include` - used to specify the controls included, and can be used as many times as needed or not used at all
- `exclude` - used to specify de-select controls, and can be used as many times as needed or not used at all
Since an `include/all` (that is, all controls will be included by default) is assumed in the `OSCAL Profile` model when no `<include>` 
is given, we will use this default feature to generate our profile. 
Also, because our `Catalog` does not have nested `controls`, we will not need to explicitly `import/all` 
controls and explicitly set the `with-child-controls` flag.

The selection of all controls from the catalog can be simply represented as follows:

```xml
    <import href="../catalog/Catalog%20Sample.xml">
    </import>
```
In general, after selecting the controls, it is important to be able to merge them in resolution.
For this purpose, OSCAL has the `<merge></merge>` element that can be used to `combine` the controls and structure them the
 same way they are structured in the `Catalog`, by using the flag `as-is`, or provide a `custom` structure.   
 
 In our case, we will structure the controls the same way they were structured in the `Catalog`.
 
 ```xml
     <merge>
        <as-is>true</as-is>
    </merge>
``` 

As owners of the profile, we identified that the `Control` **1.1.1** with the `id=s1.1.1` requires modifications or tayloring.
To specify the changes we need to make to the control, we will use the `<modify>` element which allows us
to `<set-parameters>` and `<alter>` statements of the control. Our controls do not have parameters.

We will use the `<alter>` element and specify the `control-id` to indicate the control that is being modified.

```xml
        <alter control-id="s1.1.1">
            [...]
        </alter>
```

The element `<alter>` allows to:
- `remove`  - by using the tag `<remove></remove>` 
- `add`     - by using the tag `<add></add>`

In our case, we are not removing any statement form the control, but would like to add information at the end of the existing paragraph.
The first statement we want to add will be appended to the **Implementation guidance** of the `Control` with ID `control-id=s1.1.1` 

```xml
            <add position="ending" id-ref="s1.1.1_gdn">
                [...]
            </add>
```            

The second statement we want to add will be appended to the **Other information** section of the `Control` with ID `control-id=s1.1.1`

```xml
            <add position="ending" id-ref="s1.1.1_inf">
                [...]
            </add>            
```
Putting together the formationg discussed so far for altering or tailoring a control, we obtain:

```xml
        <alter control-id="s1.1.1">
            <add position="ending" id-ref="s1.1.1_gdn">
                [...]
            </add>
            <add position="ending" id-ref="s1.1.1_inf">
                [...]
            </add>            
        </alter>
```

The statement appended to the **Implementation guidance** reads: *The organizations should identify critical information system assets supporting essential missions and business functions.*
This statement will be introduced using the element `<part>` which has been previously introduced in the Catalog tutorial.

The element's description is available [here](https://pages.nist.gov/OSCAL/documentation/schema/profile/xml-schema/#part)

Through this element, we will provide the required `id` and `name` for the statement, 
a `<title>` for the modification and the added statement itself itself as a nested `<part>`, as follows:

```xml
                <part id="s1.1.1_smp_gnd" name="item" ns="sample">
                    <title>1.1.1 Additional Sample Profile Requirements and Guidance</title>
                    <part id="s1.1.1_smp_gnd.1" name="item" ns="sample">
                        <prop name="label">Implementation Guidance:</prop>
                        <p>The organizations should identify critical information system assets supporting essential missions and business functions.</p>    
                    </part>
                </part>
```

In a similar way is also represented the statement appended to the **Other Information** that
reads: *The appointed owners of the assets must report the results of assets' security verification to the information security manager.*

```xml
                <part id="s1.1.1_smp_inf" name="item" ns="sample">
                    <title>1.1.1 Additional Sample Profile Requirements and Guidance</title>
                    <part id="s1.1.1_smp_inf.1" name="item" ns="sample">
                        <prop name="label">Other Information:</prop>
                        <p>The appointed owners of the assets must report the results of assets' security verification
                            to the information security manager.</p>    
                    </part>
                </part>
``` 
Putting gother the 2 added statements, the tailoring of the `Control` **1.1.1** looks like:

```xml
       <alter control-id="s1.1.1">
            <add position="ending" id-ref="s1.1.1_gdn"> 
                <part id="s1.1.1_smp_gnd" name="item" ns="sample">
                    <title>1.1.1 Additional Sample Profile Requirements and Guidance</title>
                    <part id="s1.1.1_smp_gnd.1" name="item" ns="sample">
                        <prop name="label">Implementation Guidance:</prop>
                        <p>The organizations should identify critical information system assets supporting essential missions and business functions.</p>    
                    </part>
                </part>
            </add>
            <add position="ending" id-ref="s1.1.1_inf"> 
                <part id="s1.1.1_smp_inf" name="item" ns="sample">
                    <title>1.1.1 Additional Sample Profile Requirements and Guidance</title>
                    <part id="s1.1.1_smp_inf.1" name="item" ns="sample">
                        <prop name="label">Other Information:</prop>
                        <p>The appointed owners of the assets must report the results of assets' security verification
                            to the information security manager.</p>    
                    </part>
                </part>
            </add>
        </alter>
```        

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
Additional information about the available 
elements and their fields, can be found [here](https://pages.nist.gov/OSCAL/documentation/schema/catalog/xml-model-map/)

In our case, the `Profile` does not have specific information for the back-matter, but we can observe that the information
of the `Catalog` can be included in the back-matter as follows:

```xml
   <back-matter>
        <resource id="catalog">
            <desc>Catalog Sample (Derived from ISO/IEC 27002)</desc>
            <rlink href="../catalog/Catalog%20Sample.xml" media-type="application/oscal.catalog+xml"/>
        </resource>
    </back-matter>
```
With the `Catalog` defined here, the catalog id can be used as `uri` in the `<import></import>` elemet.

```xml
<import href="#catalog">
    </import>
```

### The Final Profile

Assembling all the elements described above, we obtain the arching structure of the *Profile SelectAll Sample*: 

```xml
<?xml version="1.0" encoding="UTF-8"?>
<profile xmlns="http://csrc.nist.gov/ns/oscal/1.0" 
    id="uuid-956c32af-8a15-4732-a4d9-f976a1149c4b">
    <metadata>
        <title>Sample Security Profile - Select All Controls</title>
        <published>2020-03-24T11:01:04.736-04:00</published>
        <last-modified>2020-03-24T11:01:04.736-04:00</last-modified>
        <version>1.0</version>
        <oscal-version>1.0.0</oscal-version>
        <prop name="keywords">Assurance, computer security, FISMA, security controls, security requirements</prop>
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
    <import href="#catalog">
    </import>
    <merge>
        <as-is>true</as-is>
    </merge>
    <modify>
        <!-- - - - - ALTER CONTROL - - - - - -->
        <!-- - - ISO-SC27 1.1.1 - -  -->
        <alter control-id="s1.1.1">
            <add position="ending" id-ref="s1.1.1_gdn"> 
                <part id="s1.1.1_smp_gnd" name="item" ns="sample">
                    <title>1.1.1 Additional Sample Profile Requirements and Guidance</title>
                    <part id="s1.1.1_smp_gnd.1" name="item" ns="sample">
                        <prop name="label">Implementation Guidance:</prop>
                        <p>The organizations should identify critical information system assets supporting essential missions and business functions.</p>    
                    </part>
                </part>
            </add>
            <add position="ending" id-ref="s1.1.1_inf"> 
                <part id="s1.1.1_smp_inf" name="item" ns="sample">
                    <title>1.1.1 Additional Sample Profile Requirements and Guidance</title>
                    <part id="s1.1.1_smp_inf.1" name="item" ns="sample">
                        <prop name="label">Other Information:</prop>
                        <p>The appointed owners of the assets must report the results of assets' security verification
                            to the information security manager.</p>    
                    </part>
                </part>
            </add>
        </alter>
        <!-- - - ISO-SC27 1.1.2 - -  -->
        <!-- - - ISO-SC27 2.1.1 - -  -->
        <!-- - - ISO-SC27 2.1.2 - -  -->  
    </modify>
    <back-matter>
        <resource id="catalog">
            <desc>Catalog Sample (Derived from ISO/IEC 27002)</desc>
            <rlink href="../catalog/Catalog%20Sample.xml" media-type="application/oscal.catalog+xml"/>
        </resource>
    </back-matter>
</profile>
```


