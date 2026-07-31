# Security notes for `resolver-pipeline`

This directory is a **demonstration implementation** of OSCAL Profile
resolution (see `../readme.md`). Read this before reusing it, or the
algorithm it implements, outside of this repository's own pipeline.

## The weakness

`o:resource-or-error()` in `oscal-profile-resolve-select.xsl` resolves
every profile `import` (and certain `rlink` references) by calling
XSLT's `document()` on the fully-resolved URI, with **no scheme
allow-list, no host restriction, and no path confinement**, unless the
caller explicitly opts in to the `trusted-roots` parameter described
below. By default, a profile can direct the resolver to:

- read any local file the resolving process can reach (path traversal,
  [CWE-22](https://cwe.mitre.org/data/definitions/22.html)), or
- make an outbound request to any host and port the resolving process
  can reach (server-side request forgery,
  [CWE-918](https://cwe.mitre.org/data/definitions/918.html)).

This is unrestricted by design in the reference implementation, matching
its purpose as a demonstration rather than a hardened service component.

## Why this is not a live issue in NIST's own pipeline

This resolver runs as part of `usnistgov/oscal-content`'s CI, including
against pull requests from external contributors, before human review.
That's mitigated by process, not by the code:

- CI runs on generic, non-privileged, ephemeral compute, with no
  repository secrets exposed to fork-originated runs.
- The CI run's output never enters the repository. It exists, at most, as
  a short-lived build artifact.
- No content reaches an official, released resolved profile without
  passing manual inspection of the actual generated output, followed by
  a separately-reviewed `develop`-to-`main` release step.

**If you reuse this code, or the pattern it implements, without an
equivalent review process in front of it, none of the above protects
you.** A service that resolves profiles submitted by parties it doesn't
control (a GRC platform accepting tenant-authored profiles, an agency's
automated pipeline, anything without a human inspecting output before
it's trusted) inherits the full impact demonstrated above: arbitrary
local file read and SSRF, using whatever credentials and network
reachability that service has.

## If you're integrating this code

Start by deciding whether the profiles you resolve are trusted input. If
any profile, or any document it imports, can be authored or influenced
by a party you do not control, everything below applies. If every
profile is authored in-house and reviewed before resolution, the default
behaviour may be acceptable, but write that assumption down somewhere
your operators will see it, because it is the assumption that fails
first when a system grows.

### Constrain what can be fetched

Treat `trusted-roots` as an allow-list rather than a hint. A root should
name a scheme and a host, and where you can, a path prefix, so that
`https://example.gov/catalogs/` does not also authorize
`https://example.gov/user-uploads/`. Reject `file:` outright unless local
resolution is a requirement. If it is, confine it to a single directory
and resolve symbolic links before comparing, since a check performed on
the unresolved path can be defeated by a link placed inside the allowed
directory.

### Re-validate redirects rather than inheriting trust from the first hop

A containment check runs before the request goes out, so it tells you
nothing about where the response actually came from. The concern is not
that a trusted host redirects deliberately. It is that a trusted host
carries an open redirect somewhere in it, which is attacker-driven and
requires no compromise of that host.

Validate every hop against the same allow-list, and cap the number of
hops. Where an official location has genuinely moved off the list,
prefer updating the list to following the redirect. If you must follow
it, make that an explicit opt-in rather than the default, so the
permissive behaviour is something an integrator chooses knowingly.

### Bound the work

Profile imports resolve recursively, so a single submitted profile can
fan out into many fetches. Put a ceiling on the number of documents
resolved, the total bytes read, and the depth of the import chain, and
fail the resolution rather than silently truncating it. Set a connection
and read timeout on every fetch; the default in most XSLT processors is
no timeout at all, which turns a slow endpoint into a stalled pipeline.

### Do not rely on the URI check alone

Run resolution with the least network reachability and the fewest
credentials it can do its job with, on a host that cannot reach your
internal services or a cloud metadata endpoint. That is what bounds the
damage if any of the above is bypassed, and it is the only control here
that does not depend on getting a URI comparison exactly right.

### Treat the resolved output as untrusted

A resolved catalog can carry content drawn from wherever the imports
pointed. Whatever consumes it next, a user interface, a report
generator, a downstream tool, should escape or validate that content
rather than assume resolution produced trustworthy text.
