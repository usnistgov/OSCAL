---
title: OSCAL Profile Tutorial - Part2
description: A sample security control baseline.
---

## Generating a Profile By Explicitly Selecting Controls

**Prerequisite:** [Profile-SelectAll Tutorial](./Profile-SelectAll%20Tutorial.md)

We introduced the `OSCAL Profile` in the [Profile-SelectAll Tutorial](./Profile-SelectAll%20Tutorial.md), and the reader
is referred to the [part 1 tutorial](./Profile-SelectAll%20Tutorial.md) for the overlapping information, such as the `metadata`
and the `back-matter`.

In this tutorial we will only discuss two approaches of formatting in OSCAL a *profile* that contains a subset of 
controls existing in the [Catalog Sample](../catalog/Catalog%20Sample.md), focusing exclusively on the selection of the controls.

##	Formatting the Profile into an OSCAL Profile

Even though the `OSCAL Profile model` supports representation of a *profile* in either XML or JSON,
this tutorial focuses only on the XML representation of the *profile*.

###	Profile Catalog Model

The 2 distinct approaches of generating this new [Profile-SelectSpecific%20Sample.md](./Profile-SelectAll%20Sample.md) are focusing on:

1. including all the controls using the same approach described in the [Profile-SelectAll Tutorial](./Profile-SelectAll%20Tutorial.md) and then excluding explicitly the controls that are not needed.
1. explicitly including only the desired controls.

#### Method 1

In the [Profile-SelectAll Tutorial](./Profile-SelectAll%20Tutorial.md) we described the element `<import></import>`, and
used the default `include/all` assumption of the element when no specific `<include>` is specified. 

In this method of generating the `OSCAL Profile` we will use the same approach of importing all 
controls from the [Catalog Sample](../catalog/Catalog%20Sample.md), and specifically
exclude the non-desired controls.

```xml
    <import href="#catalog">
        <!-- IMPORT ALL CONTROLS & EXCLUDE THE ONES NOT NEEDED -->
        <exclude>
            <call control-id="s1.1.2"></call>
            <call control-id="s2.1.2"></call>
        </exclude>
   </import>
```

The rest of the [Profile SelectSpecific Sample](./Profile-SelectSpecific%20Sample.md) is generated identical to the
[OSCAL Profile SelectAll Sample](./Profile-SelectAll%20Sample.xml).

It is important to note that the modifications done to the `Control` **1.1.1** are not applied 
in the current `Profile`.

The overall OSCAL Profile with this method will become:

```xml
<profile xmlns="http://csrc.nist.gov/ns/oscal/1.0" 
    id="uuid-8b16079e-27c5-4360-85db-1d6438e8e9c2">
    <metadata>
        <title>Sample Security Profile - Select Specific Controls - Method 1</title>
        <published>2020-03-24T12:01:04.736-04:00</published>
        <last-modified>2020-03-24T12:01:04.736-04:00</last-modified>
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
        <!-- IMPORT ALL CONTROLS & EXCLUDE THE ONES NOT NEEDED -->
        <exclude>
            <call control-id="s1.1.2"></call>
            <call control-id="s2.1.2"></call>
        </exclude>
   </import>
    <merge>
        <as-is>true</as-is>
    </merge>
    <back-matter>
        <resource id="profile-selectall">
            <desc>Profile SelectAll Sample (Derived from ISO/IEC 27002)</desc>
            <rlink href="../profile/Catalog%20Sample.xml" media-type="application/oscal.profile+xml"/>
        </resource>
    </back-matter>
</profile>
```

#### Method 2

The same [Profile SelectSpecific Sample](./Profile-SelectSpecific%20Sample.md) can be obtained in OSCAL
by explicitly including the desired controls from the [Profile SelectAll Sample](./Profile-SelectAll%20Sample.xml).

We need to reiterate that the `import/all` default assumption is no longer applicable if the `<include>` element is invoked.
Therefore, we will have to explicitly list all controls that are needed.

```xml
    <import href="#catalog">
        <!-- IMPORT ONLY SPECIFIC CONTROLS -->
        <include>
            <call control-id="s1.1.1"></call>
            <call control-id="s2.1.1"></call>
        </include>
   </import>
```
Putting together the other parts of the `OSCAL Profile` (`metadata`, `merge`, `back-matter`) 
as described in the [Profile-SelectAll Tutorial](./Profile-SelectAl%20Tutorial.md), the
the [Profile SelectSpecific Sample](./Profile-SelectSpecific%20Sample.md) can be represented in OSCAL as follows:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<profile xmlns="http://csrc.nist.gov/ns/oscal/1.0" 
    id="uuid-8b16079e-27c5-4360-85db-1d6438e8e9c2">
    <metadata>
        <title>Sample Security Profile - Select Specific Controls - Method 2</title>
        <published>2020-03-24T12:30:04.736-04:00</published>
        <last-modified>2020-03-24T12:30:04.736-04:00</last-modified>
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
        <!-- IMPORT ONLY SPECIFIC CONTROLS -->
        <include>
            <call control-id="s1.1.1"></call>
            <call control-id="s2.1.1"></call>
        </include>
   </import>
    <merge>
        <as-is>true</as-is>
    </merge>
    <back-matter>
        <resource id="catalog">
            <desc>Catalog Sample (Derived from ISO/IEC 27002)</desc>
            <rlink href="../profile/Catalog%20Sample.xml" media-type="application/oscal.catalog+xml"/>
        </resource>
    </back-matter>
</profile>
```