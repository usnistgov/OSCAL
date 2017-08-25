
let $library := 
  <docs>
    <doc>file:/home/wendell/Documents/OSCAL/draft/working/SP800-53/800-53-controls-OSCAL.xml</doc>
    <doc>file:/home/wendell/Documents/OSCAL/draft/working/ISO-27002/iso-27002-OSCAL.xml</doc>
  </docs>
  
let $doc-set := $library/doc/doc(.)

return count( distinct-values($doc-set//*/local-name()) )