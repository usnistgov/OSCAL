

# Sample Security Profile A
            Version 1.0
            Published: 03.10.2020
            Last Modified: 03.18.2020


# Controls from the Sample Security Catalog                                                                                                                                                                                                                                                                                                                        

The following controls are imported from the [Sample Security Catalog](https://github.com/iMichaela/OSCAL/blob/master/docs/tutorials/catalog/Catalog%20Tutorial.md) 
version 1.0. When applicable, and additional requirements or implementation guidance are provided.

## 1 Organization of Information Security

### 1.1 Internal Organization

#### 1.1.1 Information security roles and responsibilities


**Implementation guidance**

**ADDED**: The organizations should identify critical information system assets supporting essential missions and business functions.

**Other information**

**ADDED**: The appointed owners of the assets should report {organization-defined frequency} the results of assets' security verification
to the information secuirty manager. 


## 2 Access Control

### 2.1 Business Requirements of Access Control

**Objective:** To limit access to information and information processing facilities.

#### 2.1.1 Access control policy

**Implementation guidance**

**ADDED**: Organizations should develop, document, and disseminate to {organization-defined personnel or roles}:
a) An access control policy that addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance; and
b) Procedures to facilitate the implementation of the access control policy and associated access controls; and

**Other information**

**MODIFIED**: Role-based or atribute-based access control are approaches used successfully by many organizations to link access rights
with business roles.

#### 2.1.2 Access to networks and network services

**Implementation guidance**

**ADDED**: The users should be informed of the policy restrictions by displaying a {organization-define message or banner } 
before granting access to the system that provides privacy and security notices consistent with applicable federal laws, Executive Orders, directives, policies, regulations, standards, and guidance

# Controls from the NIST SP 800-53

The following controls are imported from the [NIST SP 800-53 rev4](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-53r4.pdf)

## Family: Access Control

### AC-2 Account Management 

**ADDED**: AC-2.a {Assignment: 'at least annualy'}

### AC-2(5) Account Management | Inactivity Logout

**ADDEDD**: Supplemental Guidance: The organization-defined time-period of inactivity should be shorter 
than the session termination or disconnect set by AC-12.

### AC-2(12) Account Management | Account Monitoring/Atypical Usage

**ADDED**: a) Supplemental Guidance: The control enhancement should be implemented for all priviliged accounts.

**ADDED**: b) Supplemental Guidance: The control enhancement should be implemented for all priviliged accounts.

### AC-12 Session Termination

**ADDED**: AC-12 {Assignment: '20 min of innactivity'}