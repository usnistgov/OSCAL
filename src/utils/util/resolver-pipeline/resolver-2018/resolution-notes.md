# Profile semantics notes

OSCAL Profile semantics: old profile resolver (2018) notes ...

## Importing catalogs and including controls
`include/match[@pattern]` and `include/call[@control-id|@subcontrol-id]` *both* provide selection of controls.

### Including controls (or subcontrols) by calling them by ID

The ID of a control is the `@id` in the XML of that control.

```
<include>
   <call control-id="pm3"/>
</include>

```

`call` with `control-id` works to select the control with with given ID (identifier) in its catalog.

Same for `call` with `subcontrol-id`, except subcontrols are included.

Note that subcontrols may be included without their controls. Depending on other considerations (see below) this may not be an error.

It is also possible to use a `with-subcontrols` flag when calling controls by ID, to include all subcontrols along with it.


```
<include>
   <call control-id="pm3" with-subcontrols="yes"/>
</include>

```

### Including controls by matching their ID

```
<include>
   <match pattern="^pm"/>
</include>

```

The value of `@pattern` is an (XSD) regular expression. It is matched against the ID. Both/any controls and subcontrols whose IDs match the patterns, are selected - so in this case, any whose ID starts with "pm".

In future we may add the feature to match any associated string e.g. a title or property value, not only the ID.

### Orphan or "loose" subcontrols

It is a requirement that a subcontrol may be included in one import clause, with its control included (only) in another one. (Perhaps the first clause adds a subcontrol to a profile included in the second.) This should be supported as long as the control is indeed included in another import branch (with which it can eventually be merged subject to its logic). "The same control" for these purposes means the control with the same @id from the same catalog - so, to be more precise, a subcontrol can be reunited to any control with the same ID as its parent in (its own) home directory. An orphan subcontrol included without its control included anywhere (in the same profile albeit not the same import), may be an error (TBD).

NB currently this feature (merging loose subcontrols) is still missing, subject to merge rules altogether. 2018/02/27

proposal 20180228 - resolution w/o merge returns import branches w/ orphan subcontrols still orphaned; then merge combines all controls from same catalogs together (w/o regrouping them); merge/build also does the regrouping

test this on simple cases then come back to worse errors (e.g. duplicative/conflicting control imports)

## Merge proposal

`merge` - simply merges import branches together on their source catalogs (reuniting controls and subcontrols)

However this is considered normal indeed to skip it would only be done ordinarily for diagnostic purposes.

`merge/as-is` - rebuilds into hierarchy of home catalog (we have this working)

`merge/custom` - instead, provides a way to "stack" the controls into a new organization (optionally reporting errors for dropped controls):

```
<group>
  <title>
  <match pattern="cm"/>
</group>
```

for purposes of error handling, remember that designers should be using exclusions, not letting profiles conflict even apparently. So `merge` might complain *any* time controls appear duplicative (there is always a remedy).

Should running a resolution w/o merge, also make it impossible to patch? (B/c we don't know what we're patching?)

## Modify logic ("patching")

As implemented, modifications permit both removals and additions.


```
<remove id-ref="e95b8652"/>
<remove class-ref="baseline"/>
<remove item-name="title"/>
```

 * Remove the element with `@id` (id attribute) `e95b8652`
 * Remove any element with `@class` token `baseline`
 * Remove any `title` element

These can be combined.

`<add>` elements permit two attributes to indicate the position of the addition. `@target` (optional) indicates an element where the patch will be made. `@position` indicates where (in relation to the target) the patch will be placed. Four values are recognized for `@position`: `before`, `after`, `starting` and `ending`.

You can add new components (stuff) to the front (after the title, before everything else) or at the end of any control or subcontrol, by including your addition in an `add` element *without a target*, like so:

```
<add position="starting">
  <prop class="cat">Category A</prop>
</add>
```

The same for `position="ending"`, which puts the new contents at the end of the control or subcontrol.

If instead of patching your control or subcontrol at its start or end, you wish to locate precisely where you wish an addition. For this, use a `@target`:

```
<add position="after" target="advice">
  <part class="more_advice">
     <title>More advice</title>
     <p>More advice ...</p>
</add>
```

The target works to identify an element by its `@id` or by a class token.

When elements are matched using class tokens, there is the possibility that multiple elements of the given class are present in the control. The element where the insertion is to be made is then determined by the given `@position`:  `position='before'` and `position='starting'` work to select the *first* of the candidates in the control as given, while  `position='after'` and `position='ending'` work to select only the *last* element of the given class, within the control or subcontrol.

The difference between `position='before'` and `position='starting'` is that "before" places the inserted content *before* the targeted element, while "starting" places it *inside* it, at the front. "ending" will place the inserted content at the end, inside the identified element.

When the targeted element is a control or subcontrol, `before` is a synonym for `starting`

If no position is given, `position='ending'` is inferred: the insertion happens inside the targeted element (or the matched control or subcontrol), at the end.

Note that this default works along with the rule that if no target (class or ID) is indicated, the control or subcontrol itself is the point of insertion. So:

```
<modify control-id="ac.1">
  <add position="starting">
    <link href="guidelines/">Local guidelines</link>
  </add>
  <add>
    <part class="supplemental">
       <title>Supplementary Guidance</title>
       <p>More advice ...</p>
    </part>
  </add>
</modify>
```

This adds the new `part` at the end of the `ac.1` control.

Note also that position "before" and "after" work only when @target is also used (to identify some contents inside a control); they are inoperable when the target is a control or subcontrol. They result in no addition being made. (A Schematron check could be made for this.)
