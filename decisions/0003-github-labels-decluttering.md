# 3. Use of Labels in OSCAL Project(s)

Date: 02/17/2023

## Status

Approved

## Context

We wish to improve communication within the team and among the community members. Labels we use in OSCAL repositories can be a part of the effort.  We have discussed a number of options around labels and we will use an ADR to capture and document our approach moving forward.

- Related to Issue [#1496](https://github.com/usnistgov/OSCAL/issues/1496)

## Decision

Existing labels were reviewed, a subset of labels is kept and new ones are defined.

The lists of labels that follow will use across OSCAL repositories.

#### General labels:

- breaking change
- community feedback needed
- developer experience
- discussion needed
- epic
- faq
- rfc
- scope: ci/cd
- scope: content
- scope: documentation
- scope: metaschema
- scope: modeling
- scope: tooling and APIs
- scope: website

#### Project-specific labels:

- model engineering
- research
- profile resolution

#### Default (GH) labels:

- bug
- duplicate
- enhancement
- help wanted
- invalid
- question
- wontfix

#### Technology-identifying labels: Used by the ```dependabot```

- dependencies
- docker
- github_actions
- java
- javascript
- go
- python
- ruby
- submodules


#### Labels to be sunset/removed

- Lunch with the Devs
- Model Review 

### Use of Labels on Issues

**Creation of Issues:**

1. When issues are created, labels will be assigned by the author.
2. When the issue is triaged, selected labels will be reviewed and adjusted as necessary, including the addition of any omitted labels.

**Consistency Across Projects**
Except for the _Project-specific labels_ all other labels shall be used per their description


## Consequences

- Too many labels, or labels that are inconsistently used, will cause confusion.
- Detail information capturing the spike that researched this ADR is available [here](https://hackmd.io/UrSjUKGiQRuiA2VJLG-Mpg)
