# OSCAL Content Upgrade Transforms

The NIST OSCAL Team provides XSLT transforms to upgrade OSCAL document instances sequentially from one version of OSCAL to another. Currently, there are following content-upgrade transforms:

- [v1.0.0-milestone1](https://github.com/usnistgov/OSCAL/releases/tag/v1.0.0-milestone1) to [v1.0.0-milestone2](https://github.com/usnistgov/OSCAL/releases/tag/v1.0.0-milestone2)
- [v1.0.0-milestone2](https://github.com/usnistgov/OSCAL/releases/tag/v1.0.0-milestone2) to [v1.0.0-milestone3](https://github.com/usnistgov/OSCAL/releases/tag/v1.0.0-milestone3)
- [v1.0.0-milestone3](https://github.com/usnistgov/OSCAL/releases/tag/v1.0.0-milestone3) to [v1.0.0-rc1](https://github.com/usnistgov/OSCAL/releases/tag/v1.0.0-rc1)
- [v1.0.0-rc1](https://github.com/usnistgov/OSCAL/releases/tag/v1.0.0-rc1) to [v1.0.0-rc2](https://github.com/usnistgov/OSCAL/releases/tag/v1.0.0-rc2)
- [v1.0.0-rc2](https://github.com/usnistgov/OSCAL/releases/tag/v1.0.0-rc2) to [v1.0.0](https://github.com/usnistgov/OSCAL/releases/tag/v1.0.0)

## How do I upgrade the content?

### Content Upgrades on the Command Line

You should install [a current Java Runtime Environment](https://www.oracle.com/java/technologies/downloads/) and [Saxon HE 10.x](http://saxon.sourceforge.net/) Java-based runtime to run the content upgrade transforms on the command line. You can use alternative XSLT processors, in different language runtimes and/or without the Saxon project. You must, however, use an XSLT processor that supports [XSLT 3.0, at a minimum](https://www.w3.org/TR/xslt-30/). This tutorial uses Saxon HE as an example.

After you installed the Java Runtime Environment and Saxon HE, to transform a sample OSCAL document `catalog_v1.0.0-rc2.xml`, upgrade its content from v1.0.0 Release Candidate 2 to v1.0.0, and save the result in the file `catalog_v1.0.0.xml`, you will execute a command like so in your Linux, macOS, or Windows terminal:

```sh
java -cp Saxon-HE-10.6.jar net.sf.saxon.Transform -xsl:oscal-rc2-v1-0-0-update.xsl -s:catalog_v1.0.0-rc2.xml -o:catalog_v1.0.0.xml
```

### Content Upgrades with Oxygen XML Editor

If you prefer the use of an integrated development environment (IDE), you can use [the Oxygen XML Editor](https://www.oxygenxml.com/) to [configure and execute XSLT transforms](https://www.oxygenxml.com/doc/ug-oxygen/topics/xslt-tab.html). This IDE embeds a Java Runtime Environment and multiple versions of the Saxon XSLT processor for you convenience.

After you installed the Oxygen XML Editor, to transform a sample OSCAL document `catalog_v1.0.0-rc2.xml`, upgrade its content from v1.0.0 RC2 to v1.0., and save the result in the file `catalog_v1.0.0.xml`, you can configure the XSLT transform to your preference in the XSLT tab or like so:

- Name: oscal-rc2-v1-0-0-update
- XSLT:
  - XML URL: file:/path/to/samples/catalog_v1.0.0-rc2.xml
  - XSLT URL: file:/path/to/repo/OSCAL/src/release/content-upgrade/oscal-rc2-v1-0-0-update.xsl
- Output:
  - Save As: file:/path/to/results/catalog_v1.0.0.xml
  - Show in results view as:
    - [X] XML
    - [ ] SVG
    - [ ] XHTML

## Can I customize the content upgrade process?

Please review each transform (or [contact us for more help](https://pages.nist.gov/OSCAL/contact/)) to see additional parameters provided to customize the transform process. Important runtime parameters are documented below.

### `schema-location`: Enable `xsi:schemaLocation` attribute in OSCAL document root node

By default, you will upgrade content in a document instance and it does not explicitly add a `xsi:schemaLocation` attribute every time. Often, `xsi:schemaLocation` can be a local path or remote URI that is frequently out of date. The `xsi:schemaLocation` is an empty string by default (`''`), and it will not be included and the transform will emit a warning message.

If you do wish to explicit add `xsi:schemaLocation`, you can apply the transform on the command line like so:

```sh
java -cp Saxon-HE-10.6.jar net.sf.saxon.Transform -xsl:oscal-rc2-v1-0-0-update.xsl -s:catalog_v1.0.0-rc2.xml -o:catalog_v1.0.0.xml schema-location="'http://csrc.nist.gov/ns/oscal/1.0 ../../../../../xml/schema/oscal_catalog_schema.xsd'"
# using both quotes like this "' is required; this parameter is a single XML string
```

Similarly, you can specify this parameter in [the XSLT transform's' parameter context menu Oxygen XML Editor](https://www.oxygenxml.com/doc/ug-editor/topics/xslt-stylesheet-parameters.html) or configuring appropriately in the IDE of your choice.

## Frequently Asked Questions

### What do you do if you have OSCAL documents in JSON or YAML format?

See the [converter artifact usage section of the build README](../../../build/README.md#converters).

### What do you do if you are several versions behind?

You cannot upgrade multiple versions in one operation, you must upgrade sequentially from version to version to upgrade content appropriately.

For example, if you have content in `v1.0.0-rc1` you must upgrade from `v1.0.0-rc1` to `v1.0.0-rc2`, then you must upgrade from `v1.0.0-rc2` to `v1.0.0`. You cannot directly upgrade from `v1.0.0-rc1` to `v1.0.0`.
