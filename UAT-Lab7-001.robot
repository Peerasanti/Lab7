*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}                http://localhost:7272/Form.html
${Complete_URL}            http://localhost:7272/Complete.html
${DELAY}                   0.2
${FIRST_NAME}              Somsong
${LAST_NAME}               Sandee
${DESTINATION}             Europe
${CONTACT_PERSON}          Sodsai Sandee
${RELATIONSHIP}            Mother
${EMAIL}                   somsong@kkumail.com
${PHONE_NO}                081-111-1234
${SUCCESS_PAGE_TITLE}      Completed        
${CHROME_DRIVER_PATH}      ${EXECDIR}${/}ChromeForTesting${/}chromedriver.exe

*** Test Cases ***
UAT-Lab7-001: Complete Form and Submit Successfully
    Open Browser    ${BASE_URL}    Chrome    executable_path=${CHROME_DRIVER_PATH}
    Set Selenium Speed    ${DELAY}
    Verify Form Is Displayed
    Fill Contact Form
    Submit Form
    Verify Submission Success
    Close Browser
    

*** Keywords ***
Verify Form Is Displayed
    Page Should Contain Element    id=firstname
    Page Should Contain Element    id=lastname
    Page Should Contain Element    id=destination
    Page Should Contain Element    id=contactperson
    Page Should Contain Element    id=relationship
    Page Should Contain Element    id=email
    Page Should Contain Element    id=phone

Fill Contact Form
    Input Text    id=firstname    ${FIRST_NAME}
    Input Text    id=lastname     ${LAST_NAME}
    Input Text    id=destination   ${DESTINATION}
    Input Text    id=contactperson    ${CONTACT_PERSON}
    Input Text    id=relationship  ${RELATIONSHIP}
    Input Text    id=email         ${EMAIL}
    Input Text    id=phone         ${PHONE_NO}

Submit Form
    Click Button    id=submitButton

Verify Submission Success
    Go To    ${Complete_URL}