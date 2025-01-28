*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}                http://localhost:7272/Form.html
${DELAY}                   0
${FIRST_NAME}              Somsong
${LAST_NAME}               Sandee
${DESTINATION}             Europe
${CONTACT_PERSON}          Sodsai Sandee
${RELATIONSHIP}            Mother
${EMAIL}                   somsong@kkumail.com
${PHONE_NO}                081-111-1234      
${CHROME_DRIVER_PATH}      ${EXECDIR}${/}ChromeForTesting${/}chromedriver.exe

*** Test Cases ***
Test case 1 : Empty Destination
    Open Browser    ${BASE_URL}    Chrome    executable_path=${CHROME_DRIVER_PATH}
    Set Selenium Speed    ${DELAY}
    Input Text    id=firstname    ${FIRST_NAME}
    Input Text    id=lastname     ${LAST_NAME}
    Input Text    id=destination   ${Empty}
    Input Text    id=contactperson    ${CONTACT_PERSON}
    Input Text    id=relationship  ${RELATIONSHIP}
    Input Text    id=email         ${EMAIL}
    Input Text    id=phone         ${PHONE_NO}
    Click Button    id=submitButton
    Page Should Contain     *Please enter Destination !!!
    Close Browser

Test case 2 : Empty Email
    Open Browser    ${BASE_URL}    Chrome    executable_path=${CHROME_DRIVER_PATH}
    Set Selenium Speed    ${DELAY}
    Input Text    id=firstname    ${FIRST_NAME}
    Input Text    id=lastname     ${LAST_NAME}
    Input Text    id=destination   ${DESTINATION}
    Input Text    id=contactperson    ${CONTACT_PERSON}
    Input Text    id=relationship  ${RELATIONSHIP}
    Input Text    id=email         ${Empty}
    Input Text    id=phone         ${PHONE_NO}
    Click Button    id=submitButton
    Page Should Contain     *Please enter an email!!
    Close Browser

Test case 3 : Invalid Email
    Open Browser    ${BASE_URL}    Chrome    executable_path=${CHROME_DRIVER_PATH}
    Set Selenium Speed    ${DELAY}
    Input Text    id=firstname    ${FIRST_NAME}
    Input Text    id=lastname     ${LAST_NAME}
    Input Text    id=destination   ${DESTINATION}
    Input Text    id=contactperson    ${CONTACT_PERSON}
    Input Text    id=relationship  ${RELATIONSHIP}
    Input Text    id=email         somsong@
    Input Text    id=phone         ${PHONE_NO}
    Click Button    id=submitButton
    Page Should Contain     *Please enter a valid email!!
    Close Browser

Test case 4 : Empty Phone Number
    Open Browser    ${BASE_URL}    Chrome    executable_path=${CHROME_DRIVER_PATH}
    Set Selenium Speed    ${DELAY}
    Input Text    id=firstname    ${FIRST_NAME}
    Input Text    id=lastname     ${LAST_NAME}
    Input Text    id=destination   ${DESTINATION}
    Input Text    id=contactperson    ${CONTACT_PERSON}
    Input Text    id=relationship  ${RELATIONSHIP}
    Input Text    id=email         ${EMAIL}
    Input Text    id=phone         ${Empty}
    Click Button    id=submitButton
    Page Should Contain     *Please enter a phone number!!
    Close Browser

Test case 5 : Invalid Phone Number
    Open Browser    ${BASE_URL}    Chrome    executable_path=${CHROME_DRIVER_PATH}
    Set Selenium Speed    ${DELAY}
    Input Text    id=firstname    ${FIRST_NAME}
    Input Text    id=lastname     ${LAST_NAME}
    Input Text    id=destination   ${DESTINATION}
    Input Text    id=contactperson    ${CONTACT_PERSON}
    Input Text    id=relationship  ${RELATIONSHIP}
    Input Text    id=email         ${EMAIL}
    Input Text    id=phone         191
    Click Button    id=submitButton
    Page Should Contain     *Please enter a valid phone number!!
    Close Browser

