
# group-as

When a `field` defines `group-as` as follows:

```xml
<define-field name="prop" group-as="props">
    ... snip ...
</define-field>
```

This should be changed to:

```xml
<define-assembly name="parent">
    ... snip ...
    <model>
        <field ref="prop" max-occurs="unbounded">
            <group-as name="properties" json-behavior="ARRAY"/>
        </field>
    </model>
</define-assembly>
```

The values of the `json-behavior` are:

- `ARRAY`: always use an array.
- `SINGLETON_OR_ARRAY`: (default) Use a singleton for when a single value occurs or an array when multiple values occur.
- `BY_KEY`: Use with `json-key`

This allows the grouping to be controlled in the context where the group will occur. The same approach applies to `assembly` references.

The resulting JSON Schema will be defined as follows:

When `json-behavior="ARRAY"` is used:

```json
"parent": {
    "title": "...",
    "description": "...",
    "$id": "#/definitions/parent",
    "type": "object",
    "properties": {
        "props": {
            "type": "array",
            "items": {"$ref": "#/definitions/prop"}
        }
    },
    "additionalProperties": false
},
```

When `json-behavior="SINGLETON_OR_ARRAY"` is used, or no `json-behavior` is defined:

```json
"parent": {
    "title": "...",
    "description": "...",
    "$id": "#/definitions/parent",
    "type": "object",
    "properties": {
        "props": {
            "anyOf": [
                {
                    "type": "object",
                    "$ref": "#/definitions/prop"
                },
                {
                    "type": "array",
                    "items": {"$ref": "#/definitions/prop"},
                    "minItems": 2,
                    "maxItems": 10 # the max-occurs value if not "unbounded"
                }
            ]
        }
    },
    "additionalProperties": false
},
```

When `min-occurs="2"` or greater on the grouped property, the resulting JSON schema will omit the singleton as follows:

```json
"parent": {
    "title": "...",
    "description": "...",
    "$id": "#/definitions/parent",
    "type": "object",
    "properties": {
        "props": {
            "type": "array",
            "items": {"$ref": "#/definitions/prop"}
            "minItems": 1, # the min-occurs value
            "maxItems": 10 # the max-occurs value if not "unbounded"
        }
    },
    "additionalProperties": false
},
```

In the case where @min-occurs >= 2, the use of `json-behavior="SINGLETON_OR_ARRAY"` should result in a Metaschema error.


Also, if `group-as` is selected for a cardinality of `max-occurs="1"`, then this should result in a Metaschema warning. In such a case, `group-as` is not needed.

# json-key

When a flag is defined as a `json-key`, this allows that flag to be used in an outer JSON object to identify the containing `field` or `assembly`.

The definition of the `flag` to be used as a key can be done in two ways as follows. In either case the datatype of the flag used as the `json-key` must be a string datatype. TODO: figure out this restriction.


## Case 1

This case defines a local flag to use as a key.

```xml
<define-assembly name="parent">
    ... snip ...
    <model>
        <assembly ref="child" max-occurs="unbounded">
            <group-as name="children" json-behavior="BY_KEY"/>
        </assembly>
    </model>
</define-assembly>

<define-assembly name="child">
    ... snip ...
    <json-key flag-name="id"/>
    <flag name="id" datatype="NCName">
        <formal-name>Identifier</formal-name>
        <description>Provides a means to identify the parent object</description>
    </flag>
    <flag name="data" ...>
        ... snip ...
    </flag>
</define0assembly>
```

In this case the resulting JSON schema will be defined as follows:

```json
"parent": {
    "title": "...",
    "description": "...",
    "$id": "#/definitions/parent",
    "type": "object",
    "properties": {
        "children": {
            "type": "object",
            "minProperties": 1, # the value of min-occurs
            "maxProperties": 1, # the value of max-occurs if not "unbounded"
            "additionalProperties": {
                "type": "object",
                "$ref": "#/definitions/child"
            }
        }
    },
    "additionalProperties": false
},
"child": {
    "title": "...",
    "description": "...",
    "$id": "#/definitions/child",
    "type": "object",
    "properties": {
        "data": {
            ... snip ...
        }
    },
    "additionalProperties": false
}
```

The `parent` may have other `flag`, `field`, or `assembly` declared within its model. These will appear under the JSON properties

Note: Use of `<json-key>` and `<group-as json-behavior="ARRAY"/>` are incompatible.

## Case 2

This case uses a globally defined flag as the key.

```xml
<define-flag name="id" datatype="NCName">
    <formal-name>Identifier</formal-name>
    <description>Provides a means to identify the parent object</description>
</define-flag>

<define-assembly name="parent">
    ... snip ...
    <model>
        <assembly ref="child" max-occurs="unbounded">
            <group-as name="children" json-behavior="BY_KEY"/>
        </assembly>
    </model>
</define-assembly>

<define-assembly name="child">
    ... snip ...
    <json-key flag-name="id"/>
    <flag ref="id" datatype="NCName">
        <formal-name>Identifier</formal-name>
        <description>Provides a means to identify the parent object</description>
    </flag>
    <flag name="data" ...>
        ... snip ...
    </flag>
</define0assembly>
```

We should validate that when json-behavior=BY_KEY, the definitions line up accordingly.


The resulting JSON schema is the same as above:

```json
"parent": {
    "title": "...",
    "description": "...",
    "$id": "#/definitions/parent",
    "type": "object",
    "properties": {
        "children": {
            "type": "object",
            "minProperties": 1, # the value of min-occurs
            "maxProperties": 1, # the value of max-occurs if not "unbounded"
            "additionalProperties": {
                "type": "object",
                "$ref": "#/definitions/child"
            }
        }
    },
    "additionalProperties": false
},
"child": {
    "title": "...",
    "description": "...",
    "$id": "#/definitions/child",
    "type": "object",
    "properties": {
        "data": {
            ... snip ...
        }
    },
    "additionalProperties": false
}

```

# json-value-key

## Dynamic value-key functionality

Given the XML:

```xml
<prop name="status">DRAFT</prop>
```

The default behavior produces the following JSON:

```json
{"name": "status",
 "STRVALUE": "DRAFT" }
```

The ```define-field``` construction will use `json-value-key` to customize this behavior as follows:

```xml
<define-field name="prop" as-type="simple-markup">
    ... snip ...
    <json-value-key flag-name="name"/>
    <flag name="name" required="yes">
</define-field>
```

Which would result in the JSON:

```json
{"status": "DRAFT" }
```

The resulting JSON schema will be defined as follows:

```json
"prop" : {
    "title": "...",
    "description": "...",
    "$id": "#/definitions/prop",
    "type": "object",
    "minProperties": 1, # total number of required properties - 1 (for the collapsed property)
    "maxProperties": 1, # total number of properties - 1 (for the collapsed property)
    "additionalProperties": {
            "type": "string" # or other datatype
    }
}
```

## Static value-key assignment

If no `flag` can be used to specify the `field` property name, a static value can be used instead as follows:

```xml
<define-field name="link" as="xs:string">
    ... snip ...
  <json-value-key>text</value-key>
</define-field>
```

Given the XML:

```xml
<link>The quick brown fox...</link>
```

This would result in the following JSON:

```json
{"text": "The quick brown fox..." }
```

The resulting JSON schema will be defined as follows:

```json
"link" : {
    "title": "...",
    "description": "...",
    "$id": "#/definitions/prop",
    "type": "object",
    "properties": {
        "text": {
            "type": "string" # or other datatype
        }
    },
    "additionalProperties": false
}
```

# collapsing multiple instances of the same field

If a given set of fields share the same flag values, but have different field values, such a field can be collapsed in JSON.

Need to define.

# also

- Don't allow datatype to be specfied on `flag`, `field`, or `assembly` declarations that reference a defined `flag`, `field`, or `assembly`.
