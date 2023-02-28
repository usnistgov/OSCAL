# Profile Resolver Pipeline

Profile resolution is implemented here as a sequence of XSLT transformations. The sequence applies to defined inputs (a **source profile** with imported **catalog** sources) and produces defined outputs (a **profile resolution result** in the form of a catalog). The word **baseline** also refers to a particular profile in application, whether in its unprocessed form or its resolved, serialized form.

The sequence of XSLT transformations reflects and roughly corresponds to the steps in profile resolution described for OSCAL in the [Profile Resolution Specification](https://pages.nist.gov/OSCAL/concepts/processing/profile-resolution/):

- **selection**: importing catalogs or profiles, and selecting controls from them

- **organization (merging)**: organizing the selected controls for the output representation

- **modification**: setting parameters and potentially supplementing, amending or editing control text

## Usage

The entry point for the transformation pipeline is `oscal-profile-RESOLVE.xsl`, which invokes the transformation steps in sequence, taking the source profile document as primary input.

The following additional parameters can be used to modify the transformation pipeline's behavior:

| Name                      | Description                                                                                                                                                                                                                                                                                                                                                                                                                           | Default                                      |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------- |
| `hide-source-profile-uri` | If `true`, the output catalog's metadata does not record the source profile's URI.                                                                                                                                                                                                                                                                                                                                                    | `false`                                      |
| `path-to-source`          | Path from output catalog to location of source profile.                                                                                                                                                                                                                                                                                                                                                                               | None                                         |
| `top-uuid`                | UUID value for top-level element in output catalog, if `uuid-method` is `user-provided`.                                                                                                                                                                                                                                                                                                                                              | None                                         |
| `uuid-method`             | Method for computing UUID of top-level element in output catalog. Valid values are: `random-xslt`, in which case the `random-number-generator` XPath function must be available; `random-java`, in which case the `java.util.UUID.randomUUID()` Java method must be available; `user-provided`, in which case you must specify the `top-uuid` parameter; `web-service`, referring to the `uuid-service` parameter value; and `fixed`. | `fixed`                                      |
| `uuid-service`            | URI for a web service that produces a UUID, if `uuid-method` is `web-service`.                                                                                                                                                                                                                                                                                                                                                        | `https://www.uuidgenerator.net/api/version4` |
| `trace`                   | If set to `on`, additional debug information will be printed to the console and `opr:ERROR`, `opr:WARNING` messages will be retained in the output document.                                                                                                                                                                                                                                                                          | None                                         |

Note that URIs (addresses) given in a profile document must link correctly as absolute or relative paths to their imported catalogs, as demonstrated in [examples](../../../specifications/profile-resolution/profile-resolution-examples).

A serialized output of profile resolution takes the form of an OSCAL catalog. Assuming inputs are correctly formed, the output is valid to the catalog schema.

## Invoking the Pipeline

The profile resolver and other utilities in this repo rely on open-source libraries and utilities developed by third parties. To review the software version used by this project, please review [the `build` directory for manifests of software and the specific versions](../../../../build) we recommend for running utilities from this repo, specifically the recommended [version of Saxon XSLT processor defined in the pom.xml manifest](../../../../build/pom.xml).

### Using Saxon From the Command Line

Before you begin:

- Install the Java runtime using your preferred method.
- Download a compatible version of [Saxon Java Home Edition](https://www.saxonica.com/download/java.xml) and extract the `saxon-he` jar file.

  _Note: as stated above, Saxon 11 and 12 are currently unsupported. Saxon 10 must be downloaded from [Saxon's archive page](https://www.saxonica.com/products/archive.xml)_

Invoke Saxon with your document and the profile resolution stylesheet as follows:

```
$ java -jar /path/to/saxon-he-10.x.jar -t -s:YOUR_PROFILE_DOCUMENT.xml -xsl:path/to/oscal-profile-RESOLVE.xsl -o:YOUR_RESULT_BASELINE.xml
```

Saxon allows users to specify additional parameters (such as the ones specified [above](#usage)) by adding arguments with the format `name=value` to the end of the above command. As an example, see the command:

```bash
$ java -jar /path/to/saxon-he-10.x.jar -t -s:YOUR_PROFILE_DOCUMENT.xml -xsl:path/to/oscal-profile-RESOLVE.xsl -o:YOUR_RESULT_BASELINE.xml uuid-method=random-xslt hide-source-profile-uri=true
```
