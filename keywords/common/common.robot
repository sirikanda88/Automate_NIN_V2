*** Settings ***
Library    Browser
Library    SeleniumLibrary
Library    DebugLibrary
Variables        ${CURDIR}/../../resources/testdata/user.yaml
Variables        ${CURDIR}/../../resources/setting/setting.yaml

*** Keywords ***
Open Trouble Ticket System TTS Web
    New Browser    chromium    headless=${False}    args=['--start-maximized']
    Set Browser Timeout    240s
    New Context    ignoreHTTPSErrors=${True}       viewport=${None}  
    New Page       ${url}     wait_until=commit
    

Login TTS Web
    Wait For Elements State    id=txtUsername   visible    timeout=240s
    Click       id=txtUsername 
    Fill Text      id=txtUsername        ${login}[username]
    Fill Text      id=txtPwd            ${login}[password]
    Click          id=btnLogin
    Wait For Elements State        text="LOGIN"   visible
    Click          text="LOGIN"