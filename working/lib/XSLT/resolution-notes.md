# Profile semantics notes

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

The value of `@pattern` is an (XSD) regular expression. It is matched against the ID. Both/any controls and subcontrols whose IDs match the patterns, will be returned - so in this case, any whose ID starts with "pm".

In future we may add the feature to match any associated string e.g. a title or property value, not only the ID.

### Orphan or "loose" subcontrols

It is a requirement that a subcontrol may be included in one import clause, with its control included only in another one. (Perhaps the first clause adds a subcontrol to a profile included in the second.) This should be supported as long as the control is indeed included in another import branch (with which it can eventually be merged subject to its logic). "The same control" for these purposes means the control with the same @id from the same catalog. An orphan subcontrol included without its control included anywhere, may be an error (TBD).

NB currently this feature (merging loose subcontrols) is still missing, subject to merge rules altogether. 2018/02/27

Accordingly (and contrastingly) it must also be an error if a control or subcontrol is included more than once (unless / until we define merge logic to merge 'competitors'). Or is it? In such cases, to which copies or versions of controls, are subcontrols combined? If we are going to have combination we also need resolution between competing versions.

## Merge logic

One option would be to have no merge logic permit both competitors, and loose subcontrols.

When `/profile/merge` is given, things are then merged. And initial merge could simply collapse controls and subcontrols together, and report on errors or discrepancies.
(v1: error for competitors. v2: collapse them.)

Currently `merge/build` also provides an extra functionality, rebuilding the source catalog's grouping structure (containment) 

A hypothetical `merge/reconcile` or something could handle competing controls according to some logic.

## Modify logic ("patching")

As implemented, modifications permit both removals and additions.

Two ways things can be removed --

.1. Explicit targets

```
<remove id-ref="e95b8652"/>
<remove class-ref="baseline"/>
```

Remove the element with `@id` (id attribute) `e95b8652`
Remove any element with `@class` token `baseline`

.2. Proxy/surrogates

```
<remove>
  <title/>
  <prop class="baseline"/>
</remove>
```

Remove the **title** (element), and remove any **prop** element with class (token) `baseline`.

Similarly, there are a few ways things can be added.

`<add>` elements permit two attributes to indicate the position of the addition. Four values are recognized: `before`, `after`, `starting` and `ending`.

You can add new components (stuff) to the front (after the title, before everything else) or at the end of any control or subcontrol, by including your addition in an `add` element like so:

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
  <add target="advice">
    <part class="supplemental">
       <title>Supplementary Guidelines</title>
       <p>More advice ...</p>
    </part>       
  </add>
</modify>
```

This adds the new `part` at the end of the `ac.1` control.

Note also that position "before" and "after" work only when @target is also used. They result in no addition being made. (A Schematron check could be made for this.)



