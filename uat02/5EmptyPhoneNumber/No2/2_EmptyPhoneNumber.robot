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

Empty Phone Number
    [Documentation]    Verify successful registration flow
	Input Text    id=firstname      Somyod
	Input Text    id=lastname      Sodsai
    Input Text    id=organization   CS KKU
    Input Text    id=email          somyod@kkumail.com
    Click Button  Register

    Location Should Contain    ${REGISTRATION_URL}  
    Title Should Be           Registration
    Page Should Contain       Please enter your phone number!!

    Close Browser
