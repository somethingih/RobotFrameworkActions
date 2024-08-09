*** Settings ***
Documentation     This file contains all the keywords for Both the Add User Modal and the Edit User Modal
Library    SeleniumLibrary
Library    String

*** Variables ***
${FirstName_txt}    name:FirstName
${LastName_txt}     name:LastName
${UserName_txt}     name:UserName
${Password_txt}     name:Password
${Role_select}      name:RoleId
${Email_txt}        name:Email
${CellPhone_txt}    name:Mobilephone
${Locked_chk}       name:IsLocked
${Close_btn}        //button[@ng-click="close()"]
${Save_btn}         //button[@ng-click="save(user)"]

*** Keywords ***
Input First Name
    [Arguments]    ${FirstName}
    Input Text    ${FirstName_txt}    ${FirstName}

Input Last Name
    [Arguments]    ${LastName}
    Input Text    ${LastName_txt}    ${LastName}

Input User Name
    [Arguments]    ${UserName}
    Input Text    ${UserName_txt}    ${UserName}

Input Password Value
    [Arguments]    ${Password}
    Input Password    ${Password_txt}    ${Password}

Select Customer
    [Arguments]    ${Customer}
    ${Customer_rad}=    Set Variable    //label[//input[@Name='optionsRadios'] and text()='${Customer}']
    Click Element    ${Customer_rad}
    
Select Role
    [Arguments]    ${Role}
    Click Element    ${Role_select}
    ${option_xpath}=    Set Variable    //option[text()="${Role}"]
    # Wait Until Element Is Visible    ${option_xpath}  --- I don think we need this in this case.
    Click Element    ${option_xpath}

Input Email
    [Arguments]    ${Email}
    Input Text    ${Email_txt}    ${Email}

Input Cell Phone
    [Documentation]    This Keyword is only needed for the "Add User Modal"
    [Arguments]    ${PhoneNumber}
    Input Text    ${CellPhone_txt}    ${PhoneNumber}

${Status} Locked Checkbox
    [Documentation]    This Keyword is only needed for the "Edit User Modal"
    ...    This is also and great place for an example of an inline keyword.
    ...    
    ...    "Status" should be "Check" Or "Uncheck"
    ...    Examples:
    ...    | Check Locked Checkbox |
    ...    | Uncheck Locked Checkbox |
    
    ${Status}=    Convert To Lower Case    ${Status}

    IF    ${Status} == "check"
        Select Checkbox    ${Locked_chk}
    ELSE IF    ${Status} == "unchecked"
        Unselect Checkbox    ${Locked_chk}
    ELSE
        Fatal Error    ${Status} is not a valid input for this keyword.
    END

Click Close Button
    Click Button    ${Close_btn}

Click Save Button
    Click Element    ${Save_btn}
