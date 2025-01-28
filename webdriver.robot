*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}               http://localhost:7272/Form.html
${DELAY}                   0
${CHROME_BROWSER_PATH}    ${EXECDIR}${/}ChromeForTesting${/}chrome.exe
${CHROME_DRIVER_PATH}     ${EXECDIR}${/}ChromeForTesting${/}chromedriver.exe
${URL}                    https://www.kku.ac.th

*** Test Cases ***
TC_001: Start Chrome For Testing
    # สร้างตัวเลือก Chrome Options
    ${options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${options.binary_location}    Set Variable    ${CHROME_BROWSER_PATH}
    
    # สร้าง Service Object สำหรับ Chrome Driver
    ${service}    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")

    # ใช้ `options` หรือ `chrome_options` ตาม Selenium version
    Create Webdriver    Chrome    options=${options}    service=${service}
    Go To    ${URL}


