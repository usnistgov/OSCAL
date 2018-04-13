<catalog>{
let $library := 
  <docs>
    <doc>file:/home/wendell/Documents/OSCAL/draft/working/SP800-53/SP800-53-handmade.xml</doc>
    <doc>file:/home/wendell/Documents/OSCAL/draft/working/ISO-27002/iso-27002-OSCAL.xml</doc>
    <doc>file:/home/wendell/Documents/OSCAL/draft/working/doc/oscal-oscal.xml</doc>
  </docs>
  
let $doc-set := $library/doc/doc(.)

for $n in distinct-values($doc-set//*/local-name())
return <control type="element-description">
      <prop name="tag">&lt;{$n}></prop>
      <prop name="full_name">{$n}</prop>
      <desc>
        <p>{$n} {$n} {$n}</p>
      </desc>
      <stmt name="remarks">
        <p>{$n} {$n} {$n}</p>
      </stmt>
    </control>
  }
  </catalog>