*** Settings ***
Documentation     This file contains all the keywords for the webtables page.
Library    SeleniumLibrary

*** Variables ***
${AddUser_btn}    //button[@type="add" and text()=" Add User"]
${Users_tbl}      //tbody
${X_btn}          //td[button[@ng-click="delUser()"]]

*** Keywords ***
Click Add User button
    Click Button    ${AddUser_btn}

Get User Row From Table
        [Arguments]    ${FirstName}=    ${LastName}=    ${UserName}=    ${Password}=
    ...    ${Customer}=    ${Role}=    ${Email}=    ${PhoneNumber}=
    ${UserRowLocator}=    catenate    SEPARATOR=
    ...    ${Users_tbl}//tr[td[normalize-space(text())='${FirstName}'] 
    ...    and td[normalize-space(text())='${LastName}'] 
    ...    and td[normalize-space(text())='${UserName}'] 
    ...    and td[normalize-space(text())='${Password}']
    ...    and td[normalize-space(text())='${Customer}']
    ...    and td[normalize-space(text())='${Role}']
    ...    and td[normalize-space(text())='${Email}']
    ...    and td[normalize-space(text())='${PhoneNumber}']]
    RETURN    ${UserRowLocator}


Click X button
    [Documentation]    This Keyword clicks the x on a user row.
    [Arguments]    ${UserRowLocator}
    ${DelUserLocator}=    Set Variable    ${UserRowLocator}${X_btn}
    Click Element    ${DelUserLocator}