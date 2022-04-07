---
title: OSCAL Style Guide
description: (with links) Contributors to OSCAL can save time by scanning this early.
heading: OSCAL Style Guide
weight: 10
sidenav:
    title: OSCAL Style Guide
toc:
    enabled: true
    headingselectors: h2,h3,h4,h5
    collapsedepth: 4
custom_css:
  - oscal-styleguide.css
---

## Goals, scope and audience

This style guide is offered for authors and editors contributing to the NIST OSCAL project and related projects. Use it as a reference of first resort for questions of style or styling in contributions to OSCAL (treated broadly). At the foot are links to more extensive resources, which we recommend.

The coverage here aims to be helpful and suggestive rather than normative. Feel free to create an [Issue on Github](https://github.com/usnistgov/OSCAL/issues/new?labels=User+Story%2C+enhancement%2C+Scope:%20Website&template=feature_request.md) to raise questions or points of discussion regarding either style (covered or not covered) or the Style Guide itself.

The styling on our web sites is enabled and limited by the back-end architecture we use to produce and maintain them, the [US Web Design System](https://designsystem.digital.gov/), which we deliver via an [implementation](https://pages.nist.gov/hugo-uswds-docs/) of  [Hugo](https://gohugo.io/). See more below under [Hugo and Markdown](#hugo-and-markdown). Much of this guide assumes you are writing for a web site such as the [OSCAL web site](https://pages.nist.gov/OSCAL/) or for web-accessible resources such as `readme` documents in Github, and may be more or less applicable for other cases. Writing for OSCAL, we must rely on our readers to distinguish what advice is clearly not appropriate or useful to them, and the same rule applies to this page.

Keep in mind when writing for OSCAL that the potential audience is very wide and includes an international general public.

This Style Guide will change over time. The best way to track its revisions is by means of its Github commit history.

## Layout and formatting

Our Pages site is produced under CI/CD (continuous integration/continuous deployment) by a static site generator build using the Hugo application to support the [US Web Design System](https://designsystem.digital.gov/). See its Github site at https://github.com/usnistgov/hugo-uswds.

This development model gives us great flexibility. We write most pages in Markdown, using Hugo's scripting to provide a web scaffolding around this content, along with all the styling logic. For certain structured information sets including indexes and structured reference documents, Hugo will also copy through contents that are generated for it prior to deployment.

For practical purposes this means that authors make choices about language and organization, but not about layout, design detail or page navigation, as these can for the most part be engineered.

### Colors

See the [USWDS color pallette]( https://designsystem.digital.gov/design-tokens/color/system-tokens/) for colors designed for consistency with the USWDS color themes.

When designing diagrams with color schemes, remember that not all readers see colors the same; some research on color-accessible web design may be enlightening.

### Custom CSS

Our Hugo installation allows a page to declare its own CSS, to support custom styling. For example, this page calls in `oscal-styleguide.css`, which provides styling to <q>BigRed</q> elements: <span class="BigRed">for writing things big, and red</span>. The CSS file must be placed in the `assets` directory as stated in [the documentation](https://pages.nist.gov/hugo-uswds-docs/documentation/hugo/customizing-css-and-js/).

Note that the YAML header on a Markdown page, where custom CSS or other page configurations are set, is sensitive to format. It matters whether a data item is a string an array member, which means it matters where you put your line feeds:

```yaml
custom_css:
  - yourstyle.css
```

Not

```yaml
custom_css: yourstyle.css
```

### Demo page

This page also serves as a demo. Any feature on this page can be seen in action by looking at the Markdown source code from which the description of the feature is produced. (So *look here* to see some italics.)

### Diagrams

For diagrams (not bitmap images such as photos or scans) we much prefer SVG, as clean as you can make it, due to its scalability, adaptability and versatility.

Like any web site, Hugo will also serve JPEG and PNG formats to browsers, but it will not be as easy to align colors and fonts. `alt` tagging is always wanted on any images called in as files, as described under [Images](#images).

#### Mermaid diagrams

For certain kinds of diagrams, our Hugo theme also supports inline [Mermaid notation](https://mermaid-js.github.io/mermaid/#/). A Hugo shortcode is used to demarcate input for Mermaid to interpret and plot, so for

```
{{</* mermaid */>}}
pie
    title Ice Cream Preferences
    "Vanilla" : 50
    "Chocolate Fudge" : 35
    "Pistachio" : 10
    "Peppermint" : 5
{{</* /mermaid */>}}    
```

Hugo (with help from MermaidJS) produces

{{< mermaid >}}
pie
    title Ice Cream Preferences
    "Vanilla" : 50
    "Chocolate Fudge" : 35
    "Pistachio" : 10
    "Peppermint" : 5
{{< /mermaid >}}

### Hugo and Markdown

* [Hugo](https://gohugo.io/) - static site generator
* [US Web Design System](https://designsystem.digital.gov/)
* Our [implementation](https://pages.nist.gov/hugo-uswds-docs/) of USWDS in Hugo

Keep in mind when editing Markdown files that Markdown, lacking a single external specification, varies from one implementation to another. Creating a file in Github using Github Markdown, then publishing it through the site, will *mostly* work. To see it as readers will see it, especially if using features of USWDS, you can preview your work as it is built and served by running a local copy of the site.

#### Running the OSCAL site locally

Running Hugo with its own server locally is a convenient way of previewing site contributions as they will actually appear. Not all content (especially if unproblematic Markdown) needs to be previewed, but it is a good way to intercept display problems early.

This is documented in the repository [docs directory readme](https://github.com/usnistgov/OSCAL/tree/main/docs).

From a Linux shell, use command

```sh
$ hugo server -v --debug --minify
```

to start the server on port 1313, viewable at `http://localhost:1313/OSCAL/`.

Note that (as detailed in the readme) to browse the entire site with all contents, including generated contents, additional scripting may need to be run prior to starting the server.

## Style

### Accessibility

Since materials for the web site are authored using generic encoding (Markdown) and produced with an automated production pipeline, we are able to encapsulate and manage page design within our build. This takes accessibility and accessibility compliance (such as ADA) out of the hands of authors, for the most part.

Please be so kind as to provide `alt` values for all images to save us effort in meeting Accessibility benchmarks. Otherwise, authors should be able to rely on the publishing process to handle technical requirements related to accessibility.

At the same time, the builders of the back end support for these publications will be interested to know of any accessibility-related requirements that are not already adequately addressed.

If publishing a PDF and not simply web resources through the Pages platform, please coordinate and keep in mind requirements in this area for accessible PDFs (PDFa format).

- [ADA.gov resources](https://beta.ada.gov/web-guidance/)
- [US Web Design System Accessibility page](https://designsystem.digital.gov/documentation/accessibility/)
- Also search the NIST Intranet for applicable guidance

### Acronyms

The general rule is to spell out acronyms on first use. Keep in mind not all readers are experts in every technology or domain being discussed.

There are cases where the general rule does not apply, because an acronym has become a well-known term of art. <q>HTML</q> does not have to be explained on a page that assumes web technology as context. If an acronym does not actually provide information to anyone in the audience, consider whether it is necessary to explain it. As always, context should be the determining factor. Another example is <q>PR</q> used in reference to git or Github. Similarly this style guide, because it is focused on a web publishing platform, does not explain HTML or CSS, and knowing that HTML expands to <q>Hypertext Markup Language</q> is not important enough to stress, given how easy it is to discover in any case.

### Capitalization

Capitalization is tricky. As a rule, a proper noun is capitalized in English, and hence a reference to a formal object (such as an OSCAL <q>Control</q> object or a Github <q>Issue</q>) should be capitalized, when it has its own name. Both abstractions and things that are not abstract may have names, such as the host of our web presence, which is named <q>Pages</q> (or <q>the NIST Pages site</q>). (Other examples include Avogadro's Number, the Second Law of Thermodynamics, the OSCAL Style Guide, and Markdown, a family of text encoding technologies.)

But even a well-known abstraction such as <q>1 + 1 = 2</q> is not called an <q>Equation</q> (capitalized). To use capitals when referring to something by name is different from instantly or implicitly coining a new technical term out of nothing, by using capitals. To call a Github ticket an <q>Issue</q> is not incorrect if that is what Github calls it; but a ticket in another tracking system is not an <q>Issue</q> (capitalized). In an OSCAL context, even a technical term such as <q>profile resolution</q> should not be capitalized just because it is used in a specialized sense.

One reason to avoid Gratuitous Capitalization is that (by giving something a name) it can convey Unintentional Irony (appearing as if you are meaning to say something you are not saying, when you are not).

### Citations and links

[NIST guidance on citation formats](https://www.nist.gov/open/copyright-fair-use-and-licensing-statements-srd-data-software-and-technical-series-publications#citations) is available. Additionally, see the Style Guides linked below for rational discussion. Links in the text whose end points are clearly described do not have to be provided with formal citations.

As always, however, citations can and should be used to document your sources. Citing sources is a way of reflecting credit on the project as well as on the works cited.

Pages indexed in `data.nist.gov` (see above) should also be provided with self-citations indicating their assigned DOI.

Where citations are given, we permit any consistent and legible citation format that includes the vital information needed, typically a work's title, its authorship or creator, publication date, editor if applicable, and available links and time stamps.

See also [Reference Format for NIST Publications](https://inet.nist.gov/library/publishing-support-nist-publications/reference-format-nist-publications) (requires NIST login).

### Headers and heading levels

This rule may not apply if your page is short, you do not need tables of contents showing correctly partitioned and nested sections, or you do not care.

In Markdown, section headers are indicated using '#' characters, the count of such characters indicating heading level such that `###` indicates `h3` (third-level header). The level of header is taken as an indicator of structural demarcations (sections or `div` elements) in the presentation, such that a third-level section is considered inside (not next to) the second level section that (immediately) precedes it.

It is up to you to see to it that your headers indicate properly nested sections:

- `h1` may be directly followed by `h1` or `h2`
- `h2` may be directly followed by `h3`, `h2`, or `h1`
- `h3` may be directly followed by `h4`, `h3`, `h2` or `h1`
- etc.: never go down more than one level at a time

This is to ensure that tables of contents written in the web site build are consistent and legible. Previewing in the site is a good way to check the nesting.

An example of a properly nested sequence is  `h1 h2 h2 h3 h3 h4 h2 h1`:

- `h1` section
  - `h2` subsection
  - `h2` subsection
    - `h3` 3rd level section
    - `h3`
      - `h4` 4th level 
  - `h2` new subsection
- `h1` new section

But the sequence `h1 h3 h4` is not nested neatly because a third-level section never appears directly inside a first-level section.

(Exercise: write a validator that can report when this rule is broken, over Markdown or HTML inputs.)

### Images

If making a diagram or schematic image, see above under [Diagrams](#diagrams).

Images should always be provided with `alt` values providing short descriptions for navigation devices and screen readers, enclosed in `[ ]` (brackets) in the notation. Using Markdown:

```
![OSCAL gears icon](../oscal-gears-icon-32.png)
```

For an image ![OSCAL gears icon](../oscal-gears-icon-32.png).

### Inline code

Markdown supports code snips inline with the back-tick notation. Code almost always appears in monospace font, sometimes with further visual emphasis. References to things can also be code -- for example, it may be useful to use code `h1` (XPath notation for 'An h1 element') or `\<h1>` (An HTML or OSCAL open tag for the same thing) to refer unambiguously to elements named <q>h1</q>. Only do so consistently and in a way that communicates the idea to the prospective user or reader. If using XPath, for example, state as much.

### Italics and bold

Use inline styling as offered by Markdown features for *italics*, **bold** and even ***bold-italic***. But not much. Italics might be used for emphasis or rhetorical stress, or for words in Latin alphabets, but not English. Latin phrases such as *ad hoc* or *de facto* might be italicized, but conventional abbreviations (e.g., i.e.) might not be.

Do not use inline styling for technical terms. If using a proper noun, use the correctly capitalized form for that noun (<q>Open Security Controls Assessment Language</q>), but not italics or bold. For example, while the title of a novel might be in italics (*Moby Dick*), no additional italics should be given to the title of a work being linked to (such as the [OSCAL web site](https://pages.nist.gov/OSCAL)), because as a link it has its own styling.

Obviously an exception to this rule is when a document uses (possibly defines) controlled vocabulary with structured tagging, such that usage of technical terms is maintained systematically. In this instance, however, you should be tagging the terms, not how they appear on screen (for example as HTML `<span class="term">term</span>`, and moreover validating this tagging (whether in XML, HTML, Markdown or other format of origin). A rendering agent (such as a CSS extension) may then provide appropriate style .

### Licenses and fair use

NIST has requirements regarding license statements and disclaimers, which might apply if you are publishing software (considered broadly as anything executable in some fashion). You should see to it that all copyright and licensing-related guidelines are adhered to: see https://www.nist.gov/open/copyright-fair-use-and-licensing-statements-srd-data-software-and-technical-series-publications.

Keep in mind these requirements apply for both providing licenses, and for acquiring permissions if and where necessary to abide by implicit or explicit licensing terms including copyright terms. Since our works go into the public domain, to publish on our sites is to put something into the public domain; so be sure you have a right to do this (fair use with citation counts as a right) or you have explicitly secured rights from the owner.

A word about citations is also given in its [own section](#citations-and-links).

### Plurals
See the word lists in friendly style guides for more help hitting the moving targets of English lexicography and morphology. We use American English spelling but will not correct yours if it is consistent. Additionally,

- We accept <q>schemas</q> as a plural for <q>schema</q>, noting that English also has <q>dogmas</q> <q>dramas</q>, and <q>enigmas</q> as plural forms for singular nouns derived from Greek [third declension neuter](https://en.wiktionary.org/wiki/Appendix:Ancient_Greek_third_declension#Neuters) roots.
- We prefer <q>criteria</q> as a plural with <q>criterion</q> as a singular. <q>All the criteria have been met.</q>
- As recommended by at least one style guide, <q>indexes</q> and <q>appendixes</q> are fine with us.
- Singular pronouns that appear like plurals (<q>they are</q>) are also fine, when in reference to people.

### Quotation marks

When referring to a word as a word, use quotation marks. Ex: *The term <q>word</q> here is used in its technical sense. A word has four (4) bits in this architecture.*

In general, avoid using quotation marks for rhetorical effect or to make a point (<q>make a point</q>), however subtle.

For writers not satisfied with keyboard (so-called) <q>straight</q> quotes (also called <q>ditto marks</q>), it turns out that right and left quotation marks are not difficult to encode in Markdown using HTML character entities:

| quote mark  | character  | entity reference | character reference |
|---|---|---|---|
| left double | &ldquo;  | `&ldquo;`  | `&#8220;`
| right double | &rdquo;  | `&ldquo;`  | `&#8221;`
| left single | &lsquo;  | `&ldquo;`  | `&#8216;`
| right single | &rsquo;  | `&ldquo;`  | `&#8217;`

Preview carefully when using these. Another thing that works in modern browsers `<q>` element markup, like `<q>this</q>`, which our Markdown interpreter renders through to the browser as <q>this</q>.

### Signing work

Our work products are in the public domain, and for the most part we rely on git and Github to track contributions, and consider all works to be created and produced by the OSCAL team.

However, for authors of discrete articles, pieces of software or other research findings or work products, where names should be listed for any reason, this can be accommodated. This applies generally, to project developers and teams as well.

### Simple English and plain language

This is an important topic covered in the style guides listed below. See also [US Government resources on plain language](https://www.plainlanguage.gov/).

Technical terminology alone -- both OSCAL terminology and the terminologies of its domains of application --  will sometimes make documentation difficult for some readers. But this is not a goal, and terminology aside, sentences should be kept short. When choosing between two ways to express the same thing, choose the simpler and commoner one.

### Technical terminology

When writing about OSCAL or topics related to OSCAL, technical terminology is indispensable and inescapable. Additionally, it is inevitable and foreseeable that some terms (examples that come readily to mind include <q>control</q>, <q>catalog</q>, <q>profile</q>, <q>constraint</q>, and <q>component</q>) will be overloaded in use, that is, they will be used in both technical and non-technical senses, sometimes within the same conversation. Moreover their various technical senses may sometimes be broadly *contradictory* (what is meant by <q>profile</q> might be specifically different from one technical context to another) without ever creating *ambiguity*, if their contexts of use are kept clear. Use technical terminology to prevent ambiguity, and where ambiguity arises, clarify context in order to clarify usage.

For example, whenever writing about <q>validation</q>, be specific as to what kind of validation is meant, since the word has both generic and specific senses.

Similarly, <q>control</q> has both an OSCAL sense, and an RMF sense (Risk Management Framework as defined by NIST SP800-37); a document that uses the term specifically in one of these senses, the other, or both (when OSCAL is being used to model RMF), might indicate this.

Yet not every use of an overloaded term must be qualified. Various senses might be left implicit if no confusion is caused (again, considered in context). In accordance with a more general rule that plain common nouns are to be preferred over jargon, terms such as <q>control</q> or <q>profile</q> might be used without further explanation when context makes it clear enough what is meant *even if a term is also overloaded* (means other things in other contexts). Within the context of describing a processing pipeline for OSCAL profiles, <q>valid profile</q> might be taken as shorthand for <q>XML \[or JSON] document known to be valid using a \[profile] schema</q>, especially when this is stated outright at the top. The fact that other kinds of validation may be implicit, or not relevant, does not have to be explained.

#### OSCAL objects and formal names

In formal documentation, OSCAL objects are given formal names in addition to the identifiers or tags provided to represent them in encoded (machine-readable) representations. These formal names help to identify and distinguish the object as defined, and to confirm the subjects of assertions, for example in specification of software requirements. Commonly, for example, they can appear as listings in tables of contents. Formal names in OSCAL use *title case*, for example <q>Assessment Activity Universally Unique Identifier</q> for a data point marked simply as `uuid` in OSCAL data. Sometimes a formal name echoes an encoded (tag) name: <q>Control</q> is the formal name for the object encoded as `control` or tagged (XML syntax) `<control>`.

When using formal names, use them fully spelled out and capitalized, without further formatting. Of course, the context of use should be OSCAL object types (which are defined with such formal names), not something else. In this context, in other words, they are meaningful as proper nouns.

A complete list of formal names for objects defined in OSCAL schemas can be retrieved using the XPath query `//formal-name` (binding unprefixed names to namespace `http://csrc.nist.gov/ns/oscal/1.0`), over the collection of OSCAL metaschemas.

#### Other OSCAL and non-OSCAL terminology

In general, technical terms (and even formal names) should be avoided in favor of non-technical language except when necessary for specific clarification *within the context of use* including your intended audience. For instance, a tutorial intended for beginners does not (and should not) exhaust every topic: it should be technical only as appropriate and necessary, and technical language not actually useful to understand problems or concepts at hand, can often be saved for elsewhere.

Nonetheless, technical terminology is often necessary. For documents reaching non-technical audiences (or non-domain experts), this often requires offering brief definitions for terms at the head of a document, or even a glossary. Even technical audiences can be helped by a link to a specification that defines formal terms. In any case, formal terminologies can be called out and identified as such. For example, both OSCAL and RMF (Risk Management Framework) terminology may combine in a description of a use case for a new feature. In this instance a brief notice of what is meant by terms such as <q>profile</q> or <q>baseline</q> is not out of order.

With the same objective of lucidity and lightness, a document intended for a specific audience should not have to define terms for other audiences. A `readme` directed at Python developers is free to use terms appropriate to Python.

## NIST data publishing

In addition to maintaining web platforms, the OSCAL project publishes resources and tools through the formal NIST data publishing process, for release through NIST's [Science Data Portal](http://data.nist.gov). This is appropriate for (NIST-authored) contributions that should be indexed as scientific publications, or archived as discrete data sets.

The formal review process this entails will presumably not be a problem for works the site editors are also reviewing. Mechanically, the process can be lightweight, requiring nothing more than a structured metadata record with a link to a published (web-accessible) OSCAL resource. This record is provided and maintained in NIST's metadata repository for [Management of Institutional Data Assets](https://midas.nist.gov/)). 

With NIST access credentials, consult the [Publishing Instructions on the NIST Intranet](https://inet.nist.gov/adlp/open-access-research-oar/publishing-instructions). If your work has undergone a formal review process (external to ours, such as for a conference or journal), it might be a <q>paper</q>. Even if not (that is, if published on the web site or in a repository), depending on its design and purposes, it might constitute <q>software</q> or <q>data</q>.

Additional Resources linked at the foot of this page include a useful checklist for project documentation such as `readme` documentation. Nothing it describes is mandatory for all projects, but any of this guidance might apply in a given instance, and is worth considering for any project or repository, not only those published formally.

Besides an additional web presence, NIST data publishing provides the following advantages:

- A registered DOI (digital object identifier)
- Listings in data.nist.gov, [GovInfo](https://www.govinfo.gov/) and other scientific and government indexes (beyond search engines)
- Long-term archiving (beyond Github) of appropriate artifacts or packages
- Documentation of authorship and contributions
- Access and citation tracking

See what data.nist.gov shows currently for OSCAL at the [data.nist.gov portal](https://data.nist.gov/sdp/#/search?q=%20OSCAL).

## Recommended style guides

These excellent style guides have been produced over time but remain current and relevant.

- [Red Hat Technical Writing Style Guide Edition 5.1](https://stylepedia.net/style/5.1/) (open source, incorporating guidance from the IBM Style Guide)
- Google [developer documentation style guide](https://developers.google.com/style)
- [Apple Style Guide](https://help.apple.com/applestyleguide/)
- Carnegie Museums [Web Accessibility Guidelines](http://web-accessibility.carnegiemuseums.org/)
- Microsoft [Writing Style Guide](https://docs.microsoft.com/style-guide/welcome/)

If you know of a style guide we should list here please make an [Issue on Github](https://github.com/usnistgov/OSCAL/issues/new?labels=User+Story%2C+enhancement%2C+Scope:%20Website&template=feature_request.md).

### NIST style guides

Even if submitting work only for the web site, NIST authors will want to be aware of NIST-specific guidance for its formal publications:

- [Guidance for Authorship of Scholarly and Technical Publications](https://inet.nist.gov/adlp/directives/guidance-authorship-scholarly-technical-publications) (requires NIST authentication)


