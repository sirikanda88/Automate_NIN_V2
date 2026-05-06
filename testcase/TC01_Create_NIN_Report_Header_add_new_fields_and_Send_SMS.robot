*** SeTestings ***
Library    OperatingSystem
Library    DebugLibrary
Library    SeleniumLibrary
Library    Browser
Resource        ${CURDIR}/../resources/import.robot
Suite Setup       Open Trouble Ticket System TestS Web
Suite Teardown    Close All Browsers

*** Test Cases ***
Prerequisite
    Login Test Web
    Query Test Menu
    Query Test ID

TC01_000: Report Header display new field : Service Group
    [Documentation]    1)Test Create Report Header shall display new field: Service Group select all Test group as default.
    [Tags]     Standard Case
    Field Service group
    Take Screenshot    fullPage=${True}    filename=TC01_000_Service_group_default
    Service group dropdown list
    Take Screenshot    fullPage=${True}    filename=TC01_000_After_click_dropdown

TC01_001: Report Header update field : Service Group
    [Documentation]    1)Test Create Test Report Header can updated the Service Group success.
    [Tags]    Standard Case
    Update Service group
    Take Screenshot     selector=id=body-container-content    filename=TC01_001_to_update_Test
    Verify after update
    Take Screenshot    fullPage=${True}    filename=TC01_001_Service Group

TC01_002: Report Header display new field : Test SMS
    [Documentation]    1)Test Create Test Report Header shall display new field: Test SMS with the phone number of Test creator set as default.
    [Tags]    Standard Case
    Test SMS details
    Take Screenshot    fullPage=${True}    filename=TC01_002

TC01_003: Report Header update mobile number field : Test SMS
    [Documentation]    1) TestS Create Test Report Header can updated the mobile number forTest SMS success.
    [Tags]    Standard Case
    Update Test SMS mobile
    Take Screenshot    fullPage=${True}    filename=TC01_003

TC01_004: Create Test Fault from Test Not Send Test SMS
    [Documentation]    1) Test Create Test Fault from Test success, and the Service group and Test SMS fields are display with default values.
    [Tags]    Standard Case
    Create Test From Test Not Send Test SMS
    Take Screenshot    fullPage=${True}    filename=TC01_004

TC01_005: Create Test Fault from Test Send Test SMS Level : 111
    [Documentation]    1) TestS Create Test Fault from Test success, and the Service group and Test SMS fields are displayed with the entered values.
    ...    \n2) TestS Sender:TestFaulTestest sent the SMS to Mobile no : 0812345678 for Level : 111 success.  
    [Tags]    Standard Case
    Create Test From Test Send Test SMS level:111
    Take Screenshot    fullPage=${True}    filename=TC01_005

TC01_006: Create Test Fault from Test Send Test SMS Level : 222
    [Documentation]    1) TestS Create Test Fault from Test success, and the Service group and Test SMS fields are displayed with the entered values.
    ...    \n2) TestS Sender:TestFaulTestest sent the SMS to Mobile no : 0812345678 for Level : 222 success.  
    [Tags]    Standard Case
    Create Test From Test Send Test SMS level:222
    Take Screenshot    fullPage=${True}    filename=TC01_006

TC01_007: Create Test Fault from Test Send Test SMS Level : 333
    [Documentation]    1) TestS Create Test Fault from Test success, and the Service group and Test SMS fields are displayed with the entered values.
    ...    \n2) TestS Sender:TestFaulTestest sent the SMS to Mobile no : 0812345678 for Level : 333 success.  
    [Tags]    Standard Case
    Create Test From Test Send Test SMS level:333
    Take Screenshot    fullPage=${True}    filename=TC01_007

TC01_008: Create Test Fault from Test Test SMS Mobile no is empty and incorrect format
    [Documentation]    1) TestS can not Create Test Fault from Test success, and display warTestg as below:
    ...    \n2) " กรุณากรอก mobileNo " 
    ...    \n3) " กรุณากรอก mobileNo ให้ถูกต้อง (ตัวอย่าง: 0XXXXXXXXX) "
    [Tags]    Nagative Case
    Create Test From Test Send Test SMS Mobile no is empty

TC02_003: Problem details displays Auto-filled the data from Test - Field Affect Area
    [Documentation]    1) TestS shall display the disable field Affect Area with the auto-filled data from Test, base on the Problem Node and Affected Node as below:
    [Tags]    Standard Case
     Query Test ID For verify affect area from Test
     Take Screenshot    fullPage=True    filename=TC02_003

TC02_004: Problem details displays Auto-filled the data from Test - Field Affect Area : Region
    [Documentation]    1) TestS shall display field Affect Area and enable field: Region with the auto-filled data from Test, base on the Problem Node and Affected Node as below:
    [Tags]    Standard Case
     Verify Auto-filled the data from Test: Region
     Take Screenshot    fullPage=True    filename=TC02_004

TC02_007: Create Test from Test Affect Area : Region
    [Documentation]    1) TestS Create Test from Test success, and the Affected Area is displayed correctly with auto-filled data from Test based on the Problem Node and Affected Node.
    ...    \n2) Affected Area (Region) : Bangkok
    [Tags]    Standard Case
    Craete Test Affect Area : Region
    Take Screenshot    fullPage=True    filename=TC02_007

TC02_005: Problem details displays Auto-filled the data from Test - Field Affect Area : Province
    [Documentation]    1) TestS shall display field Affect Area and enable field: Province with the auto-filled data from Test, base on the Problem Node and Affected Node as below:
    [Tags]    Standard Case
    Verify Auto-filled the data from Test : Province
    Take Screenshot    fullPage=True    filename=TC02_005
    
TC02_008: Create Test from Test Affect Area : Province
    [Documentation]    1) TestS Create Test from Test success, and the Affected Area is displayed correctly with auto-filled data from Test based on the Problem Node and Affected Node.
    ...    \n2) Affected Area (Province) : BANGKOK
    [Tags]    Standard Case
    Craete Test Affect Area : Province
    Take Screenshot    fullPage=True    filename=TC02_008

TC02_006: Problem details displays Auto-filled the data from Test - Field Affect Area : District
    [Documentation]    1) TestTS shall display field Affect Area and enable field: District with the auto-filled data from Test, base on the Problem Node and Affected Node as below:
    [Tags]    Standard Case
    Verify Auto-filled the data from Test : District
    Take Screenshot    fullPage=True    filename=TC02_006

TC02_009: Create Test from Test Affect Area : District
    [Documentation]    1) TestS Create Test from Test success, and the Affected Area is displayed correctly with auto-filled data from Test based on the Problem Node and Affected Node.
    ...    \n2) Affected Area (Amphur) : Bang Bon, Bang Kho Leam, Kannayao
    [Tags]    Standard Case
    Craete Test Affect Area : District
    Take Screenshot    fullPage=True    filename=TC02_009

TC02_010: Create Test from Test Affect Area : Nationwide
    [Documentation]    1) TestS Create Test from Test success, and the Affected Area is displayed correctly with auto-filled data from Test based on the Problem Node and Affected Node.
    ...    \n2) Affected Area  : Nationwide
    [Tags]    Standard Case
    Craete Test Affect Area : Nationwide
    Take Screenshot    fullPage=True    filename=TC02_010

TC02_011: Modify Test Affect Area : Region
    [Documentation]    1) TestS Modify Test displays the Affected Area with the current data as below:
    ...    \n Affected Area (Region) : Bangkok  
    ...    \n2) The user can update more Region for the Affect Area success, and the data is saves correctly.
    ...    \n Affected Area (Region) : Bangkok, Central
    [Tags]    Standard Case
    Modify Test Region
    Take Screenshot    fullPage=True    filename=TC02_011

TC02_012: Modify Test Affect Area : Province
    [Documentation]    1) TestS Modify Test displays the Affected Area with the current data as below:
    ...    \n Affected Area (Province) : BANGKOK
    ...    \n2) The user can update more Province for the Affect Area success, and the data is saves correctly.
    ...    \n Affected Area (Province) : BANGKOK, NONTHABURI
    [Tags]    Standard Case
    Modify Test Province
    Take Screenshot    fullPage=True    filename=TC02_012

TC02_013: Modify Test Affect Area : District
    [Documentation]    1) TestS Modify Test displays the Affected Area with the current data as below:
    ...    \n Affected Area (District) : Bang Bon, Bang Kho Leam, Kannayao
    ...    \n2) The user can update more District for the Affect Area success, and the data is saves correctly.
    ...    \n Affected Area (District) : Bang Bon, Bang Kho Leam, Kannayao,Bang Khae
    [Tags]    Standard Case
    Modify Test District
    Take Screenshot    fullPage=True    filename=TC02_013

TC02_014: Modify Test Affect Area : Nationwide to Region
    [Documentation]    1) TestS Modify Test displays the Affected Area with the current data as below:
    ...    \n Affected Area  : Nationwide
    ...    \n2) The user can update Nationwide to Region for the Affect Area success, and the data is saves correctly.
    ...    \n Affected Area (Region) : Central, East, North
    [Tags]    Standard Case
    Modify Test Nationwide to Region
    Take Screenshot    fullPage=True    filename=TC02_014


    

