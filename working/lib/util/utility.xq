declare default element namespace "http://scap.nist.gov/schema/oscal";

let $library := 
  <docs>
    <doc>file:/home/wendell/Documents/OSCAL/working/COBIT5/cobit5-selection-oscal.xml</doc>
    <doc>file:/home/wendell/Documents/OSCAL/working/ISO-27002/iso-27002-OSCAL-refined.xml</doc>
    <doc>file:/home/wendell/Documents/OSCAL/working/SP800-53/SP800-53-OSCAL-refined.xml</doc>
    <doc>file:/home/wendell/Documents/OSCAL/working/doc/schema/oscal-oscal.xml</doc>
  </docs>
  
let $doc-set := $library/doc/doc(.)

return distinct-values($doc-set//(p | li)//*/local-name())