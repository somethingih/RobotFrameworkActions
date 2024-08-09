*** Settings ***
Documentation     This file contains all the keywords for the confim dialog.
Library    SeleniumLibrary


*** Variables ***
${OK_btn}        //button[text()='OK' and @ng-click="close(btn.result)"]
${Cancel_btn}    //button[text()='OK' and @ng-click="close(btn.result)"]


*** Keywords ***
Click OK Button
    Click Button    ${OK_btn}

Click Cancel Button
    Click Button    ${Cancel_btn}