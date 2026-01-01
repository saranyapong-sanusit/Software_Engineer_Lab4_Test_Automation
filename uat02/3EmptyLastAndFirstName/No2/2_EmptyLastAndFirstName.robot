*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CHROME_BROWSER_PATH}    ${EXECDIR}${/}ChromeForTesting${/}chrome-win64${/}chrome.exe
${CHROME_DRIVER_PATH}     ${EXECDIR}${/}ChromeForTesting${/}chromedriver-win64${/}chromedriver.exe
${SERVER}                 localhost:7272
${BROWSER}                chrome
${REGISTRATION_URL}       http://${SERVER}/Registration.html
${SUCCESS URL}            http://${SERVER}/Success.html
${DELAY}                  0

*** Test Cases ***
Open Workshop Registration Page
    Open Browser    ${REGISTRATION_URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY}

Registration Page Should Be Open
    Location Should Be    ${REGISTRATION_URL}
    Title Should Be       Registration

Empty First Name and Last Name
    [Documentation]    Verify successful registration flow
    Input Text    id=organization   CS KKU
    Input Text    id=email          somyod@kkumail.com
    Input Text    id=phone          091-001-1234
    Click Button  Register

    Location Should Contain    ${REGISTRATION_URL}  
    Title Should Be           Registration
    Page Should Contain       Please enter your name!!

    Close Browser
