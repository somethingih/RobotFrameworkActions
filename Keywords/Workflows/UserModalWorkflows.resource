*** Settings ***
Documentation     This file contains a collection of workflows for the User modal
Resource    ../Pages/UserModalPage.resource
Resource    ../Pages/webtablespage.resource


*** Keywords ***
Create User With All Fields
    [Arguments]    ${FirstName}=FirstName    ${LastName}=LastName    ${UserName}=UserName    ${Password}=Password
    ...    ${Customer}=Company AAA    ${Role}=Sales Team    ${Email}=email@email.com    ${PhoneNumber}=555-555-5555
    Click Add User button
    Input First Name        ${FirstName}
    Input Last Name         ${LastName}
    Input User Name         ${UserName}
    Input Password Value    ${Password}
    Select Customer         ${Customer}
    Select Role             ${Role}
    Input Email             ${Email}
    Input Cell Phone        ${PhoneNumber}
    Click Save Button

Create User with Required Fields
    [Documentation]    This Keyword creates a user with the only the required fields.
    [Arguments]    ${FirstName}=FirstName    ${UserName}=UserName    ${Role}=Sales Team    ${PhoneNumber}=5555555555
    Click Add User button
    Input First Name    ${FirstName}
    Input User Name     ${UserName}
    Select Role         ${Role}
    Input Cell Phone    ${PhoneNumber}
    Click Save Button
