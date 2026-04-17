*** Variables ***
#Top Bar Menu
${top_bar_menu_locator_lbl_desktop}              text="Desktop"
${top_bar_menu_locator_blb_master_setup}         text="Master Setup"
${top_bar_menu_locator_lbl_query}                text="Query"
${top_bar_menu_locator_lbl_query_TT}             text="Query TT"
${top_bar_menu_locator_lbl_query_nin}            text="Query NIN"
${menuitem_locator_lnk_query_nin}                label span:text-is("Query NIN")
${master_setup_list_lnk_setup_nin_group}         text="Setup NIN Group"
#Query TT ID Search By ID
${query_tt_locator_ddl_ttIdYear}                    id=ttIdYear >> text="26"
${query_tt_locator_input_ttIdText}                  id=ttIdText
${query_tt_locator_btn_search}                      p-panel[header="Search By ID"] button >> text="SEARCH" 
${query_tt_locator_lnk_tt_id_link}                  id=tdTTID >> .id-link

#Query NIN
${quey_nin_locator_ddl_ddlNinId}                id=ddlNinId >> text="NI26"
${query_nin_locator_txt_nin_id}                 id=txtNinId
${query_nin_locator_btn_search_nin}             id=btnSearch
${query_nin_locator_btn_reset}                  id=btnReset
${query_nin_locator_lnk_nin_id}                 td.tdNinId
${query_nin_locator_lnk_modify}                 div.content :text-is("Modify NIN")


#Create NIN From TT
${create_nin_locator_btn_create_nin}                        div.item >> label >> text="Create NIN"
${create_nin_locator_btn_submit}                            id=btnSubmit
${create_nin_locator_btn_reset}                             id=btnReset
${create_nin_locator_btn_close_warning_popup}               button[type="button"] :text-is("CLOSE")
${create_nin_locator_lbl_query_tt}                          span:text-is("Query TT")
#NIN Report Header
${level_locator_chk_isi}                                  id=chkLevel(1)
${level_locator_chk_msi}                                  id=chkLevel(2)
${level_locator_chk_ctsi}                                 id=chkLevel(3)
${show_alert_chk_it_service_desk}                         id=ITSD_CHECKBOX
${show_alert_chk_fbb_helpdesk_support}                    id=FBB_CHECKBOX

${service_group_locator_txt_field}                 p-multiselect[formcontrolname="serviceGroup"] .p-multiselect-label
${service_group_locator_ddl_field}                 div.p-multiselect-trigger
${service_group_locator_ddl_list}                  div.p-multiselect-items-wrapper
${service_group_locator_ddl_mbb}                   .p-multiselect-item >> text="MBB"
${service_group_locator_ddl_fbb}                   .p-multiselect-item >> text="FBB"
${service_group_locator_ddl_enterprise}            .p-multiselect-item >> text="Enterprise"
${service_group_locator_ddl_vas_it}                .p-multiselect-item >> text="VAS/IT"
${service_group_locator_chk_select_all_item}       div.p-checkbox-box[aria-label="All items selected"]
${service_group_locator_btn_close_dropdown}        button[aria-label="Close"]

#NIN Report Header : Test SMS
${test_sms_locator_lbl_Test SMS}                   label.text-label:has-text("Test SMS")
${test_sms_locator_chk_Test SMS}                   id=testSmsFlag
${test_sms_locator_txt_mobile}                     id=mobileNo
${test_sms_locator_lbl_Test SMS_Sends}             label.text-align-left:has-text("Test SMS: Sends an SMS to the phone number you entered for verification.")

#Problem Detail
${problem_locator_txt_customer_impact}               id=txtCustomerImpact
${problem_locator_txt_network_effect}                id=txtNetworkEffect
${problem_locator_txt_cause}                         id=txtCause

${problem_locator_radio_nationwide}                  id=btnRadioAffectArea(1)
${problem_locator_radio_region}                      id=btnRadioAffectArea(2)
${problem_locator_chk_bangkok}                       p-checkbox :text-is("Bangkok")
${problem_locator_chk_central}                       p-checkbox :text-is("Central")
${problem_locator_chk_east}                          p-checkbox :text-is("East")
${problem_locator_chk_northeast}                     p-checkbox :text-is("NorthEast")
${problem_locator_chk_north}                         p-checkbox :text-is("North")
${problem_locator_chk_south}                         p-checkbox :text-is("South")

#Affect Area TT_ID: TT26-0001856
#Province
${problem_locator_radio_province}                    id=btnRadioAffectArea(3)
${problem_locator_province_list}                     id=lstbProvince
${problem_locator_btn_province_search}               id=btnSearchProvince
${problem_locator_txt_filter}                        input[data-pc-section="sourceFilterInput"]
${problem_loactor_lbl_province_search_result}        .p-picklist-list ul li:has-text("NONTHABURI")    #.p-picklist-list ul li >>nth =0         #.p-picklist-list ul li:has-text("NONTHABURI")
${problem_locator_btn_picklist}                      .p-picklist-buttons button>>nth =0
${problem_locator_btn_select}                        id=btnSelectTT

#District
${problem_locator_radio_district}                    id=btnRadioAffectArea(4)
${problem_locator_district_list}                     id=lstbDistrict
${problem_locator_bnt_search_district}               id=btnSearchDistrict
${problem_locator_lbl_district_search_result}        .p-picklist-list ul li:has-text("Bang Khae")


#View NIN
${relate_tt_locator_lbl_tt_id}                          id=txtRelateTTId
${level_chk_isi}                                        p-checkbox :has-text("ISI")
${level_chk_msi}                                        p-checkbox :has-text("MSI")
${level_chk_ctsi}                                       p-checkbox :has-text("CTSI")
${service_group_locator_lbl_selecttion}                 div :text-is('MBB,FBB,Enterprise,VAS/IT')

#Master Setup NIN Group
${setup_nin_group_btn_create_nin_group}                id=create_nin_group
${nin_fault_ddl_service_group}                         form div:nth-child(4) div:text-is("Select Service Group")
${nin_fault_ddl_list}                                  div.p-multiselect-items-wrapper
${nin_fault_locator_ddl_mbb}                           ul p-multiselectitem:nth-child(1) :text-is("MBB")
${nin_fault_locator_ddl_fbb}                           ul p-multiselectitem:nth-child(2) :text-is("FBB")
${nin_fault_locator_ddl_enterprise}                    ul p-multiselectitem:nth-child(3) :text-is("Enterprise")
${nin_fault_locator_ddl_vas_it}                        ul p-multiselectitem:nth-child(4) :text-is("VAS/IT")
${nin_fault_locator_chk_select_all_item}               div.p-checkbox-box[aria-label="All items unselected"]
${nin_fault_locator_btn_close_dropdown}                button[aria-label="Close"]

${nin_plan_ddl_service_group}                          form div:nth-child(5) div:text-is("Select Service Group")
${nin_plan_ddl_list}                                   div.p-multiselect-items-wrapper
${nin_plan_locator_ddl_mbb}                           .p-multiselect-item >> text="MBB"
${nin_plan_locator_ddl_fbb}                           .p-multiselect-item >> text="FBB"
${nin_plan_locator_ddl_enterprise}                    .p-multiselect-item >> text="Enterprise"
${nin_plan_locator_ddl_vas_it}                        .p-multiselect-item >> text="VAS/IT"
${nin_plan_locator_chk_select_all_item}               div.p-checkbox-box[aria-label="All items unselected"]
${nin_plan_locator_btn_close_dropdown}                button[aria-label="Close"]

