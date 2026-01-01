*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CHROME_BROWSER_PATH}    ${EXECDIR}${/}ChromeForTesting${/}chrome-win64${/}chrome.exe
${CHROME_DRIVER_PATH}     ${EXECDIR}${/}ChromeForTesting${/}chromedriver-win64${/}chromedriver.exe
${SERVER}                 localhost:7272
${BROWSER}                chrome
${REGISTRATION URL}       http://${SERVER}/Registration.html
${SUCCESS URL}            http://${SERVER}/Success.html
${DELAY}                  0

*** Test Cases ***
Open Workshop Registration Page
    Open Browser    ${REGISTRATION URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY}

Registration Page Should Be Open
    Location Should Be    ${REGISTRATION URL}
    Title Should Be       Registration

Register Success
    [Documentation]    Verify successful registration flow
    Input Text    id=firstname      Somyod
    Input Text    id=lastname       Sodsai
    Input Text    id=organization   CS KKU
    Input Text    id=email          somyod@kkumail.com
    Input Text    id=phone          091-001-1234
    Click Button  Register

    Location Should Contain    ${SUCCESS URL}  
    Title Should Be           Success
    Page Should Contain       Thank you for registering with us.
    Page Should Contain       We will send a confirmation to your email soon.

    Close Browser
