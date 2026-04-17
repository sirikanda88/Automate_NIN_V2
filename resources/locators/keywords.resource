*** Settings ***
Library    Browser    timeout=30s
Library    String
Library    Collections
Library    OperatingSystem
Library    SeleniumLibrary
Library    DebugLibrary
Resource    ${CURDIR}/../../keywords/page/variables.resource
Variables    ${CURDIR}/../testdata/testdata.yaml
Variables    ${CURDIR}/../testdata/user.yaml

*** Variables ***
@{collecttion_nin_id}


*** Keywords ***
Wait and Click
    [Arguments]    ${selector}    ${timeout}=30s
    Wait For Elements State    ${selector}    visible    timeout=${timeout}
    Click    ${selector}
Wait and Fill
    [Arguments]    ${selector}    ${text}    ${timeout}=30s
    Wait For Elements State    ${selector}    visible    timeout=${timeout}
    Fill Text    ${selector}    ${text}

Master Setup NIN Group
    Wait and Click    ${top_bar_menu_locator_lbl_desktop}
    Wait and Click    ${top_bar_menu_locator_blb_master_setup}
    Hover        id=menu-list
    Wait and Click    ${master_setup_list_lnk_setup_nin_group}

Query TT Menu 
    Wait and Click             ${top_bar_menu_locator_lbl_query}
    Click                      ${top_bar_menu_locator_lbl_query_TT}   
  
Query TT ID
    Wait For Elements State    ${query_tt_locator_ddl_ttIdYear}    visible    timeout=30s
    Click                      ${query_tt_locator_input_ttIdText}
    Fill Text                  ${query_tt_locator_input_ttIdText}     ${tt_id}[id_for_create]
    Click                      ${query_tt_locator_btn_search}
    Wait and Click             ${query_tt_locator_lnk_tt_id_link}


Field Service group
    Wait and Click             ${create_nin_locator_btn_create_nin} 
    ${service_text}=    Browser.Get Text    ${service_group_locator_txt_field}
    Should Be Equal     ${service_text}     ALL

Service group dropdown list
    Click    ${service_group_locator_ddl_field}
    Wait For Elements State    ${service_group_locator_ddl_list}    visible

    Wait For Elements State    ${service_group_locator_ddl_mbb}
    Browser.Get Text    ${service_group_locator_ddl_mbb}    ==    MBB

    Wait For Elements State    ${service_group_locator_ddl_fbb}
    Browser.Get Text    ${service_group_locator_ddl_fbb}    ==    FBB

    Wait For Elements State    ${service_group_locator_ddl_enterprise}
    Browser.Get Text    ${service_group_locator_ddl_enterprise}    ==    Enterprise

    Wait For Elements State    ${service_group_locator_ddl_vas_it}
    Browser.Get Text    ${service_group_locator_ddl_vas_it}    ==    VAS/IT   
    Browser.Scroll To    vertical=top

Update Service group
    Wait For Elements State    ${service_group_locator_chk_select_all_item}    visible
    Click    ${service_group_locator_chk_select_all_item}
    Click    ${service_group_locator_ddl_fbb}
    Click    ${service_group_locator_ddl_enterprise}
     
Verify after update 
    ${service_text}=    Browser.Get Text    ${service_group_locator_txt_field}
    Should Be Equal     ${service_text}     FBB, Enterprise
    click              ${service_group_locator_btn_close_dropdown}
    Sleep    time_=2s

Test SMS details
    Wait For Elements State    ${test_sms_locator_lbl_Test SMS}    visible
    Wait For Elements State    ${test_sms_locator_chk_Test SMS}    visible
    Get Checkbox State         ${test_sms_locator_chk_Test SMS}    ==    unchecked
    Wait For Elements State    ${test_sms_locator_txt_mobile}       visible
    Browser.Get Text           ${test_sms_locator_txt_mobile}    ==    ${user_profile}[mobile_no]
    Wait For Elements State    ${test_sms_locator_lbl_Test SMS_Sends}    visible
    Browser.Get Text           ${test_sms_locator_lbl_Test SMS_Sends}    contains    Test SMS: Sends an SMS to the phone number you entered for verification.

Update Test SMS mobile
    Click                      ${test_sms_locator_chk_Test SMS}
    Fill Text                  ${test_sms_locator_txt_mobile}        ${update_mobile_send_sms}
    Sleep    time_=2s
    
Create NIN From TT Not Send Test SMS
    Click            ${create_nin_locator_btn_reset} 
    Click            ${level_locator_chk_ctsi}
    Click            ${show_alert_chk_it_service_desk}
    Fill Text        ${problem_locator_txt_customer_impact}   ${problem_detail_1}[customer_detail]
    Click            ${problem_locator_radio_region}  
    Fill Text        ${problem_locator_txt_network_effect}    ${problem_detail_1}[network_effect_details_1]
    Fill Text        ${problem_locator_txt_cause}        ${problem_detail_1}[cause_detail_1]
    Click            ${create_nin_locator_btn_submit}
    Wait For Elements State    ${relate_tt_locator_lbl_tt_id}    visible    timeout=15s

Create NIN From TT Send Test SMS level:ISI
    Wait and Click            ${relate_tt_locator_lbl_tt_id}    
    Wait and Click            ${create_nin_locator_btn_create_nin} 
    Click            ${level_locator_chk_isi}
    Click            ${show_alert_chk_it_service_desk} 
    Click            ${test_sms_locator_chk_Test SMS}
    Fill Text        ${test_sms_locator_txt_mobile}        ${update_mobile_send_sms}
    Fill Text        ${problem_locator_txt_customer_impact}   ${problem_detail_1}[customer_detail_sms_isi_1]
    Click            ${problem_locator_radio_region}  
    Fill Text        ${problem_locator_txt_network_effect}    ${problem_detail_1}[network_effect_details_1]
    Fill Text        ${problem_locator_txt_cause}        ${problem_detail_1}[cause_detail_1]
    Click            ${create_nin_locator_btn_submit}
    Wait For Elements State    ${relate_tt_locator_lbl_tt_id}    visible    timeout=15s

Create NIN From TT Send Test SMS level:MSI
    Wait and Click            ${relate_tt_locator_lbl_tt_id}    
    Wait and Click            ${create_nin_locator_btn_create_nin} 
    Click            ${level_locator_chk_msi}
    Click            ${show_alert_chk_it_service_desk}
    Click            ${show_alert_chk_fbb_helpdesk_support}
    Click            ${test_sms_locator_chk_Test SMS}
    Fill Text        ${test_sms_locator_txt_mobile}        ${update_mobile_send_sms}
    Fill Text        ${problem_locator_txt_customer_impact}   ${problem_detail_2}[customer_detail_sms_msi_2]
    Click            ${problem_locator_radio_region} 
    Fill Text        ${problem_locator_txt_network_effect}    ${problem_detail_2}[network_effect_details_2]
    Fill Text        ${problem_locator_txt_cause}        ${problem_detail_2}[cause_detail_2]
    Click            ${create_nin_locator_btn_submit}
    Wait For Elements State    ${relate_tt_locator_lbl_tt_id}    visible    timeout=15s

Create NIN From TT Send Test SMS level:CTSI
    Wait and Click            ${relate_tt_locator_lbl_tt_id}    
    Wait and Click            ${create_nin_locator_btn_create_nin} 
    Click            ${level_locator_chk_ctsi}
    Click            ${show_alert_chk_it_service_desk}
    Click            ${show_alert_chk_fbb_helpdesk_support}
    Click            ${test_sms_locator_chk_Test SMS}
    Fill Text        ${test_sms_locator_txt_mobile}        ${update_mobile_send_sms}
    Fill Text        ${problem_locator_txt_customer_impact}   ${customer_detail_3}[customer_detail_sms_ctsi_3]
    Click            ${problem_locator_radio_region}  
    Fill Text        ${problem_locator_txt_network_effect}    ${customer_detail_3}[network_effect_details_3]
    Fill Text        ${problem_locator_txt_cause}        ${customer_detail_3}[cause_detail_3]
    Click            ${create_nin_locator_btn_submit}
    Wait For Elements State    ${relate_tt_locator_lbl_tt_id}    visible    timeout=15s

Create NIN From TT Send Test SMS Mobile no is empty
    Wait and Click            ${relate_tt_locator_lbl_tt_id}    
    Wait and Click            ${create_nin_locator_btn_create_nin} 
    Click            ${level_locator_chk_msi}
    Click            ${show_alert_chk_it_service_desk}
    Click            ${show_alert_chk_fbb_helpdesk_support}
    Click            ${test_sms_locator_chk_Test SMS}
    Click            ${test_sms_locator_txt_mobile}
    Browser.Press Keys       ${test_sms_locator_txt_mobile}        Control+a        Delete
    Fill Text        ${problem_locator_txt_customer_impact}   ${problem_detail_1}[customer_detail]
    Sleep    time_=2s
    Click            ${problem_locator_radio_region}  
    Fill Text        ${problem_locator_txt_network_effect}    ${problem_detail_1}[network_effect_details_1]
    Sleep     time_=2s
    Fill Text        ${problem_locator_txt_cause}        ${problem_detail_1}[cause_detail_1]
    Sleep    time_=3s
    Click            ${create_nin_locator_btn_submit}
    Wait For Elements State    text="กรุณากรอก mobileNo"
    Sleep    time_=2s
    Take Screenshot    fullPage=${True}    filename=TC01_008_Mobile_empty
    Click            ${create_nin_locator_btn_close_warning_popup}
    Wait For Elements State    css=.p-dialog-mask    hidden
    Wait and Fill        ${test_sms_locator_txt_mobile}        ${update_mobile_incorrect_format}
    Sleep    time_=3s
    Click            ${create_nin_locator_btn_submit}
    Wait For Elements State    text="กรุณากรอก mobileNo ให้ถูกต้อง (ตัวอย่าง: 0XXXXXXXXX)"
    Sleep    time_=2s
    Take Screenshot    fullPage=${True}    filename=TC01_008_Mobile_incorret
    Click            ${create_nin_locator_btn_close_warning_popup}
    Sleep    time_=3s

Query TT ID For verify affect area from TT
    Scroll To Element    ${create_nin_locator_lbl_query_tt}
    Click                      ${create_nin_locator_lbl_query_tt}
    Wait and Click             ${query_tt_locator_lnk_tt_id_link}
    Wait and Click             ${create_nin_locator_btn_create_nin}
    Scroll To Element    xpath=//*[@id='body-container-content']//p-panel[2]
    Wait For Elements State    ${problem_locator_chk_bangkok}     stable
    ${items_province}=    Get Elements    ${problem_locator_province_list} 
    Log Many     ${items_province}
    Wait For Elements State    ${problem_locator_province_list}>> text="BANGKOK"
    Wait For Elements State    ${problem_locator_province_list}>> text="PATHUM THANI"
    ${items_district}=    Get Elements  ${problem_locator_district_list}
    Log Many     ${items_district}
    # Wait For Elements State    ${problem_locator_district_list} >> text="Bangkok Noi"
    Wait For Elements State    ${problem_locator_district_list} >> text="Kannayao"
    Wait For Elements State    ${problem_locator_district_list} >> text="Khlong Luang"
    Wait For Elements State    ${problem_locator_district_list} >> text="Bang Kho Laem"
    Wait For Elements State    ${problem_locator_district_list} >> text="Bang Bon"
    Scroll To Element    xpath=//*[@id='body-container-content']//p-panel[2]
    Wait For Elements State    id=body-container-content    stable

Verify Auto-filled the data from TT: Region
    Scroll To Element        ${create_nin_locator_lbl_query_tt}
    Click                    ${create_nin_locator_lbl_query_tt}
    Wait and Click           ${query_tt_locator_lnk_tt_id_link}
    Wait and Click           ${create_nin_locator_btn_create_nin}
    Wait and Click           ${level_locator_chk_isi}
    Click            ${show_alert_chk_it_service_desk} 
    Wait and Fill        ${problem_locator_txt_customer_impact}   ${problem_detail_1}[customer_detail]
    Click            ${problem_locator_radio_region}
    Scroll To Element    xpath=//*[@id='body-container-content']//p-panel[2]
    Wait For Elements State    id=body-container-content    stable

Craete nin Affect Area : Region
    Wait and Fill        ${problem_locator_txt_network_effect}    ${problem_detail_1}[network_effect_details_1]
    Wait and Fill        ${problem_locator_txt_cause}        ${problem_detail_1}[cause_detail_1]
    Click            ${create_nin_locator_btn_submit}
    #split NI26-000001 get only 000001
    ${full_text}=    Browser.Get Text    div.header-text.ng-star-inserted
    ${temp}=    Fetch From Right    ${full_text}    -
    ${current_id}=    Fetch From Left    ${temp}    ${SPACE}
    Append To List    ${collecttion_nin_id}   ${current_id}
    Wait For Elements State    ${relate_tt_locator_lbl_tt_id}    visible    timeout=15s

Verify Auto-filled the data from TT : Province
    Click                ${relate_tt_locator_lbl_tt_id}
    Wait and Click       ${create_nin_locator_btn_create_nin}
    Click            ${level_locator_chk_isi}
    Click            ${show_alert_chk_it_service_desk} 
    Fill Text        ${problem_locator_txt_customer_impact}   ${problem_detail_1}[customer_detail]
    Wait and Click            ${problem_locator_radio_province}
    Scroll To Element    xpath=//*[@id='body-container-content']//p-panel[2]
    Wait For Elements State    id=body-container-content    stable
Craete nin Affect Area : Province
    Fill Text        ${problem_locator_txt_network_effect}    ${problem_detail_1}[network_effect_details_1]
    Fill Text        ${problem_locator_txt_cause}        ${problem_detail_1}[cause_detail_1]
    Click            ${create_nin_locator_btn_submit}
    #split NI26-000001 get only 000001
    ${full_text}=    Browser.Get Text    div.header-text.ng-star-inserted
    ${temp}=    Fetch From Right    ${full_text}    -
    ${current_id}=    Fetch From Left    ${temp}    ${SPACE}
    Append To List   ${collecttion_nin_id}   ${current_id}
    Wait For Elements State    ${relate_tt_locator_lbl_tt_id}    visible    timeout=15s

Verify Auto-filled the data from TT : District
    Click                 ${relate_tt_locator_lbl_tt_id}
    Wait and Click        ${create_nin_locator_btn_create_nin}
    Click            ${level_locator_chk_isi}
    Click            ${show_alert_chk_it_service_desk} 
    Fill Text        ${problem_locator_txt_customer_impact}   ${problem_detail_1}[customer_detail]
    Click            ${problem_locator_radio_district}
    Scroll To Element    xpath=//*[@id='body-container-content']//p-panel[2]
    Wait For Elements State    id=body-container-content    stable
    # Take Screenshot    fullPage=${True}  filename=TC02_006

Craete nin Affect Area : District
    Fill Text        ${problem_locator_txt_network_effect}    ${problem_detail_1}[network_effect_details_1]
    Fill Text        ${problem_locator_txt_cause}        ${problem_detail_1}[cause_detail_1]
    Click            ${create_nin_locator_btn_submit}
    #split NI26-000001 get only 000001
    ${full_text}=    Browser.Get Text    div.header-text.ng-star-inserted
    ${temp}=    Fetch From Right    ${full_text}    -
    ${current_id}=    Fetch From Left    ${temp}    ${SPACE}
    Append To List   ${collecttion_nin_id}   ${current_id}
    Wait For Elements State    ${relate_tt_locator_lbl_tt_id}    visible    timeout=15s

Craete nin Affect Area : Nationwide
    Click                ${relate_tt_locator_lbl_tt_id}
    Wait and Click       ${create_nin_locator_btn_create_nin}
    Click            ${level_locator_chk_isi}
    Click            ${show_alert_chk_it_service_desk} 
    Fill Text        ${problem_locator_txt_customer_impact}   ${problem_detail_1}[customer_detail]
    Click            ${problem_locator_radio_nationwide}
    Fill Text        ${problem_locator_txt_network_effect}    ${problem_detail_1}[network_effect_details_1]
    Fill Text        ${problem_locator_txt_cause}        ${problem_detail_1}[cause_detail_1]
    Click            ${create_nin_locator_btn_submit}
    #split NI26-000001 get only 000001
    ${full_text}=    Browser.Get Text    div.header-text.ng-star-inserted
    ${temp}=    Fetch From Right    ${full_text}    -
    ${current_id}=    Fetch From Left    ${temp}    ${SPACE}
    Append To List   ${collecttion_nin_id}   ${current_id}
    Wait For Elements State    ${relate_tt_locator_lbl_tt_id}    visible    timeout=15s

Modify NIN Region
    Browser.Scroll To    vertical=top
    Click    ${top_bar_menu_locator_lbl_query} 
    Wait and Click    ${top_bar_menu_locator_lbl_query_nin}
    Wait For Elements State    ${quey_nin_locator_ddl_ddlNinId}
    Wait and Click    ${query_nin_locator_txt_nin_id}
    Wait and Fill    ${query_nin_locator_txt_nin_id}    ${collecttion_nin_id[0]}
    Wait and Click    ${query_nin_locator_btn_search_nin} 
    Wait and Click    ${query_nin_locator_lnk_nin_id}
    Wait and Click    ${query_nin_locator_lnk_modify}
    Wait and Click    ${problem_locator_chk_central}
    Click    ${create_nin_locator_btn_submit}
    Wait For Elements State    ${relate_tt_locator_lbl_tt_id}  visible    timeout=15s
    Sleep    time_=5s

Modify NIN Province
    Browser.Scroll To    vertical=top
    Wait and Click    ${menuitem_locator_lnk_query_nin}
    Wait For Elements State    ${quey_nin_locator_ddl_ddlNinId}
    Wait and Click    ${query_nin_locator_txt_nin_id}
    Wait and Fill     ${query_nin_locator_txt_nin_id}    ${collecttion_nin_id[1]}
    Wait and Click    ${query_nin_locator_btn_search_nin} 
    Wait and Click    ${query_nin_locator_lnk_nin_id}
    Wait and Click    ${query_nin_locator_lnk_modify}
    Wait and Click    ${problem_locator_radio_province}
    Wait and Click    ${problem_locator_btn_province_search} 
    Wait For Elements State    ${problem_locator_txt_filter}    visible
    Click        ${problem_locator_txt_filter} 
    Fill Text       ${problem_locator_txt_filter}    NONTHABURI
    Wait and Click    ${problem_loactor_lbl_province_search_result}
    Wait and Click    ${problem_locator_btn_picklist} 
    Wait and Click    ${problem_locator_btn_select}
    Click    ${create_nin_locator_btn_submit}
    Wait For Elements State    ${relate_tt_locator_lbl_tt_id}  visible    timeout=15s
    Sleep    time_=5s

 Modify NIN District
    Browser.Scroll To    vertical=top
    Wait and Click    ${menuitem_locator_lnk_query_nin}
    Wait For Elements State    ${quey_nin_locator_ddl_ddlNinId}
    Wait and Click    ${query_nin_locator_txt_nin_id}
    Wait and Fill    ${query_nin_locator_txt_nin_id}    ${collecttion_nin_id[2]}
    Wait and Click    ${query_nin_locator_btn_search_nin} 
    Wait and Click    ${query_nin_locator_lnk_nin_id}
    Wait and Click    ${query_nin_locator_lnk_modify}
    Wait and Click    ${problem_locator_radio_district}
    Wait and Click    ${problem_locator_bnt_search_district}
    Wait For Elements State    ${problem_locator_txt_filter}   visible
    Click    ${problem_locator_txt_filter} 
    Fill Text       ${problem_locator_txt_filter}   Bang Khae
    Wait and Click    ${problem_locator_lbl_district_search_result}
    Wait and Click    ${problem_locator_btn_picklist} 
    Wait and Click    ${problem_locator_btn_select}
    Click    ${create_nin_locator_btn_submit}
    Wait For Elements State    ${relate_tt_locator_lbl_tt_id}  visible    timeout=15s
    Sleep    time_=5s   

 Modify NIN Nationwide to Region
    Browser.Scroll To    vertical=top
    Wait and Click    ${menuitem_locator_lnk_query_nin}
    Wait For Elements State    ${quey_nin_locator_ddl_ddlNinId}
    Wait and Click    ${query_nin_locator_txt_nin_id}
    Wait and Fill    ${query_nin_locator_txt_nin_id}    ${collecttion_nin_id[3]}
    Wait and Click    ${query_nin_locator_btn_search_nin} 
    Wait and Click    ${query_nin_locator_lnk_nin_id}
    Wait and Click    ${query_nin_locator_lnk_modify}
    Wait and Click    ${problem_locator_radio_region}
    Wait and Click    ${problem_locator_chk_central}
    Wait and Click    ${problem_locator_chk_east}
    Wait and Click    ${problem_locator_chk_northeast}
    Click    ${create_nin_locator_btn_submit}
    Wait For Elements State    ${relate_tt_locator_lbl_tt_id}  visible    timeout=15s
    Sleep    time_=5s  

Verify NIN Fault Service Group
    Wait and Click    ${setup_nin_group_btn_create_nin_group}
    Click    ${nin_fault_ddl_service_group}
    Wait For Elements State    ${nin_fault_ddl_list}   visible

    Wait For Elements State    ${nin_fault_locator_ddl_mbb}
    Browser.Get Text    ${nin_fault_locator_ddl_mbb}   ==    MBB

    Wait For Elements State    ${nin_fault_locator_ddl_fbb}
    Browser.Get Text    ${nin_fault_locator_ddl_fbb}    ==    FBB

    Wait For Elements State    ${nin_fault_locator_ddl_enterprise} 
    Browser.Get Text    ${nin_fault_locator_ddl_enterprise}     ==    Enterprise

    Wait For Elements State    ${nin_fault_locator_ddl_vas_it}
    Browser.Get Text    ${nin_fault_locator_ddl_vas_it}    ==    VAS/IT
    Sleep    time_=3s

Verify NIN Plan Service Group
    Click    ${nin_plan_ddl_service_group}
    Wait For Elements State    ${nin_plan_ddl_list}   visible

    Wait For Elements State    ${nin_plan_locator_ddl_mbb}
    Browser.Get Text    ${nin_plan_locator_ddl_mbb}   ==    MBB

    Wait For Elements State    ${nin_plan_locator_ddl_fbb}
    Browser.Get Text    ${nin_plan_locator_ddl_fbb}    ==    FBB

    Wait For Elements State    ${nin_plan_locator_ddl_enterprise} 
    Browser.Get Text    ${nin_plan_locator_ddl_enterprise}    ==    Enterprise

    Wait For Elements State    ${nin_plan_locator_ddl_vas_it}
    Browser.Get Text    ${nin_plan_locator_ddl_vas_it}   ==    VAS/IT
    Sleep    time_=6s





    

