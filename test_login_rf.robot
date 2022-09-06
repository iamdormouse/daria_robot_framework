*** Settings ***
Library    SeleniumLibrary
Documentation    Suite description  #automated tests for scout website


*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}      Chrome
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${SIGNINBUTTON}     xpath=//*/button[@type='submit']
${PAGELOGO}       xpath=//*[@title='Logo Scouts Panel']

*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    [Teardown]    Close Browser

*** Keywords ***
Open login page
    Open Browser        ${LOGIN URL}    ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text      ${EMAILINPUT}   user06@getnada.com
Type in password
    Input Text      ${PASSWORDINPUT}    Test-1234
Click on the Submit button
    Click Element       xpath=//*/button[@type='submit']
Assert dashboard
    wait until element is visible       ${PAGELOGO}
    Title should be     Scouts panel
    Capture page screenshot     alert.png