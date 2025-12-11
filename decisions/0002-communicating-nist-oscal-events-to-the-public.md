# 2. Communicating NIST's OSCAL Events to the Public

Date: 2023-02-03

## Status

Approved

## Context

The NIST OSCAL Team has necessary touchpoints with the community, among them structured and unstructured meetings with community stakeholders. Many of these meetings are events occurring at set frequencies, while others do not. In all cases, the community, past and present, has expressed the need for invitations to events that are easily accessible with the most current information possible.

## Decision

The NIST OSCAL Team will use [a public shared calendar from a service account in the Office 365 instance for NIST, as documented below](#service-account-with-published-nist-office-365-calendar). The team staff will add, change, and remove event invitations. Community members will have access to the .ics calendar invitation files in the web version. These .ics files are [iCalendar](https://en.wikipedia.org/wiki/ICalendar) files - a standard that many calendar clients support.

The NIST OSCAL Team will use the shared calendar to send invitations for public events only to [those subscribed to our mailing lists](https://pages.nist.gov/OSCAL/contact/#oscal-mailing-lists). We will not use it to send invitations to named individuals.

## Consequences

In the past, NIST staff have sent individual calendar invites from their individual accounts' calendars to specific individuals or the oscal-dev@list.nist.gov mailing list at large. Additionally, the team had published individual iCalendar (ICS) files for two of the long-standing public meetings. The latter had not been updated frequently and were out of sync until removed completely with [pull request usnistgov/OSCAL#1614](https://github.com/usnistgov/OSCAL/pull/1614). The former approach, although convenient, presents a few challenges.

1. It is difficult to quickly access one or more event invitations after they are sent.
1. Only one staff member in the team, the event's creator, can manage that event's invitation details, often when multiple staff are involved.
1. Community members often accept an invitation email via the mailing list once or several times, but not every time. They lose important updates to event details and contact us for clarification.

Therefore we need a solution that meets the following requirements for the use case of notifying community members to public meetings.

1. A system for all members of the NIST OSCAL Team to create
1. A system for all members of the NIST OSCAL Team to modify and remove existing event invitations
1. A system that allows any anonymous community member, without prior or ongoing authentication and authorization to a NIST-hosted service, to access event information
1. A system that has a standards conformant, or largely popular, calendar synchronization mechanism for authorized NIST staff and anonymous community members (iCalendar or otherwise)
1. Manage frequent changes to calendar events efficiently with short notice without waiting upon approval times by team, group, division, or lab leadership

With these high-level requirements in mind, we have several options.

## CMS for the NIST Computer Security Resource Center Website and Calendar

As part of a spike, we evaluated event management [via the content management system that published the csrc.nist.gov website, specifically the Events page](https://csrc.nist.gov/Events). Although this solution partially supports requirements 3 and 4, it does not completely support requirement 1 or 2 at all. The CMS has a permissions system that only works with one group within the respective division for those who manage the content. At this time, the NIST OSCAL Team is composed of staff from teams from two different group's in ITL's Computer Security Division, so requirements 1 and 2 are not easily achievable or unsupported based upon consultation with the web developers that maintain the system. Additionally per requirement 5, there will need to be approval for every change, imposing upon approvers for events where we have historically made frequent changes.

## NIST Main Website and the Public Events Calendar

As part of spike, we evaluated using the [CSRC CMS approach](#cms-for-the-nist-computer-security-resource-center-website-and-calendar) and selecting an option in the event creation to request it be added to [the agency-wide public calendar](https://www.nist.gov/news-events/events/calendar). This testing was very limited and had to be immediately deferred. During support consultantions with the web developers, we determined that is an integration between the CSRC CMS and a separate CMS for the [www.nist.gov website](https://www.nist.gov). We were unable to determine if the integration between the two is enabled in a test environment. As this option will publish to one location and not other, not being able to test this change causes indeterminate but high risk around requirements 1, 2, and 5.

## Sharepoint Group in NIST Office 365 Calendar

As part of this spike, we evaluated using a Sharepoint site and group for event management. We were unable to share a calendar, so this approach could not completely meet requirements 1, 2, 3, and 4.

## Service Account with Published NIST Office 365 Calendar

As part of the spike, we considered and evaluated the creation of a service account, [oscalevt@nist.gov](mailto:oscalevt@nist.gov), with permissions delegated to a private distribution group in NIST's directory containing all staff in the NIST OSCAL Team, and using a shared calendar published for anonymous access for event management. Upon testing, we confirmed that this solution best meets all three requirements.
