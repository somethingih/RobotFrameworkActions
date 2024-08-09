*** Settings ***
Library    SeleniumLibrary
Resource   ../Keywords/Pages/webtablespage.resource
Resource   ../Keywords/Workflows/UserModalWorkflows.resource

Test Setup        Open Browser    https://www.way2automation.com/angularjs-protractor/webtables/    chrome
Test Teardown     Close All Browsers


*** Test Cases ***
Add User With Only Fields Labeled Required
    [Tags]    Bug
    [Documentation]    This Test is designed to fail and demonstrate the First bug I found.
    ...    
    ...    Bug 1: 
    ...    Within the Add User Modal The "Required!" Label is missing on two fields.
    ...    - "User Name"
    ...    - "Call Phone"
    ...    Without these Field you cannot click Save.
    Click Add User button
    Input First Name        FirstName
    Select Role             Sales Team
    Element Should Be Enabled    ${Save_btn}    #This Should Force this test to fail
    Click Save Button

Add User With All Fields
    [Tags]    Bug   
    [Documentation]    This Test is designed to fail and demonstrate the Second Bug in user creation
    ...    When you create a user with All Fields what you select in Customer does not show up on the table.
    Create User With All Fields
    ${UserRowLocator}=    Get User Row From Table    
    ...    FirstName=FirstName    
    ...    UserName=UserName
    ...    Customer=Company AAA
    ...    Role=Sales Team    
    ...    PhoneNumber=5555555555
    Page Should Contain Element    ${UserRowLocator}

Add User With Only Required Fields
    [Documentation]    This Test demonstrates actual fields needed to create a user.
    Create User with Required Fields
    ${UserRowLocator}=    Get User Row From Table    
    ...    FirstName=FirstName    
    ...    UserName=UserName
    ...    Role=Sales Team    
    ...    PhoneNumber=5555555555
    Page Should Contain Element    ${UserRowLocator}