---
title: Testing New Releases
heading: Testing New OSCAL Releases
Description: A tutorial that 
suppresstopiclist: true
toc:
  enabled: true
alias:
- /learn/tutorials/releases/
---

This tutorial provides common ways community members can test a new release.

Before reading this tutorial, you should have a basic familiarity with:

- The OSCAL models and their [overall structure](/concepts/layer/overview/).
- [XML](https://www.w3.org/standards/xml/core), [JSON](https://www.json.org/), or [YAML](https://yaml.org/spec/) formats.
- The basics of [version control with Git and GitHub](https://docs.github.com/en/get-started/using-git/about-git).

## The OSCAL release model

OSCAL releases roughly follow a [semantic versioning](https://semver.org/) convention of `MAJOR`.`MINOR`.`PATCH` (for more details, see [the development roadmap](/contribute/roadmap/)).

For the most part, minor and patch releases have a backwards-compatibility guarantee with exceptions announced on the [GitHub discussion page](https://github.com/usnistgov/OSCAL/discussions).

### How do I provide feedback on a new release?

The OSCAL team encourages community members to submit feedback and ask questions as [GitHub issues](https://github.com/usnistgov/OSCAL/issues) or to the [release's accompanying GitHub discussion](https://github.com/usnistgov/OSCAL/discussions/categories/releases).

## Testing a new release

All releases are published to [OSCAL GitHub repository](https://github.com/usnistgov/OSCAL) in the [releases section](https://github.com/usnistgov/OSCAL/releases).

Releases are [tagged in Git](https://git-scm.com/book/en/v2/Git-Basics-Tagging) automatically with a "v" prefix. For example, a release for version 1.0.0 would be tagged `v1.0.0`.

To test a specific release, [clone the repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository) and checkout the release's associated tag. Be sure to [clone the repository with submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules#_cloning_submodules) if you plan to use XML pipeline operations.

As an example, to test the [OSCAL 1.0.5 pre-release](https://github.com/usnistgov/OSCAL/releases/tag/v1.0.5), you could clone the repository directly at the release tag:

```sh
# Clone the OSCAL repository with submodules at the 1.0.5 release
git clone --recurse-submodules https://github.com/usnistgov/OSCAL.git --branch v1.0.5
cd OSCAL
```

Or you could checkout the tag on an existing copy of the repository:

```sh
# Navigate to your OSCAL repository
cd path/to/OSCAL
# Fetch the newest changes to the repository from GitHub
git fetch --all
# Checkout the "v1.0.5" tag
git checkout v1.0.5
```

### How do I validate existing content against a new release?

### How do I perform XML pipeline operations using a new release?
