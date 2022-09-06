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
${SIGNOUTBUTTON}        xpath=//*[text()='Sign out']
${LANGUAGEBUTTON}       xpath=//*[text()='Polski']
${ADDPLAYERBUTTON}      xpath=//span[text()='Add player']/..
${NAMEINPUT}        xpath=//*[@name='name']
${SURNAMEINPUT}     xpath=//*[@name='surname']
${AGEINPUT}     xpath=//*[@name='age']
${MPINPUT}      xpath=//*[@name='mainPosition']
${SUBMITBUTTON}     xpath=//*[@type='submit']
${CLEARBUTTON}      xpath=//*[text()='Clear']

*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click On The Sign In Button
    Assert Dashboard
    [Teardown]    Close Browser
Sign out of system
    Open login page
    Type in email
    Type in password
    Click On The Sign In Button
    Assert dashboard
    Click on the Sign out button
    [Teardown]    Close Browser
Switch the language
    Open Login Page
    Type in email
    Type in password
    Click On The Sign In Button
    Assert dashboard
    CLick on Language button
    [Teardown]    Close Browser
Check Logo visibility
    Open Login Page
    Type in email
    Type in password
    Click On The Sign In Button
    Assert dashboard
    Check logo visibility
    [Teardown]    Close Browser
Add a player
    Open Login Page
    Type in email
    Type in password
    Click On The Sign In Button
    Assert dashboard
    Click on the Add Player Button
    Type In Name
    Type In Surname
    Type In Age
    Type In Main Position
    Click on the Submit Button
    [Teardown]    Close Browser
Clear the Form
    Open Login Page
    Type in email
    Type in password
    Click On The Sign In Button
    Assert dashboard
    Click on the Add Player Button
    Type In Name
    Type In Surname
    Click On Clear Button
    [Teardown]    Close Browser
*** Keywords ***
Open login page
    Open Browser        ${LOGIN URL}    ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text      ${EMAILINPUT}   user06@getnada.com
Type in password
    Input Text      ${PASSWORDINPUT}    Test-1234
Click On The Sign In Button
    Click Element       xpath=//*/button[@type='submit']
Click on the Sign out button
    Click Element       ${SIGNOUTBUTTON}
Click on Language button
    Click Element       ${LANGUAGEBUTTON}
Assert dashboard
    wait until element is visible       ${SIGNOUTBUTTON}
    Title should be     Scouts panel
    Capture page screenshot     alert.png
Check logo visibility
    wait until element is visible       ${PAGELOGO}
    Capture page screenshot     alert.png
Click on the Add Player Button
    Click Element       ${ADDPLAYERBUTTON}
Type In Name
    Input text      ${NAMEINPUT}    Peter
Type In Surname
    Input text      ${SURNAMEINPUT}     Griffin
Type In Age
    Input text      ${AGEINPUT}     01.01.1980
Type In Main Position
    Input text      ${MPINPUT}      family guy
Click on the Submit Button
    Click Element       ${SUBMITBUTTON}
Click On Clear Button
    Click Element       ${CLEARBUTTON}
