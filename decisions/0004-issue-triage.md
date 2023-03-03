# 4. Issue Triage for OSCAL Core Projects

Date: 2023/03/03

## Status

Feedback Requested

## Context

The NIST OSCAL Team must plan work to add, change, or remove code in project repositories. We document these plans in GitHub issues, and implement the changes as specified in these issues with pull requests. Some of these issues are decided internally by the NIST OSCAL Team, others are requested by external community members. In the past and present, many issues, especially requests from external community members, are created and do not receive timely feedback. Initially or over time, it is not clear when NIST staff have officially received a request, intend to accept the work recommendation or reject it, and an approximate time window for when that work should start.

In response to this, the former technical director and a subset of the team were involved in issue triage informally. Those team members [implemented some automation to process incoming requests](https://github.com/usnistgov/OSCAL/blob/60918cd3fc5508b69b71e8691b071108dab46ec9/.github/workflows/issue-triage.yml) and assist with ongoing triage by adding them to [a specific GitHub project, distinct from the (now legacy) project that tracked each sprint, for managing triage in bi-weekly meetings](https://github.com/usnistgov/OSCAL/projects/52). Subsequently, the team migrated sprint and overall backlog tracking from one version of project boards in GitHub, both the Issue Triage board and other uses in OSCAL-related projects, to [a newer cross-repository project board with other usability enhancements](https://github.com/orgs/usnistgov/projects/25/). The consequence of this change was the issue triage board, and process more generally, became more and more disjointed from the more recent process and tooling for planning work through issue management.

The NIST OSCAL Team potentially needs a more transparent (to NIST staff and the community) and resilient issue triage process, with larger team involvement, and supporting tooling to align with cross-repository project board they are to use day to day.

## Decision

The NIST OSCAL Team should perform periodic backlog refinement and integrate issue triage as part of the process to formally accept or reject work for inclusion into the backlog. To act upon this decision, the team would need to complete the following steps of a plan.

1. Document the backlog process (as minimally and clearly as possible).
1. Adjust the supporting automation to automate issues to go to [the new project board](https://github.com/usnistgov/OSCAL/projects/52) with a triage status.
1. Decommission the old issue triage board.
1. Schedule and initiate periodic backlog refinement with the team, asynchronously or synchronolously in private meetings (to start).

## Consequences

There are several approaches based upon the current state, each with their own consequences.

### Do Nothing

If the team operates as-is, the current process and supporting issue triage board will remain disjointed. Triage meetings have not resumed, but as it stands, the number of team members involved will decrease. The whole team's awareness of issues and their prioritization will be limited and not increase. Leaving the majority of the team outside the triage process gives them time to focus on development work, but not understand the immediate or long-term context of development tasks planned.

This approach is high risk.

### End All Issue Triage

The team has currently operated for about one month without any triage process, and the current technical director performing ad hoc issue triage and backlog prioritization as time permits. The technical director can choose to disable or remove the supporting GitHub Actions automation and the board. This approach simplifies prioritization for the technical director, but at the expense of the team not understanding short, medium, and long-term context of development. Additionally, the technical directory becomes the singular bottleneck for prioritization efforts and singularly managing all context about the present and future of development work as expressed in the board.

This approach is highest risk.

### Include the Whole Team and Update Tooling

The team can be more involved in issue triage as part of [a backlog refinement process](https://www.scrum.org/resources/blog/product-backlog-refinement-explained-13). Currently, the team does not engage in periodic, formalized backlog refinement either. Moving forward, issue triage can be considered the first step to formally adding an issue or rejecting it by closing the issue. If done frequently, issue triage would only be needed periodically for new issues. If there were no new issues queued for triage between refinement sessions, the team could primarily focus on backlog refinement for the next sprint and following sprints.

From a tooling perspective, whereas the newer GitHub Projects service did not have API support for complex operations and GitHub Actions did not readily exist during the migration to the new project board, these conditions are no longer the case.

Therefore issue triage process can be formalized as part of backlog refinment scheduled periodically for some or all team members to be involved for sufficient context. Automation can be updated to have all work requests in issues be track in one location, not four or more.

This effort will require a spike and some development work, but this approach is low risk in relation to the alternative approaches mentioned above.
