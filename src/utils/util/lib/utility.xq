declare default element namespace "http://csrc.nist.gov/ns/oscal/1.0";

let $library := 
  <docs>
    <doc>file:/home/wendell/Documents/OSCAL/working/COBIT5/cobit5-selection-oscal.xml</doc>
    <doc>file:/home/wendell/Documents/OSCAL/working/ISO-27002/iso-27002-OSCAL-refined.xml</doc>
    <doc>file:/home/wendell/Documents/OSCAL/working/SP800-53/SP800-53-OSCAL-refined.xml</doc>
    <doc>file:/home/wendell/Documents/OSCAL/working/doc/schema/oscal-oscal.xml</doc>
  </docs>
  
let $doc-set := $library/doc/doc(.)

for $d in $doc-set return
 '&#xA;' ||  document-uri($d) || ':&#xA;   ' || string-join(distinct-values($d//(part | prop[exists(@class)])/ (../name() || ../(@class/('.' || .)) || '/' || name()  ||  @class/('.' || .))), '&#xA;   ' )