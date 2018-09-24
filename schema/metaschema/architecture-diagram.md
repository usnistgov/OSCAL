# Metaschema architecture notes

Here is some Mermaid notation:

Mermaid is a notation for producing graphics from abstract node/network descriptions - https://mermaidjs.github.io/

```
graph TB
  ms -- extract documentation --> xmldocsh[XML docs / HTML]
  xmldocsh -- generic HTML to md --> xmldocmd[XML docs / md]
  ms((Metaschema)) -- translate --> sch(XML Schema)
  ms -- xdm::object map --> xj{xml to json XSLT}
  ms -- object::xdm map --> jx{json to xml XSLT}
  ms -- translate --> jsch(JSON Schema)
  ms -- extract documentation --> jsondocsh[JSON docs / HTML]
  jsondocsh -- generic HTML to md --> jsondocmd[JSON-flavored docs / md]

classDef metasch fill:skyblue,stroke:blue,stroke-width:12px,stroke-opacity:0.2
classDef xml fill:gold,stroke:#333,stroke-width:2px;
classDef json fill:pink,stroke:#333,stroke-width:2px
classDef html fill:lightgreen,stroke-width:2px
classDef md fill:lightgreen,stroke-width:4px,stroke-dasharray:2,2

class ms metasch
class sch,xj xml
class jsch,jx json
class xmldocsh,jsondocsh html
class xmldocmd,jsondocmd md
```

*Live link to editor:*

https://mermaidjs.github.io/mermaid-live-editor/#/edit/eyJjb2RlIjoiZ3JhcGggQlRcbiAgbXMgLS0gZXh0cmFjdCBkb2N1bWVudGF0aW9uIC0tPiB4bWxkb2NzaFtYTUwgZG9jcyAvIEhUTUxdXG4gIHhtbGRvY3NoIC0tIGdlbmVyaWMgSFRNTCB0byBtZCAtLT4geG1sZG9jbWRbWE1MIGRvY3MgLyBtZF1cbiAgbXMoKE1ldGFzY2hlbWEpKSAtLSB0cmFuc2xhdGUgLS0-IHNjaChYTUwgU2NoZW1hKVxuICBtcyAtLSB4ZG06Om9iamVjdCBtYXAgLS0-IHhqe3htbCB0byBqc29uIFhTTFR9XG4gIG1zIC0tIG9iamVjdDo6eGRtIG1hcCAtLT4ganh7anNvbiB0byB4bWwgWFNMVH1cbiAgbXMgLS0gdHJhbnNsYXRlIC0tPiBqc2NoKEpTT04gU2NoZW1hKVxuICBtcyAtLSBleHRyYWN0IGRvY3VtZW50YXRpb24gLS0-IGpzb25kb2NzaFtKU09OIGRvY3MgLyBIVE1MXVxuICBqc29uZG9jc2ggLS0gZ2VuZXJpYyBIVE1MIHRvIG1kLS0-IGpzb25kb2NtZFtKU09OLWZsYXZvcmVkIGRvY3MgLyBtZF1cblxuY2xhc3NEZWYgbWV0YXNjaCBmaWxsOnNreWJsdWUsc3Ryb2tlOmJsdWUsc3Ryb2tlLXdpZHRoOjEycHgsc3Ryb2tlLW9wYWNpdHk6MC4yXG5jbGFzc0RlZiB4bWwgZmlsbDpnb2xkLHN0cm9rZTojMzMzLHN0cm9rZS13aWR0aDoycHg7XG5jbGFzc0RlZiBqc29uIGZpbGw6cGluayxzdHJva2U6IzMzMyxzdHJva2Utd2lkdGg6MnB4XG5jbGFzc0RlZiBodG1sIGZpbGw6bGlnaHRncmVlbixzdHJva2Utd2lkdGg6MnB4XG5jbGFzc0RlZiBtZCBmaWxsOmxpZ2h0Z3JlZW4sc3Ryb2tlLXdpZHRoOjRweCxzdHJva2UtZGFzaGFycmF5OjIsMlxuXG5jbGFzcyBtcyBtZXRhc2NoXG5jbGFzcyBzY2gseGogeG1sXG5jbGFzcyBqc2NoLGp4IGpzb25cbmNsYXNzIHhtbGRvY3NoLGpzb25kb2NzaCBodG1sXG5jbGFzcyB4bWxkb2NtZCxqc29uZG9jbWQgbWRcbiIsIm1lcm1haWQiOnsidGhlbWUiOiJkZWZhdWx0In19

