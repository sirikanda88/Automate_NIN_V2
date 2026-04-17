*** Settings ***
Library    OperatingSystem
Library    DebugLibrary
Library    SeleniumLibrary
Library    Browser
Resource        ${CURDIR}/../resources/import.robot
Suite Setup       Open Trouble Ticket System TTS Web
Suite Teardown    Close All Browsers

*** Test Cases ***
Prerequisite
    Login TTS Web
    Query TT Menu
    Query TT ID

TC01_000: Report Header display new field : Service Group
    [Documentation]    1)TTS Create NIN Report Header shall display new field: Service Group select all network group as default.
    [Tags]     Standard Case
    Field Service group
    Take Screenshot    fullPage=${True}    filename=TC01_000_Service_group_default
    Service group dropdown list
    Take Screenshot    fullPage=${True}    filename=TC01_000_After_click_dropdown

TC01_001: Report Header update field : Service Group
    [Documentation]    1)TTS Create NIN Report Header can updated the Service Group success.
    [Tags]    Standard Case
    Update Service group
    Take Screenshot     selector=id=body-container-content    filename=TC01_001_to_update_FBB_Enterprise
    Verify after update
    Take Screenshot    fullPage=${True}    filename=TC01_001_Service Group

TC01_002: Report Header display new field : Test SMS
    [Documentation]    1)TTS Create NIN Report Header shall display new field: Test SMS with the phone number of NIN creator set as default.
    [Tags]    Standard Case
    Test SMS details
    Take Screenshot    fullPage=${True}    filename=TC01_002

TC01_003: Report Header update mobile number field : Test SMS
    [Documentation]    1) TTS Create NIN Report Header can updated the mobile number forTest SMS success.
    [Tags]    Standard Case
    Update Test SMS mobile
    Take Screenshot    fullPage=${True}    filename=TC01_003

TC01_004: Create NIN Fault from TT Not Send Test SMS
    [Documentation]    1) TTS Create NIN Fault from TT success, and the Service group and Test SMS fields are display with default values.
    [Tags]    Standard Case
    Create NIN From TT Not Send Test SMS
    Take Screenshot    fullPage=${True}    filename=TC01_004

TC01_005: Create NIN Fault from TT Send Test SMS Level : ISI
    [Documentation]    1) TTS Create NIN Fault from TT success, and the Service group and Test SMS fields are displayed with the entered values.
    ...    \n2) TTS Sender:NINFaultTest sent the SMS to Mobile no : 0812345678 for Level : ISI success.  
    [Tags]    Standard Case
    Create NIN From TT Send Test SMS level:ISI
    Take Screenshot    fullPage=${True}    filename=TC01_005

TC01_006: Create NIN Fault from TT Send Test SMS Level : MSI
    [Documentation]    1) TTS Create NIN Fault from TT success, and the Service group and Test SMS fields are displayed with the entered values.
    ...    \n2) TTS Sender:NINFaultTest sent the SMS to Mobile no : 0812345678 for Level : MSI success.  
    [Tags]    Standard Case
    Create NIN From TT Send Test SMS level:MSI
    Take Screenshot    fullPage=${True}    filename=TC01_006

TC01_007: Create NIN Fault from TT Send Test SMS Level : CTSI
    [Documentation]    1) TTS Create NIN Fault from TT success, and the Service group and Test SMS fields are displayed with the entered values.
    ...    \n2) TTS Sender:NINFaultTest sent the SMS to Mobile no : 0812345678 for Level : CTSI success.  
    [Tags]    Standard Case
    Create NIN From TT Send Test SMS level:CTSI
    Take Screenshot    fullPage=${True}    filename=TC01_007

TC01_008: Create NIN Fault from TT Test SMS Mobile no is empty and incorrect format
    [Documentation]    1) TTS can not Create NIN Fault from TT success, and display warning as below:
    ...    \n2) " กรุณากรอก mobileNo " 
    ...    \n3) " กรุณากรอก mobileNo ให้ถูกต้อง (ตัวอย่าง: 0XXXXXXXXX) "
    [Tags]    Nagative Case
    Create NIN From TT Send Test SMS Mobile no is empty

TC02_003: Problem details displays Auto-filled the data from TT - Field Affect Area
    [Documentation]    1) TTS shall display the disable field Affect Area with the auto-filled data from TT, base on the Problem Node and Affected Node as below:
    [Tags]    Standard Case
     Query TT ID For verify affect area from TT
     Take Screenshot    fullPage=True    filename=TC02_003

TC02_004: Problem details displays Auto-filled the data from TT - Field Affect Area : Region
    [Documentation]    1) TTS shall display field Affect Area and enable field: Region with the auto-filled data from TT, base on the Problem Node and Affected Node as below:
    [Tags]    Standard Case
     Verify Auto-filled the data from TT: Region
     Take Screenshot    fullPage=True    filename=TC02_004

TC02_007: Create NIN from TT Affect Area : Region
    [Documentation]    1) TTS Create NIN from TT success, and the Affected Area is displayed correctly with auto-filled data from TT based on the Problem Node and Affected Node.
    ...    \n2) Affected Area (Region) : Bangkok
    [Tags]    Standard Case
    Craete nin Affect Area : Region
    Take Screenshot    fullPage=True    filename=TC02_007

TC02_005: Problem details displays Auto-filled the data from TT - Field Affect Area : Province
    [Documentation]    1) TTS shall display field Affect Area and enable field: Province with the auto-filled data from TT, base on the Problem Node and Affected Node as below:
    [Tags]    Standard Case
    Verify Auto-filled the data from TT : Province
    Take Screenshot    fullPage=True    filename=TC02_005
    
TC02_008: Create NIN from TT Affect Area : Province
    [Documentation]    1) TTS Create NIN from TT success, and the Affected Area is displayed correctly with auto-filled data from TT based on the Problem Node and Affected Node.
    ...    \n2) Affected Area (Province) : BANGKOK
    [Tags]    Standard Case
    Craete nin Affect Area : Province
    Take Screenshot    fullPage=True    filename=TC02_008

TC02_006: Problem details displays Auto-filled the data from TT - Field Affect Area : District
    [Documentation]    1) TTTS shall display field Affect Area and enable field: District with the auto-filled data from TT, base on the Problem Node and Affected Node as below:
    [Tags]    Standard Case
    Verify Auto-filled the data from TT : District
    Take Screenshot    fullPage=True    filename=TC02_006

TC02_009: Create NIN from TT Affect Area : District
    [Documentation]    1) TTS Create NIN from TT success, and the Affected Area is displayed correctly with auto-filled data from TT based on the Problem Node and Affected Node.
    ...    \n2) Affected Area (Amphur) : Bang Bon, Bang Kho Leam, Kannayao
    [Tags]    Standard Case
    Craete nin Affect Area : District
    Take Screenshot    fullPage=True    filename=TC02_009

TC02_010: Create NIN from TT Affect Area : Nationwide
    [Documentation]    1) TTS Create NIN from TT success, and the Affected Area is displayed correctly with auto-filled data from TT based on the Problem Node and Affected Node.
    ...    \n2) Affected Area  : Nationwide
    [Tags]    Standard Case
    Craete nin Affect Area : Nationwide
    Take Screenshot    fullPage=True    filename=TC02_010

TC02_011: Modify NIN Affect Area : Region
    [Documentation]    1) TTS Modify NIN displays the Affected Area with the current data as below:
    ...    \n Affected Area (Region) : Bangkok  
    ...    \n2) The user can update more Region for the Affect Area success, and the data is saves correctly.
    ...    \n Affected Area (Region) : Bangkok, Central
    [Tags]    Standard Case
    Modify NIN Region
    Take Screenshot    fullPage=True    filename=TC02_011

TC02_012: Modify NIN Affect Area : Province
    [Documentation]    1) TTS Modify NIN displays the Affected Area with the current data as below:
    ...    \n Affected Area (Province) : BANGKOK
    ...    \n2) The user can update more Province for the Affect Area success, and the data is saves correctly.
    ...    \n Affected Area (Province) : BANGKOK, NONTHABURI
    [Tags]    Standard Case
    Modify NIN Province
    Take Screenshot    fullPage=True    filename=TC02_012

TC02_013: Modify NIN Affect Area : District
    [Documentation]    1) TTS Modify NIN displays the Affected Area with the current data as below:
    ...    \n Affected Area (District) : Bang Bon, Bang Kho Leam, Kannayao
    ...    \n2) The user can update more District for the Affect Area success, and the data is saves correctly.
    ...    \n Affected Area (District) : Bang Bon, Bang Kho Leam, Kannayao,Bang Khae
    [Tags]    Standard Case
    Modify NIN District
    Take Screenshot    fullPage=True    filename=TC02_013

TC02_014: Modify NIN Affect Area : Nationwide to Region
    [Documentation]    1) TTS Modify NIN displays the Affected Area with the current data as below:
    ...    \n Affected Area  : Nationwide
    ...    \n2) The user can update Nationwide to Region for the Affect Area success, and the data is saves correctly.
    ...    \n Affected Area (Region) : Central, East, North
    [Tags]    Standard Case
    Modify NIN Nationwide to Region
    Take Screenshot    fullPage=True    filename=TC02_014


    

