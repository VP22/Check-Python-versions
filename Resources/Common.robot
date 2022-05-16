*** Settings ***
Library  SeleniumLibrary  timeout=30s
Resource  ../Data/CommonData.robot

*** Keywords ***
I open the browser
    Open Browser        about:blank  ${BROWSER}
    Set Window Size     ${BROWSER_WINDOW_WIDTH}  ${BROWSER_WINDOW_HEIGHT}
    ${OS} =  Evaluate  platform.system()  platform

End Web Test
    Close Browser