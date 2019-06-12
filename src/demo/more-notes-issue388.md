
### Designating flag as label for fields and assemblies (#388.3)

  @use-as-label must be the same as a flag/@name

So `define-field/flag[@use-as-label='yes']` promotes a flag's
value to be the object's label

(in metaschema) `<flag name="name" primary="yes"/>`

(in document)

```
<prop id="p1" name="status">X</prop>
<prop id="p1" name="owner" ns="pop">Bob</prop>
```

```
"properties": [
   { "status": "X" },
   { "owner": "Bob",
     "ns": "pop" } ]
```

Required: a Schematron check to ensure that siblings do not have the same value designated for label. 

This replicates the `@address` functionality for assemblies: shouldn't they be the same?


"properties": {
   "p1": {
      "status": "X",
      "owner": "Bob",
      "ns": "pop" },
	 
   
   
   
   { "status": "X" },
   { "owner": "Bob",
     "ns": "pop" } ]
	 
	 
	 ## OSCAL JSON notation enhancements


### Attribute field collapse (#239.1)

Permit a setting on define-field collapsible="yes" (or "no")

When this field is set, the following behavior is enabled:

Sibling fields with the same names and flags are collapsed.

So

```xml
<prop name="status" ns="boo">BIG</prop>
<prop name="status" ns="foo">SMALL</prop>
<prop name="status" ns="boo">TALL</prop>
<prop name="status" ns="boo">ROUND</prop>
```

becomes

```json
"properties": [
  { "name": "status",
    "ns": "boo"
    "STRVALUE": ["BIG", "TALL", "ROUND"] },
  { "name": "status",
    "ns": "foo"
    "STRVALUE": ["SMALL"] } ]
```

NB: collapsing may have the effect of reordering elements in round-tripping! We should Schematron for this.

Can this be easily accomplished as a micropipeline, post-processing the JSON? Probably, yes. But it only works on arrays -- so @collapsible cannot be used with @json-label-flag

```

<xsl:template match="fields">
  instead of selecting and applying templates, we group --
  <XSLT:variable name="{@group-as}-fields">
    <XSLT:apply-templates select="{@named}"/>
  </XSLT:variable>
  <XSLT:for-each-group select="${@group-as}-fields/*" group-by="[flag-]


<xsl:template match="define-field[not(@collapsible='no')]">
  <XSLT:template priority$='[high]' match="{$match-expr}">
    <XSLT:variable name="ordinary">
	  <XSLT:next-match/>
	  
  


### Permit renaming 'value' member on field object [new feature]

[Make an issue for this but do not execute yet]

Add an attribute to define-field @value-name='baz'

Add a Schematron constraint on Metaschema Schematron 

```
<assert context="define-field" test="empty(@value-name) or (@value-name = flag/@name)"/>
```

also that this feature is not used along with @address or flag/@primary                         

In operation, this has the effect of providing a specialized label
instead of "STRVALUE" (for string fields) or "RICHTEXT" (for markdown fields)

### Optimizing metaschema to permit implicit flag declarations (new feature)

DW wants to be able to omit a flag declaration from a metaschema and to omit a flag or flags in general from the docs ToC ... they could be declared implicitly by reference, if we wanted

## Model cases

### `assembly[empty(@json-use-flag-as-label)]`

### `assembly[exists(@json-use-flag-as-label)]`

### `field[exists(@json-use-flag-as-label)]

### `field[exists(@json-use-flag-as-label)][exists(@use-flag-as-value-label)]

### `field[exists(@json-key-flag)]


@json-value-label [key or property name, must not = flag/@name]
@json-use-flag-as-value-label [flag name]
@json-use-flag-as-label (old @address) [flag name]



@value-label [key or property name, must not = flag/@name]
@flag-for-value-label [flag name]
@flag-for-label (old @address) [flag name]



special case

a1 - simple assembly
a2 - assembly with @use-flag-as-label
       validate that flag is unique among siblings
f1 - simple field, no flags (makes string)
f2 - simple field, with a flag
f3 - simple field, with flags
f4 - field with @use-flag-as-label, plus flags
f5 - field with @use-flag-as-label, no additional flags
f6 - field with @use-flag-as-label, @use-flag-as-value-label
error for field with both @
  
  

