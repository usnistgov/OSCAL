<stylesheet>{
let $library := 
  <docs>
    <doc>file:/home/wendell/Documents/OSCAL/draft/working/SP800-53/SP800-53-handmade.xml</doc>
    <doc>file:/home/wendell/Documents/OSCAL/draft/working/ISO-27002/iso-27002-OSCAL.xml</doc>
    <doc>file:/home/wendell/Documents/OSCAL/draft/working/doc/oscal-oscal.xml</doc>
  </docs>
  
let $doc-set := $library/doc/doc(.)

for $n in distinct-values($doc-set//*/local-name())
return <template match="oscal:{$n}">
     <x class="{$n}">
       <apply-templates/>
       </x>
  </template>
  }
  </stylesheet>