*** Settings ***
Library    SeleniumLibrary
Documentation    Suite description  #automated tests for scout website


*** Variables ***
${LOGIN URL}        https://scouts.futbolkolektyw.pl/en/
${BROWSER}      Chrome
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${SIGNINBUTTON}     xpath=//*/button[@type='submit']
${PAGELOGO}       xpath=//*[contains(@style, 'logo')]
${SIGNOUTBUTTON}        xpath=//*/ul[2]/div[2]
${LANGUAGEBUTTON}       xpath=//*[text()='Polski']
${ADDPLAYERBUTTON}      xpath=//*[@href='/en/players/add']
${NAMEINPUT}        xpath=//*[@name='name']
${SURNAMEINPUT}     xpath=//*[@name='surname']
${AGEINPUT}     xpath=//*[@name='age']
${MPINPUT}      xpath=//*[@name='mainPosition']
${SUBMITBUTTON}     xpath=//*[@type='submit']
${CLEARBUTTON}      xpath=//*[text()='Clear']
${HEADER}       xpath=//h5
${DASHHEADER}       xpath=//*/div[1]/header/div/h6

*** Test Cases ***

Login to the system   #1
    Open Login Page
    Type in email
    Type in password
    Click On The Sign In Button
    Wait for dashboard
    [Teardown]    Close Browser

Check the login page header    #2
    Open Login Page
    Assert login page header
    [Teardown]    Close Browser

Check the dashboard title      #3
    Open Login Page
    Type in email
    Type in password
    Click On The Sign In Button
    Wait for dashboard
    Assert the dashboard title
    [Teardown]    Close Browser

Check the dashboard header      #4
    Open Login Page
    Type in email
    Type in password
    Click On The Sign In Button
    Wait for dashboard
    Assert dashboard header
    [Teardown]    Close Browser

Switch the language         #5
    Open Login Page
    Type in email
    Type in password
    Click On The Sign In Button
    Wait for dashboard
    CLick on Language button
    [Teardown]    Close Browser

Check Logo visibility         #6
    Open Login Page
    Type in email
    Type in password
    Click On The Sign In Button
    Check logo visibility
    [Teardown]    Close Browser

Add a player                      #7
    Open Login Page
    Type in email
    Type in password
    Click On The Sign In Button
    Wait for dashboard
    Click on the Add Player Button
    Assert add player page
    Type In Name
    Type In Surname
    Type In Age
    Type In Main Position
    Click on the Submit Button
    [Teardown]    Close Browser

Clear the Form     #8
    Open Login Page
    Type in email
    Type in password
    Click On The Sign In Button
    Wait for dashboard
    Click on the Add Player Button
    Assert add player page
    Type In Name
    Type In Surname
    Click On Clear Button
    [Teardown]    Close Browser

Sign out of system         #9
    Open Login Page
    Type in email
    Type in password
    Click On The Sign In Button
    Wait for dashboard
    Click on the Sign out button
    [Teardown]    Close Browser

*** Keywords ***
Open Login Page
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
Wait for dashboard
    wait until element is visible       ${SIGNOUTBUTTON}
Assert the dashboard title
    Title should be     Scouts panel
    Capture page screenshot     alert.png
Check logo visibility
    wait until element is visible       ${PAGELOGO}
    Capture page screenshot     alert.png
Click on the Add Player Button
    Click Element       ${ADDPLAYERBUTTON}
Assert add player page
    wait until element is visible       ${NAMEINPUT}
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
Assert login page header
    Element Text Should Be        ${HEADER}   Scouts Panel
    Capture page screenshot     alert.png
Assert dashboard header
    Element Text Should Be        ${DASHHEADER}   Scouts Panel
    Capture page screenshot     alert.png