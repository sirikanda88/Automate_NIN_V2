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
    Master Setup NIN Group


TC04_003: Create NIN display new fields for NIN Fault and NIN Plan
    [Documentation]    1) TTS Create NIN Group shall display new field Service Group for NIN Fault and NIN Plan with Network Group option list.
    [Tags]    Standard Case
    Verify NIN Fault Service Group
    Take Screenshot    fileType=png   filename=TC04_003_NIN_Fault
    Verify NIN Plan Service Group
    Take Screenshot    fileType=png    filename=TC04_003_NIN_Plan




    

