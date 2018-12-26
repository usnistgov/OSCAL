# OSCAL Implementation Layer: FedRAMP System Security Plan (SSP) Mock Up<br>**ALL DATA IS FICTICIOUS**
What follows is an example of a FedRAMP SSP expressed in OSCAL-compliant XML. It is part of the NIST OSCAL effort as covered by [Issue #246](https://github.com/usnistgov/OSCAL/issues/246).

## XML Now. JSON Next.
If you are JSON fan, fret-not. As with all OSCAL content, the final specification allows for both XML and JSON. We had to start somewhere.

## Intended Next Steps
Once this mock-up is complete:
1. The OSCAL Team will peer-review it, adjust for OSCAL alignment, and consider any community input.
2. The OSCAL Team will also reach concensus as to which portions of the mock-up become part of the official OSCAL specification, and which are handled as a FedRAMP-specific extension.
3. The OSCAL Team will develop the specification details, and document the relevant syntax.
4. In cooperation with the OSCAL Team, the FedRAMP PMO will develop the specification for any FedRAMP-specific extensions as a parallel effort.

## FedRAMP SSP Modeling Effort
This is based on the OSCAL Implementation Layer FedRAMP SSP Modeling effort: 
https://hackmd.io/dATVzahrQludJILDJH675g

# The Mock Up 

This mock-up below exists in two parts:
- **Higher Level SSP Elements:** There is no content here, just the tags. View this to understand the suggested elements.
- **The Full Example:** Fully populated ficticious content. View this to understand how the tags might be used in practice.


## Higher Level SSP Elements (No Content)
This is to enumerate the suggested elements in context of their parent elements. There is no content here. Not even attributes, and some of the more detailed elements are missing to keep focus on the higher-level structure.
**An example with content exists in the next section.**

```yaml=
<fedramp_system_security_plan>
	<title/>
    <version/>
    <date/>
    
    <import href=""/>

    <publication_information>
        <sensitivity/>
		<org_name/>
		<org_short_name/>
		<org_email/>
		<org_website/>
        <prepared_by/>
        <prepared_for/>
    </publication_information>

    <publication_history>
        <published>
            <date/> 
            <version/> 
            <notes/>
        </published>
    </publication_history>
 
     <system_characteristics>
        <system_id/>
        <system_name/>
        <system_name_short/>
        <description/></description>
        <security_sensitivity_level/>
        
        <system_information>
            <information_type>
                <description/>
                <confidentiality_impact>
                    <base/>
                    <selected/>
                    <adjustment_justification/>
                </confidentiality_impact>
                <integrity_impact>
                    <base/>
                    <selected/>
                    <adjustment_justification/>
                </integrity_impact>
                <availability_impact>
                    <base/>
                    <selected/>
                    <adjustment_justification/>
                </availability_impact>
                <qualifiers>
                    <qualifier response="">
                        <sorn id=""/>
                    </qualifier>
                </qualifiers>
            </information_type>
        </system_information>

        <security_impact_level>
            <security_objective_confidentiality/>
            <security_objective_availability/>
            <security_objective_integrity/>
        </security_impact_level>

        <security_eauth>
            <security_auth_ial/>
            <security_auth_aal/>
            <security_auth_fal/>
            <security_eauth_level/>
        </security_eauth>

        <status/>
        <status_other_description/>
        <deployment_model/>
        <deployment_model_other_description/>
        <service_model/>
        <service_model_hybrid_description/>
        
        <leveraged_authorizations>
            <leveraged_authorization>
                <leveraged_authorization_name/>
                <leveraged_authorization_service_provider/>
                <leveraged_authorization_date_granted/>
            </leveraged_authorization>
        </leveraged_authorizations>

        <authorization_boundary>
            <boundary_diagram>
                <boundary_description/>
            </boundary_diagram>
        </authorization_boundary>

        <network_architecture>
            <network_diagram>
                <network_description/>
            </network_diagram>
        </network_architecture>

        <data_flow>
            <data_flow_diagram>
                <data_flow_description/>
            </data_flow_diagram>
        </data_flow>

        <users>
            <role name="" internal="yes" access="nla" sensitivity_level="limited">
                <privilege/>
                <function/>
            </role>
            <statistics>
                <internal_user_total_current/>
                <internal_user_total_future/>
                <external_user_total_current/>
                <external_user_total_future/>
            </statistics>
        </users>

    </system_characteristics>
    
    <system_implementation>
        <ports_protocols_services>
            <service>
                <protocol>
                    <port_range transport="">
                </protocol>
                <purpose/>
                <used_by/>
            </service>
        </ports_protocols_services>

        <system_inventory>
            <component id="comp-01">
                <name/>
                <description/>
            </component>
            <inventory_item id="asset_id" virtual="" public="">
                <asset_id/>
                <ip_address/>
                <network_name/>

                <host_item>
                    <netbios_name/>
                    <mac_address/>
                    <authenticated_scan/>
                    <baseline_template/>
                    <os_name/>
                    <os_version/>
                    <location/>
                    <asset_type/>
                    <hardware_vendor/>
                    <hardware_model/>
                    <scanned/>
                </host_item>

                <software_item>
                    <software_vendor/>
                    <software_name/>
                    <software_version/>
                    <software_patch_level/>
                    <function/>
                </software_item>

                <Comments/>
                <serial_no/>
                <network_id/>
                <asset_owner/>
                <asset_administrator/>
            </inventory_item>
        </system_inventory>

        <system_interconnections>
            <interconnection>
                <external_system_name/>
                <external_system_org/>
                <isa_authorization/>
                <isa_name/>
                <isa_date/>
            <interconnection>
        </system_interconnections>

    </system_implementation>

    <security_controls>
        <group>
            <control>
                <responsible_role/>
                <param>
                    <value/>
                </param>
                <implementation_status/>
                    <planned_implementation_date/>
                <control_origination/>
                <control_response/>
                <crypto/>

                <subcontrol>
                    <responsible_role/>
                    <param>
                        <value/>
                    </param>
                    <implementation_status/>
                        <planned_implementation_date/>
                    <control_origination/>
                    <control_response/>
                </subcontrol>

            </control>
        </group>
    </security_controls>
    
    <cryptography>
        <module>
            <validation/>
            <module_name/>
            <version_number/>
        </module>
    </cryptography>

    <organizations>
        <org>
            <name/>
            <address/>
            <phone/>
            <email/>
            <url/>
        </org>
    </organizations>

    <individuals>
        <individual>
            <name/>
            <title/>
            <address/>
            <phone/>
            <email/>
        </individual>
    </individuals>
    
    <parties>
        <party>
    </parties>

    <roles>
        <role title=""/>
    </roles>

    <references>
        <ref id="" ref_type="">
            <citation href=""/>
        </ref>
    </references>

    <attachments>
        <attachment>
            <name/>
            <description/>
            <format/>
            <date/> 
            <version/>
            <type/>
            <href/>
            <base64/>
        </attachment>
    <attachments>

</fedramp_system_security_plan>
```

## The Full Example

### Fictitious Information

All information used in this SSP example is fictitious. The imaginary company and system used is:

* **Organization Name:** Alpha - Cloud Service Processing (A-CSP)
* **System Name:** Alpha - Service and Automation System (A-SaaS)

### Template References

All SSP page, section, and table references are based on the FedRAMP SSP High BAseline Template published to fedramp.gov on August 8, 2018.

```yaml=
<?xml version="1.0" encoding="UTF-8"?>
<fedramp_system_security_plan id="uuid-a_csp-a_saas-20180925-195545" xmlns="http://fedramp.gov/ns/oscal/1.0">
    <!-- Title page -->
    <title>System Security Plan (SSP) Moderate Baseline</title>
    <version>2.1</version>
    <date iso-date="iso-date3">2018-09-25</date>
    
    <!-- "import" links this SSP to the appropriate FedRAMP -->
    <!-- baseline, using the same syntax as OSCAL profiles -->
    <import href="https://github.com/usnistgov/OSCAL/raw/master/content/fedramp.gov/FedRAMP_HIGH-baseline_profile.xml"/>

    <!-- "import" also allows linking to additional controls in -->
    <!-- the 800-53 catalog that are not in the FedRAMP baseline -->
    <import href="https://github.com/usnistgov/OSCAL/blob/master/content/nist.gov/SP800-53/rev4/NIST_SP-800-53_rev4_catalog.xml">
        <include>
            <call subcontrol-id="cm-7.3"/>    
            <call subcontrol-id="cm-7.4"/>    
        </include>
    </import>
    
    <publication_information>
        <sensitivity>Controlled Unclassified Information</sensitivity>
        <org_name>Alpha - Cloud Service Processing</org_name>
        <org_short_name>A-CSP</org_short_name>
        <org_email>info@a-csp.com</org_email>
        <org_website>https://www.a-csp.com</org_website>

        <!-- Page ii -->
        <prepared_by>
            <org_id>org-02</org_id>
        </prepared_by>
        <prepared_for>
            <org_id>org-01</org_id>
        </prepared_for>
    </publication_information>

    <!-- Page iii -->
    <publication_history>
        <published id="pub-1.0">
            <date iso-date="iso-date3">2017-01-02</date> 
            <version>1.0</version> 
            <notes>Initial publication.</notes>
        </published>
        <published id="pub-1.1">
            <date iso-date="iso-date3">2017-06-06</date> 
            <version>1.1</version> 
            <notes>Updated to reflect new security widget in AC-2.</notes>
        </published>
        <published id="pub-2.0">
            <date iso-date="iso-date3">2018-03-08</date> 
            <version>2.0</version> 
            <notes>Updated to reflect new active directory technology in IA-4.</notes>
        </published>
        <published id="pub-2.1">
            <date iso-date="iso-date3">2018-09-25</date> 
            <version>2.1</version> 
            <notes>Updated to reflect new use of row-based database security in AC-5.</notes>
        </published>
    </publication_history>
    
    <system_characteristics>
        <!-- Table 1-1 Information System Name and Title -->
        <system_id>F12345</system_id>
        <system_name>Alpha - Service and Automation System</system_name>
        <system_name_short>A-SaaS</system_name_short>

        <!-- Section 9.1 -->
        <description>
            <p>A brief description of the function or purpose of the system (1 - 3 paragraphs)</p>
        </description>

        <!-- Table 2-1 Security Categorization -->
        <!-- Table 2-4 Baseline Security Configuration -->
        <system_sensitivity_level>moderate</security_sensitivity_level>

        <!-- Table 2-2 Sensitivity Categorization of Information Types -->
        <!-- Table 15-9 CSP Applicable Information Types with Security Impact Levels -->
        <!-- Attachment 4. Privacy Threshold Analysis (PTA) -->
        <system_information>
            <information_type id="info-01" nist_id="D.2.1">
                <description>Border and Transportation Security</description>
                <confidentiality_impact>
                    <base>moderate</base>
                    <selected>moderate</selected>
                </confidentiality_base_impact>

                <integrity_impact>
                    <base>moderate</base>
                    <selected>moderate</selected>
                </integrity_impact>
                
                <availability_impact>
                    <base>moderate</base>
                    <selected>moderate</selected>
                </availability_impact>
            </information_type>
            
            <information_type id="info-02" nist_id="D.4.1">
                <description>Disaster Management and Prediction</description>
                
                <confidentiality_impact>
                    <base>low</base>
                    <selected>low</selected>
                </confidentiality_base_impact>

                <integrity_impact>
                    <base>high</base>
                    <selected>high</selected>
                </integrity_impact>
                
                <availability_impact>
                    <base>high</base>
                    <selected>low</selected>
                    <adjustment_justification>
                        <p>System is for research and analysis only. Access to information in this system at the time of a disaster is not critical.</p>
                    </adjustment_justification>
                </availability_impact>
            </information_type>

            <information_type id="info-03" type="pii">
                <description>A Privacy Sensitive System</description>

                <!-- Attachment 4, Qualifying Questions -->
                <qualifiers>
                    <qualifier id="pta-01" response="yes">
                        <p>Does the ISA collect, maintain, or share PII in any identifiable form?</p>
                    </qualifier>
                    <qualifier id="pta-02" response="yes">
                        <p>Does the ISA collect, maintain, or share PII information from or about the public?</p>
                    </qualifier>
                    <qualifier id="pta-03" response="yes">
                        <p>Has a Privacy Impact Assessment ever been performed for the ISA?</p>
                    </qualifier>
                    <qualifier id="pta-04" response="yes">
                        <p>Is there a Privacy Act System of Records Notice (SORN) for this ISA system?</p>
                        <sorn id="[SORN ID]">Sorn Name</sorn>
                    </qualifier>
                </qualifiers>
            </information_type>

        </system_information>

        <!-- Table 2-3 Security Impact Level -->
        <security_impact_level
            <security_objective_confidentiality>moderate</security_objective_confidentiality>
            <security_objective_availability>moderate</security_objective_availability>
            <security_objective_integrity>moderate</security_objective_integrity>
        </security_impact_level>

        <!-- Section 2.3 Digital Identity Determination -->
        <!-- Attachment 3, Digital Identity Worksheet -->
        <security_eauth>
            <security_auth_ial>moderate</security_auth_ial>
            <security_auth_aal>moderate</security_auth_aal>
            <security_auth_fal>moderate</security_auth_fal>
            <security_eauth_level>moderate</security_eauth_level>
        </security_eauth>

        <!-- Table 7-1 System Status -->
        <status>operational</status>
        <status_other_description>N/A</status_other_description>

        <!-- Table 8-1 Service Layers Represented in this SSP -->
        <deployment_model>saas</deployment_model>
        <deployment_model_other_description>N/A</deployment_model_other_description>

        <!-- Table 8-2 Cloud Deployment Model Represented in this SSP -->
        <service_model>government_only_community</service_model>
        <service_model_other_description>N/A</service_model_other_description>
		        
        <!-- Table 8-3 Leveraged Authorizations -->
        <leveraged_authorizations>
            <leveraged_authorization id="la-01">
                <leveraged_authorization_name>A Big IaaS (ABI)</leveraged_authorization_name>
                <leveraged_authorization_service_provider>A Big IaaS Provider (ABIP)</leveraged_authorization_service_provider>
                <leveraged_authorization_date_granted iso-date="iso-date3">2016-09-09</leveraged_authorization_date_grantved>
            </leveraged_authorization>
        </leveraged_authorizations>

        <!-- Figure 9-1. Authorization Boundary Diagram -->
        <authorization_boundary>
            <boundary_diagram id="dia-01" attachment_id="att-003">
                <boundary_description>
                    <p>This is optional text that provides additional, written detail to the attached boundary diagram.</p>
                </boundary_description>
            </boundary_diagram>
        </authorization_boundary>

        <!-- Figure 9-2. Network Diagram -->
        <network_architecture>
            <network_diagram id="dia-02" attachment_id="att-004">
                <network_description>
                    <p>This is optional text that provides additional, written detail to the attached network diagram.</p>
                </network_description>
            </network_diagram>
        </network_architecture>

        <!-- Figure 10-1. Data Flow Diagram -->
        <data_flow>
            <data_flow_diagram id="dia-03" attachment_id="att-005">
                <data_flow_description>
                    <p>This is optional text that provides additional, written detail to the attached data flow diagram.</p>
                </data_flow_description>
            </data_flow_diagram>
        </data_flow>

        <!-- Table 9-1. Personnel Roles and Privileges -->
        <users>
            <role id="ut-01" name="UNIX System Administrator" internal="yes" access="p" sensitivity_level="moderate">
                <privilege>Full administrative access (root)</privilege>
                <function>Add/remove users and hardware</function>
                <function>Install and configure software</function>
                <function>OS updates</function>
                <function>patches and hotfixes</function>
                <function>perform backups</functions>
            </role>
            <role id="ut-02" name="Client Administrator" external="yes" access="np" sensitivity_level="n/a">
                <privilege>Portal administration</privilege>
                <function>Add/remove client users</function>
                <function>Create, modify, and delete client applications</function>
            </role>
            <role id="ut-03" name="Program Director" internal="yes" access="nla" sensitivity_level="limited">
                <privilege>none</privilege>
                <function>Reviews, approves, and enforces policy</function>
            </role>
            <statistics>
                <internal_user_total_current>22</internal_user_total_current>
                <internal_user_total_future>33</internal_user_total_future>
                <external_user_total_current>75</external_user_total_current>
                <external_user_total_future>100</external_user_total_future>
            </statistics>
        </users>

    </system_characteristics>	    

    <system_implementation>
        <!-- Table 10-1 Ports, Protocols and Services -->
        <!-- NOTE: For now, this captures the same detail as the SSP. -->
        <!-- It is possible to capture more accurate/complete content. -->
        <ports_protocols_services>
            <service id="svc-01" name="Domain Name Service (DNS) Lookup">
                <protocol name="dns">
                    <port_range start="53" end="53" transport="tcp"/>
                </protocol>
                <purpose>Allows name resolution of hosts.</purpose>
                <used_by>external user workstations</used_by>
                <used_by>internal hosts</used_by>
            </service>
            <service id="svc-02" name="Web Services">
                <protocol name="http">
                    <port_range start="80" end="80" transport="tcp"/>
                </protocol>
                <protocol name="https">
                    <port_range start="443" end="443" transport="tcp"/>
                </protocol>
                <purpose>Provides web services for the application.</purpose>
                <used_by>External users to access the application</used_by>
            </service>
        </ports_protocols_services>

        <!-- Table 13-3 CA-3 Authorized Connections -->
        <system_interconnections>
            <interconnection id="ic-01">
                <external_system_name>Weather Server</external_system_name>
                <external_system_org>NOAA</external_system_org>
                <isa_authorization>M.Y. Ayaoh</isa_authorization>
                <isa_name>Weather Connection</isa_name>
                <isa_date iso-date="iso-date3">2018-09-25</isa_date>
            </interconnection>
        </system_interconnections>

        <!-- Attachment 13 Integrated Inventory Workbook -->
        <system_inventory>
            <component id="comp-01">
                <name>Linux Host</name>
                <crypto crypto_id="crypto-01"/>
                <crypto crypto_id="crypto-02"/>
                <description>
                    <p>Physical and virtual linux hosts are used as the primary platform for all server needs within the system, unless another platform is needed to achieve a specific requirement.</p>
                </description>
            </component>
            <component id="comp-02">
                <name>Web Server</name>
                <description>
                    <p>Apache is used for all web servers, and is always installed on a Linux OS.</p>
                </description>
            </component>
            <component id="comp-03">
                <name>SQL Server</name>
                <description>
                    <p>We use Acme BigSQL for our database needs, and always run it on a Linux platform.</p>
                </description>
            </component>
        
            <inventory_item id="123.45.67.96" virtual="no" public="yes" comp_id="comp-01" comp_id="comp-02">
                <ip_address>123.45.67.96</ip_address>
                <ip_address>123.45.68.96</ip_address>
                <network_name>acme-web-a.a-csp.com</network_name>

                <host_item>
                    <netbios_name>acme-web-a</netbios_name>
                    <mac_address>00:01:02:03:04:05</mac_address>
                    <authenticated_scan>yes</authenticated_scan>
                    <baseline_template>Base Config 1</baseline_template>
                    <os_name>CentOS</os_name>
                    <os_version>5.1</os_version>
                    <location>Primary data center, Rack A-1</location>
                    <asset_type>Web Server</asset_type>
                    <hardware_vendor>Acme</hardware_vendor>
                    <hardware_model>web-1000</hardware_model>
                    <scanned>yes</scanned>
                </host_item>

                <Comments>This is a public-facing hardware-based web server</Comments>
                <serial_no>aw-12345</serial_no>
                <network_id id="vlan-01">123.45.67.00/24</network_id>
                <network_id id="vlan-02">123.45.68.00/24</network_id>
                <asset_owner>Jonathan Jacob</asset_owner>
                <asset_administrator>Mr. L.N.X. Guru</asset_administrator>
            </inventory_item>
            <inventory_item id="123.46.78.400" virtual="no" public="no" comp_id="comp-01" comp_id="comp-03">
                <ip_address>123.46.78.400</ip_address>
                <ip_address>123.47.78.400</ip_address>
                <network_name>big-db.a-csp.com</network_name>

                <software_item>
                    <software_vendor>Acme</software_vendor>
                    <software_name>Big SQL</software_name>
                    <software_version>7.7</software_version>
                    <software_patch_level>Level 7</software_patch_level>
                    <function>Houses all the data</function>
                </software_item>

                <Comments>All the sensitive information is stored here.</Comments>
                <serial_no>asq-121212</serial_no>
                <network_id id="vlan-03">123.46.0.0/16</network_id>
                <network_id id="vlan-04">123.47.0.0/16</network_id>
                <asset_owner>Jonathan Jacob</asset_owner>
                <asset_administrator>Mr. L.N.X. Guru</asset_administrator>
            </inventory_item>
        </system_inventory>

    </system_implementation>

    <!-- Section 13 -->
    <security_controls>
        <group class="family" id="ac">
            <control class="SP800-53" id="ac-1" href="https://github.com/usnistgov/OSCAL/raw/master/content/fedramp.gov/FedRAMP_MODERATE-baseline_profile.xml">

                <responsible_role role_id="ut-04"/>

                <param id="ac-1_prm_1">
                    <value>all staff with system access</value>
                </param>
                <param id="ac-1_prm_2">
                    <value>annually, and as needed</value>
                </param>
                <param id="ac-1_prm_3">
                    <value>every three years, and when the system undergoes a significant change</value>
                </param>

                <implementation_status>implemented</implementation_status>

                <control_origination>service_provider_corporate</control_origination>
                <control_origination>service_provider_system_specific</control_origination>

                <control_response id="ac-1_smt.a" origination="service_provider_corporate">
                    <p>The A-CSP CIO's office maintains the <attached id="att-101">A-CSP Access Control Policy</attached>. This CIO's office ensures this policy is disseminated to all A-CSP staff.</p>
                </control_response>
                <control_response id="ac-1_smt.a" origination="service_provider_system_specific">
                    <p>The A-SAAS ISSO is responsible for maintaining the <attached id="att-102">A-SaaS Access Control Policy</attached>. This ISSO ensures this policy is disseminated to all individuals with logical access to A-SAAS.</p>
                </control_response>
                <control_response id="ac-1_smt.b" origination="service_provider_system_specific">
                    <p>The A-SAAS ISSO maintains the <attached id="att-103">A-SaaS Access Control Procedure</attached>, which is used for granting all system access. This ISSO ensures this procedure is disseminated to all individuals with administrative access to A-SAAS.</p>
                </control_response>

            </control>

            <control class="SP800-53" id="ac-2" href="https://github.com/usnistgov/OSCAL/raw/master/content/fedramp.gov/FedRAMP_MODERATE-baseline_profile.xml">

                <responsible_role role_id="ut-01"/>
                <responsible_role role_id="ut-02"/>
                <responsible_role role_id="ut-03"/>

                <param id="ac-2_prm_1">
                    <value>all system accounts</value>
                </param>
                <param id="ac-2_prm_2">
                    <value>immediate supervisor or system ISSO</value>
                </param>
                <param id="ac-2_prm_3">
                    <value>the A-CSP Access Control Policy</value>
                </param>
                <param id="ac-2_prm_4">
                    <value>as needed</value>
                </param>

                <implementation_status>implemented</implementation_status>

                <control_origination>service_provider_system_specific</control_origination>
                <control_origination>customer_responsibility</control_origination>
                <control_origination>inherited</control_origination>

                <control_response id="ac-2_smt.a" origination="service_provider_system_specific">
                    <p>In accordance with the <attached id="att-102">A-SaaS Access Control Policy</attached>, the system ISSO identifies all A-SaaS system administrators to support the A-SaaS mission.</p>
                </control_response>
                <control_response id="ac-2_smt.a" origination="customer_responsibility">
                    <p>The customer must define which A-SAAS application user account types support the customer's mission.</p>
                </control_response>
                <control_response id="ac-2_smt.a" origination="inherited" inherited_from="la-01">
                    <p>For the hypervisor and below, this is inherited from ABI.</p>
                </control_response>
                <!-- Sniped statements b through k -->


                <subcontrol class="SP800-53" id="ac-2.1" href="https://github.com/usnistgov/OSCAL/raw/master/content/fedramp.gov/FedRAMP_MODERATE-baseline_profile.xml">

                    <responsible_role role_id="ut-04"/>
                    <responsible_role role_id="ut-02"/>
                    <responsible_role role_id="ut-03"/>

                    <implementation_status>partially_implemented</implementation_status>
                        <planned_implementation_date>2019-06-01</planned_implementation_date>

                    <control_origination>service_provider_system_specific</control_origination>
                    <control_origination>inherited</control_origination>

                    <control_response id="ac-2.1_smt" origination="service_provider_system_specific">
                        <p>This is where the CSP describes how they have implemented automated mechanisms in the support of system account management</p>
                    </control_response>
                    <control_response id="ac-2.1_smt" origination="inherited" inherited_from="la-01">
                        <p>This where the CSP describes what they inherit from ABI in support of AC-2(2).</p>
                    </control_response>

                </subcontrol>
            </control>
        </group>
    </security_controls>

    <cryptography>
        <module id="crypto-01">
            <validation type="certificate_no" org="NIST Labs">00000001</validation>
            <module_name>crypto_guard_supreme</module_name>
            <version_number>1.23</version_number>
        </module>
        <module id="crypto-02">
            <validation type="certificate_no" org="NIST Labs">00000010</validation>
            <module_name>crypto_guard_supreme</module_name>
            <version_number>1.23</version_number>
        </module>
    </cryptography>

    <organizations>
        <org id="org-01">
            <name>Alpha - Cloud Service Processing</name>
            <address>
              <addr-line>12345 S. Main Street</addr-line>
              <city>Star City</city>
              <state>ST</state>
              <postal-code>54321</postal-code>
              <country>US</country>
            </address>
            <email>main@a-csp.com</email>
            <phone>703-555-1212</phone>
            <url>https://www.a-csp.com</url>
        </org>
        <org id="org-02">
            <name>Three Partners Auditing Objectives (3PAO)</name>
            <address></address>
            <email>main@3pao.com</email>
            <phone>703-555-1212</phone>
            <url>https://www.3pao.com</url>
        </org>
        <org id="org-03">
            <name>Three Letter Agency (TLA)</name>
            <address></address>
            <email>main@tla.gov</email>
            <phone>703-555-1212</phone>
            <url>https://www.tla.gov</url>
        </org>
        <org id="org-04">
            <name>Department of Homeland Security (DHS), Office of the CIO</name>
            <!-- Table 6-1 AO POC -->
            <role title="DHS AO POC" individual_id="ind-05">
        </org>
        <org id="org-05">
            <name>Department of Defense (DoD), Office of the CIO</name>
            <!-- Table 6-1 AO POC -->
            <role title="DoD AO POC" individual_id="ind-06">
        </org>
        <org id="org-06">
            <name>General Services Administration (GSA), Office of the CIO</name>
            <!-- Table 6-1 AO POC -->
            <role title="GSA AO POC" individual_id="ind-07">
        </org>
    </organizations>

    <individuals>
        <individual id="ind-01" org="org-01">
            <name>I.M. DaBoss</name>
            <title>VP Operations</title>
            <phone type="mobile">703-555-6161</phone>
            <email>imdaboss@a-csp.com</email>
        </individual>
        <individual id="ind-02" org="org-01">
            <name>Blurry Face</name>
            <title>Cyber Security Director</title>
            <phone type="mobile">703-555-9111</phone>
            <email>bface@a-csp.com</email>
        </individual>
        <individual id="ind-03" org="org-03">
            <name>Buck Stops-Here</name>
            <title>CIO</title>
            <phone type="office">703-555-0000</phone>
            <email>bstops-here@tla.gov</email>
        </individual>
    </individuals>

    <parties>
        <party title="Joint Authorization Board (JAB)" id="jab">
            <member org_id="org-04">
            <member org_id="org-05">
            <member org_id="org-06">
        </party>
    </parties>

    <roles>
        <!-- Page xvii -->
        <role id="role-01" title="Approver" individual_id="ind-01"/>
        <role title="Approver" individual_id="ind-02"/>
        <!-- Table 3-1 Information System Owner -->
        <role id="role-02" title="System Owner" individual_id="ind-01"/>
        
        <!-- Table 5-1 Information System Management POC -->
        <role id="role-03" title="System Management POC" individual_id="ind-01"/>

        <!-- Table 5-2 Information System Technical POC -->
        <!-- NOTE: role-04 twice is not a typo. The id is for the role. -->
        <role id="role-04" title="System Technical POC" individual_id="ind-02"/>
        <role id="role-04" title="System Technical POC" individual_id="ind-04"/>

        <!-- Table 6-1 System ISSO (CSP) -->
        <role id="role-05" title="System Internal ISSO" individual_id="ind-02"/>

        <!-- Section 4. Authorizing Officials -->
        <role id="role_ao" title="Authorizing Official" party_id="jab"/>
        
        <!-- Page ii -->
        <role id="role-06" title="Prepared By" org_id="org-02"/>
        <role id="role-07" title="Prepared For" org_id="org-01"/>

        <!-- Table 15-6 System Privacy POC -->
        <role id="role-08" title="Privacy POC" individual_id="ind-01"/>

    </roles>

    <!-- Section 12, Table 12-1, Table 12-2, plus other external references as needed. -->
    <!-- Attachment 12. -->
    <references>
        <ref id="ref-01" ref_type="other">
            <citation href="https://www.fedramp.gov/assets/resources/templates/SSP-A12-FedRAMP-Laws-and-Regulations-Template.xlsx">FedRAMP Applicable Laws and Regulations</citation>
        </ref>
        <ref id="ref-02" ref_type="law">
            <citation href="http://www.gpo.gov/fdsys/granule/CFR-2012-title5-vol2/CFR-2012-title5-vol2-sec731-106/content-detail.html">5 C.F.R. 731.106</citation>
        </ref>
    </references>

    <!-- Table 15-1 Mames of Provided Attachments -->
    <attachments>
        <attachment id="att-001" href="./attachments/rob.docx">
            <name>Rules of Behavior</name>
            <description>The Rules of Behavior document</description>
            <format>.docx</format>
            <date iso-date="iso-date3">2017-02-03</date> 
            <version>2.0</version>
            <type>MS Word</type>
        </attachment>

        <attachment id="att-101" href="./attachments/policies/01_a_csp_access_cotrol_policy.docx">
            <name>A-CSP Access Control Policy</name>
            <description>Corporate A-CSP Access Control Policy</description>
            <format>.docx</format>
            <date iso-date="iso-date3">2015-06-06</date> 
            <version>2.1</version>
            <type>MS Word</type>
        </attachment>

        <attachment id="att-102" href="./attachments/policies/01_a_saas_access_cotrol_policy.docx">
            <name>A-SaaS Access Control Policy</name>
            <description>System-specific A-SaaS Access Control Policy</description>
            <format>.docx</format>
            <date iso-date="iso-date3">2017-12-12</date> 
            <version>1.1</version>
            <type>MS Word</type>
        </attachment>

        <attachment id="att-103" href="./attachments/policies/01_a_saas_access_cotrol_process.docx">
            <name>A-SaaS Access Control Process</name>
            <description>System-specific A-SaaS Access Control Process</description>
            <format>.docx</format>
            <date iso-date="iso-date3">2017-12-12</date> 
            <version>1.2</version>
            <type>MS Word</type>
        </attachment>

        <!-- If the OSCAL Team decides to allow Base64 encoding of -->
        <!-- graphics (logos, boundary diagrams) and/or attachment, -->
        <!-- I recommend the attachments element be listed last, and -->
        <!-- all Base64 encoded attachments, be listed at the back -->
        <!-- of the list of attachments. -->
        <!-- This keeps the large, non-human-readable Base64 data -->
        <!-- out of the way. -->
        <attachment id="att-002">
          <name>Logo</name>
          <description>A-CSP Logo</description>
          <format>.png</format>
          <date iso-date="iso-date3">2017-01-02</date> 
          <version>1.0</version>
          <type>graphic</type>
          <base64 filename='csp_logo.png'>iVBORw0KGgoAAAANSUhEUgAAAMoAAAAtCAIAAABgRmPFAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAATBSURBVHhe7ZpLjqQwDIbnIL2c09SqzsKCs7RUR0F1FLjBLFAtSkhIPc4DsCGJHUikmpE/ZdFNheDYv/OA/PpRlGqovJSKqLyUiqi8lIqovJSKqLyUiqi8lIqovJSKqLyUiqi8lIqovJSKZMtr7p+v2338+v3Hldv91Q2z/5Fh7h7k3q/7eGvf3eB//p/oh+m7HW/3paemwL+v7+fc+yo5DHvXnW/KUti8KFnyGt6NMWhskBHe0HbaroD+HnvBmYvQB9sBfwkYQKyun+j689U8/Z9di/ufKNDC2BilCoXu6R9I69Hy6nx1ETb93I1j85j6NXmso7br/irLHL7LuA7CgS/OXTt+c7la2rw0Ynn1kD3m2RFfg3EPE93OBmwnLx/F+ztu9GzaNxIxT1nl5YHGaZ4dnehU7irkDKiWYQ3hVm5nXIzaiXQWortUACP9xSjD2/o85bpFZD7zk/IqbR6PTF6QFu6p+8ATIHusZVDayV8zTA1/r2VI1PQ/2RJ1Ih6NjiNokpkomNgvBLeQGvCQkckQrtpiRANMVlvpmqXNEyGQF3mevxZj6QMOz5IQonjbykEhoolS6ESBoBFYmlk3OvA8zvVUEOlNW0Ktu/SLeqaweVJYeZ3rZ0he0HlYtPmLccARF+RF/Jg1CF2S19ZHKIKQ4PohI3EvpMaYNiOeKW2eGE5eOar3mDhhm7BATbG7xcQOBS3tMR8sLzJkih5KfHLoTvrXKGBGsHJp8zJg5IVXPHKnw1KArBxJyEkx2z3hZlgmL+LKrOXXeXnR/JE9NGUntiRvegpmZmnzckjLiwyqGU7vHruNidkz46ZChe6TD0jkdT4wV+R1xkt0REll48XVT3nzcqgjrzCDERnOpGDBr9AwSXnN+MWEKfn76o+RF/1J5cUwTPtI23fQy146VEL9ic+wa7EvV83rN39LFv+SvOgTY8Vb8rnyotP2WXm9m/jkbUYd80J1e4orx/letvY6T668unYJ/OXFzW65nTM5BlYd++G/tHk5MEt78hj5Eq+HIcT/6bonGOHt1Lk+65gxHyYv2PSsncoPRjrkZLzhO0vkGBhpSpuXASMv4nSximFAQgZZW6Umrp79bHnZyihniCAEucTUz9uwY8vDfi5snhxOXlT7oieRoQtYUkHyTnV73EHKnyQvF37iDTyEcLeT4SRcGQWYz0xB5cLmSeHlBWzJxHa1f772sUcjreA7setbQEA5DjqDWF6r93fJhqOSzEOZdFB/mazmRy9DYfNkiOQFiD6amv3gMTBOXvY0RLM7e3PAfbEPRZfMF5e7fUSYsuizfSBI/JEElGywyWV6sekmsXdbzgG4kvRMYfMESOUF2BNtrg/0ZFXvD7sdxi0HWEw7sx5Uoo24F1eh75L7AznWhmJnkqD9/YGckLy27i8lPAaQA1X4gwTau8gPUVpfLa3R187WY5Cxa1Ng4cgmXlnzODLk5fCn2LCjmVOOkRcTrp21ETO8HRSDJ8RYuTKS4Wklv6SmGBd7cjTXHgdNf5mI4l/f0NbaU01ZCpsXJVteiiJH5aVUROWlVETlpVRE5aVUROWlVETlpVRE5aVUROWlVETlpVRE5aVUROWlVETlpVRE5aVUROWlVOPn5y9OeK7Cv/yElwAAAABJRU5ErkJggg==</base64>
        <attachment id="att-003">
          <name>Signature - Chief Privacy Officer</name>
          <description>Digital signature of the CPO</description>
          <format></format>
          <date iso-date="iso-date3">2017-01-02</date> 
          <version>1.0</version>
          <type>digital signature</type>
          <base64>iVBORw0KGgoAAAANSUhEUgAAAMoAAAAtCAIAAABgRmPFAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAATBSURBVHhe7ZpLjqQwDIbnIL2c09SqzsKCs7RUR0F1FLjBLFAtSkhIPc4DsCGJHUikmpE/ZdFNheDYv/OA/PpRlGqovJSKqLyUiqi8lIqovJSKqLyUiqi8lIqovJSKqLyUkRcTrp21ETO8HRSDJ8RYuTKS4Wklv6SmGBd7cjTXHgdNf5mI4l/f0NbaU01ZCpsXJVteiiJH5aVUROWlVETlpVRE5aVUROWlVETlpVRE5aVUROWlVETlpVRE5aVUROWlVETlpVRE5aVUROWlVOPn5y9OeK7Cv/yElwAAAABJRU5ErkJggg==</base64>
        </attachment>
    </attachments>

</fedramp_system_security_plan>

```
