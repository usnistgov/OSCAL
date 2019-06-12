

# Metaschema enhancements for more concise JSON

## enhancements to JSON addressability / clarity

### promoting a flag to be a property name

(We use a "param" example as a field even though in the catalog format, it is an assembly.)

example

```xml
<param id="p1">some value</param>
<param id="p2">another value</param>

```

We wish to see NOT

```json
"parameters":[
  { 'id': 'p1',
    'STRVALUE': 'some value' },
  { 'id': 'p2',
    'STRVALUE': 'another value' } ]
```

INSTEAD

```json
"parameters":{
  'p1': { ['value': 'some value ] },
  'p2': { ['value': 'another value ] },
```

(Note: this example could be collapsed even further using other means described below, even to the point we have `'p1': 'some value' ` )

Currently this is done using an @address element:

```xml
<define-assembly name="param" address="id" group-as="parameters">
    <flag name="id" datatype="ID" required="yes"/>
    <flag name="class"/>
  ...
```

PROPOSED:

```xml
<define-assembly name="param" group-as="parameters">
    <key name="id" datatype="ID"/> <!-- a key is just a special kind of (required) flag -->
    <flag name="class"/>
  ...
```

Only one `<key>` child is permitted. It works just like a flag, except with the additional feature that it is promoted to be a key on an object, not a name/value pair property, in the JSON - while in the XML it looks just like any other attribute.

An attribute declared as a key is always required. It can conform to datatype constraints like any flag. It can also be checked (separately) for suitability as a JSON key (including the requirement to be unique among siblings).

### Assigning a flag to serve as a name for the value.

So

```
<prop name="reading-level">expert</prop>
```

becomes NOT

```
"properties": [
  { "name" : "reading-level",
    "STRVALUE": "expert" } ]
```

but instead

```
"properties": [
  { "reading-level": "expert" } ]
```

We enhance the metaschema like this:

```
<define-field name="prop" group-as="properties">
  <value-key name="name"/>
  ...
</define-field>
```

The assignment of `value-key` declares an attribute in the XML, whose value is taken to be a "mask" for the string value property (by default 'STRVALUE' or 'RICHTEXT').

We can validate to see to it that the name of the value key (like the key, otherwise an ordinary flag) does not conflict with the name of any flags on the same field.

Assemblies don't get value keys because they don't have string values, only structured values. (The value key for prose is hard-wired to be "prose".)

As with `<key>`, using `<value-key>` (with `name`: see below) is enough to declare the attribute we need in the XML to provide the value for the label.

### Assigning a literal as a name for the value

We can also "mask" the default property name for text content with a simple value. So

```
<level class="a" obj-ref="b">expert</level>
```

becomes NOT

```json
"levels": [
  { "class": "a",
    "obj-ref": "b",
    "STRVALUE": "expert" } ]
```

but INSTEAD

```json
"levels": [
  { "class": "a",
    "obj-ref": "b",
    "rank": "expert" } ]
```

PROPOSAL: the definition in the metaschema uses the same 'value-key' element:

```
<define-field name="prop" group-as="properties">
  <value-key>rank</value-key>
  ...
</define-field>
```

ADDITIONAL PROPOSAL: if both value-key/@name and a literal value-key are given, the processor can fall back to the literal when the flag is not available -- meaning the flag can be optional as well, not required.

### Plain-old collapsing

Additionally to these enhancements we can as a rule collapse single-member arrays, into single objects (or strings), using the same method.

The more challenging part of that casting is seeing to it that things are rendered back up into XML correctly and that nothing is dropped.


#### Singleton vs array in JSON (#239.2)

Amend JSON schema to permit a singleton value (string or map) instead of an array, when an array (for a field or assembly group) would have only a single member. In either case, the key (label) is the `@group-as` value.

Provide for this optimization in XML-to-JSON conversion
and back again.

