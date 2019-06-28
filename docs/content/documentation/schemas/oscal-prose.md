---
title: Schema Reference - OSCAL Prose Model
description: OSCAL Profile Model XML Schema Reference
permalink: /docs/schemas/oscal-prose/
layout: post
topnav: schemareference
sidenav: schemas
sticky_sidenav: true
---

## HTML compatibility

Prose in OSCAL is designed to map cleanly to an HTML subset. Note that this element set is not maintained in the HTML namespace. It is intended not to be treated directly as HTML, but to be readily and transparently converted to HTML (or other presentational formats) as needed.

OSCAL prose supports paragraphs (`p`), headers (`h1`-`h6`), tables (`table`), preformatted text (`pre`), code blocks (`code`), and ordered and unordered lists (`ol` and `ul`.)

Within paragraphs or text content (inline) the following elements are permitted: `a`, `img`, `strong`, `em`, `b`, `i`, `sup`, `sub`.

In particular, note that elements such as `div`, `blockquote`, `section` or `aside`, used in HTML to provide structure, are *not permitted in OSCAL*. Structures in OSCAL should be represented using OSCAL elements (or objects in JSON) such as `part`, which can include prose.

In addition, there are contexts in OSCAL where prose usage may be further constrained. For example, at a higher level (outside the base schema) an OSCAL application could forbid the use of prose headers `h1-h6` in favor of nested OSCAL `part` elements with their own titles.

## Markdown compatibility

OSCAL also maintains a mapping from its HTML-like tagging for prose into a Markdown syntax. Since markdown (as a JSON or YAML string) is our syntax of choice for representing unstructured prose in JSON and YAML, transparent and lossless bidirectional mapping between the OSCAL markup (tag) representation, into its Markdown equivalent, is supported.

When in doubt about Markdown features and syntax, we look to CommonMark for guidance, largely because it is more rigorously tested than many others.

## Mapping between HTML and Markdown

The following HTML <-> Markdown mapping is supported by OSCAL.

### Inline and Block Markup

| Markup Type | HTML | Markdown |
|:--- |:--- |:--- |
| Emphasis (preferred) | &lt;em&gt;*text*&lt;/em&gt; | \**text*\*
| Emphasis | &lt;i&gt;*text*&lt;/i&gt; | \**text*\*
| Important Text (preferred) | &lt;strong&gt;*text*&lt;/strong&gt; | \*\**text*\*\*
| Important Text | &lt;b&gt;*text*&lt;/b&gt; | \*\**text*\*\*
| Quoted Text | &lt;q&gt;*text*&lt;/q&gt; | "*text*"
| Subscript Text | &lt;sub&gt;*text*&lt;/sub&gt; | \~*text*\~
| Superscript Text | &lt;sup&gt;*text*&lt;/sup&gt; | \^*text*\^
| Image | &lt;img alt="*alt text*" src="*url*" title="*title text*"/&gt; | !\[*alt text*](*url* "*title text*")
| Link | &lt;a *href*="*url*"&gt;*text*&lt;/a&gt; | \[*text*](*url*)
| Heading: Level 1 | &lt;h1&gt;*text*&lt;/h1&gt; | # *text*
| Heading: Level 2 | &lt;h2&gt;*text*&lt;/h2&gt; | ## *text*
| Heading: Level 3 | &lt;h3&gt;*text*&lt;/h3&gt; | ### *text*
| Heading: Level 4 | &lt;h4&gt;*text*&lt;/h4&gt; | #### *text*
| Heading: Level 5 | &lt;h5&gt;*text*&lt;/h5&gt; | ##### *text*
| Heading: Level 6 | &lt;h6&gt;*text*&lt;/h6&gt; | ###### *text*
| Code Blocks | &lt;code&gt;*text*&lt;/code&gt; | \`*text*\`
| Preformatted Text | &lt;pre&gt;*text*&lt;/pre&gt; | \`\`\`*text*\`\`\`
| Ordered List Item | &lt;ol&gt;&lt;li&gt;*text*&lt;/li&gt;&lt;/ol&gt; | 1. *text*
| Unordered List Item | &lt;ul&gt;&lt;li&gt;*text*&lt;/li&gt;&lt;/ul&gt; | * *text*

The use of &lt;p&gt; tags in HTML is mapped to Markdown as two double, escaped newlines within a JSON or YAML string (i.e., "\\\\n\\\\n"). This allows Mardown text to be split into paragraphs.

### Table Markup

Tables are mapped from Markdown to HTML as follows:

- The first row in a Markdown table is considered a header row, with each cell mapped as a &lt;th&gt;.
- The alignment formatting (second) row of the Markdown table is not converted to HTML. Formatting is currently ignored.
- Each remaining row is mapped as a cell using the &lt;td&gt; tag.
- colspan and rowspan is not supported by Markdown.

Tables are mapped from HTML to Markdown as follows:

- Only a single header row &lt;tr&gt;&lt;th&gt; is supported. This row is mapped to the Markdown table header, with header cells preceded, delimited, and terminated by `|`.
- The second, alignment formatting row, is produced with centered alignment (i.e., | --- |) used for each cell. Other alignments are not currently supported.
- Each subsequent row is mapped to the Markdown table rows, with cells preceded, delimited, and terminated by `|`.

For example:

The following HTML table:

```html
<table>
  <tr><th>Col A</th><th>Col B</th></tr>
  <tr><td>Have some of</td><td>Try all of</td></tr>
</table>
```

Is mapped to the Markdown table:

```markdown
| Col A | Col B |
| --- | --- |
| Have some of | Try all of |
```

### Parameter Insertion

The OSCAL catalog, profile, and implementation layer models allow for control parameters to be defined and injected into prose text.

Parameter injection is handled in HTML as follows using the &lt;insert&gt; tag:

```html
Reviews and updates the risk management strategy <insert param-id="pm-9_prm_1"/> or as required, to address organizational changes.
```

The same string in Markdown is represented as follows:

```markdown
Reviews and updates the risk management strategy {{ pm-9_prm_1 }} or as required, to address organizational changes.
```


### Specialized Character Mapping

The following characters have special handling in their HTML and/or Markdown forms.

| Character | HTML | Markdown |
|:--- |:--- |:--- |
| &amp; | &amp;amp; | &amp;
| &lt; | &amp;lt; | &lt;
| &gt; | &amp;gt; | &gt;
| " | &amp;quot; | \\\"
| ' | &amp;apos; | '
| \* | \* | \\\*
| \` | \` | \\\`
| ~ | ~ | \\\~
| ^ | ^ | \\\^

While the characters ```"'\*\`~^``` are valid for use unescaped in JSON strings, these characters have special meaning in Markdown markup. As a result, when these characters appear in HTML, they are escaped in the mapped Markdown to avoid them being parsed as Markdown markup. This allows these characters to be mapped back to HTML characters when the Markdown is mapped to HTML.

# Questions

- Do &amp; and &lt; need to be encoded in JSON?
- Do ' need to be escaped in JSON?
- Should &amp;#2A; be &amp;#42; or \* in HTML?
- Should &amp;#60; be &amp;#96; or \` in HTML?
- What about blockquote?
- What about table alignment?
- Looks like param insertion is not handled using double braces.
