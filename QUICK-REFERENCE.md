# OSCAL Control ID Quick Reference (Updated)

## TL;DR — Control and Objective Naming

**Control IDs (800‑171):**
```
CORRECT:  3.1.1
WRONG:    nist-sp-800-171-rev2_3.1.1
WRONG:    nist-sp-800-171_3.1.1
```

**Assessment Objectives (171A):**
```
Human‑readable label:  3.1.1[a]
Part ID (inside a control):  3.1.1_obj.a
WRONG:  3.1.1a
```

A control like **3.1.1** can have one or more objective parts (**a**, **b**, …). Use the **bracketed** label (`3.1.1[a]`) anywhere you need to point to a specific objective in prose or plan steps. Keep the **`_obj.<letter>`** form for the internal OSCAL part IDs.

---

## Where Each Form Appears

| Element | Format | Example | Appears In |
|---|---|---|---|
| Control ID | `X.Y.Z` | `3.1.1` | Catalogs, Assessment Plans (`related-controls.control-id`) |
| Objective Label | `X.Y.Z[letter]` | `3.1.1[a]` | Assessment objectives in human‑readable text, plan steps |
| Objective Part ID | `X.Y.Z_obj.letter` | `3.1.1_obj.c` | Inside a control’s `parts[]` (full catalogs) |
| Statement Part ID | `X.Y.Z_smt` | `3.1.1_smt` | Control statement part (full catalogs) |

> Note: Our **generated** catalog lists control **IDs and titles** for resolvability. It deliberately omits deep part structures. That’s fine for validation and cross‑referencing; you can swap in an official full catalog later without changing IDs.

---

## Examples From *These* Files

**Assessment Plan (171A) — `related-controls`:**
```json
{
  "related-controls": [
    { "control-id": "3.1.1" },
    { "control-id": "3.1.2" }
  ]
}
```

**Generated Catalog (171) — minimal resolvable entry:**
```json
{
  "id": "3.1.1",
  "title": "Limit system access to authorized users, processes acting on behalf of authorized users, and devices (including other systems)."
}
```

If you later replace the generated catalog with a full one, you’ll see additional `parts` such as `3.1.1_smt` and `3.1.1_obj.a` under each control. The **IDs will remain the same**.

---

## File Map (Current)

- `nist-sp-800-171a-rev2-assessment-plan.WIRED.json`  
  OSCAL **assessment-plan** for 171A; uses `related-controls.control-id` like `3.1.1` and objective labels like `3.1.1[a]` in human‑readable text.

- `nist-sp-800-171-rev2-catalog.GENERATED.json`  
  OSCAL **catalog** with resolvable control IDs and titles. Serves as a drop‑in reference for the plan. Replace with an official full catalog when desired (keep the filename to avoid changing the plan).

**Linkage (in the plan):**
```json
"import-profile": {
  "href": "nist-sp-800-171-rev2-catalog.GENERATED.json",
  "remarks": "Establishes catalog context for related-controls references."
}
```

---

## Adding NIST SP 800‑53 Later

No naming conflicts:
- **800‑171:** numeric (`3.1.1`, `3.5.8`, `3.14.7`)  
- **800‑53:** hyphenated (`ac-1`, `si-4`, `ir-8`)

If you need both, either:
1) Keep a single `import-profile` that references multiple catalogs; or  
2) Add explicit `catalog-id` with each `related-controls` item when disambiguation helps (optional).

---

## Why Keep IDs Simple?

- Matches official OSCAL control IDs (avoids verbose prefixes)  
- Clean for humans, stable for tooling  
- Context is provided by the imported catalog(s), not by altering IDs

---

## Next Steps

1. Use the **WIRED** plan + **GENERATED** catalog together for validation and tool integration.  
2. When you acquire a full 171 Rev.2 catalog, replace the generated file **using the same filename**.  
3. If/when you incorporate 800‑53, add a second catalog to your `import-profile` or use `catalog-id` fields where needed.
