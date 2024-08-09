*** Settings ***
Library    SeleniumLibrary
Resource   ../Keywords/Pages/webtablespage.resource
Resource   ../Keywords/Workflows/UserModalWorkflows.resource
Resource   ../Keywords/Pages/ConfirmModalPage.resource

Test Setup        Open Browser    https://www.way2automation.com/angularjs-protractor/webtables/    headlesschrome
Test Teardown     Close All Browsers


*** Test Cases ***
Delete User From Table
    [Documentation]    This test will delete a user from the table.
    ${UserRowLocator}=    Get User Row From Table      
    ...    UserName=novak
    Click X button    ${UserRowLocator}
    Click OK Button
    Page Should Not Contain Element    ${UserRowLocator}

Delete Locked User From Table
    [Tags]    Bug
    [Documentation]    This Test is designed to fail and demonstrate a possible Bug in user deletion.
    ...    I am going out on a limb here and making the assumption that a user marked as "Locked" should not be deletable.
    ...    This just seems reasonable to me, again kinda making this workflow up but seems reasonable to me. 
    ${UserRowLocator}=    Get User Row From Table
    ...    FirstName=Tom
    ...    LastName=Blue
    ...    UserName=matt
    Click X button    ${UserRowLocator}
    Click OK Button
    Page Should Contain Element    ${UserRowLocator}