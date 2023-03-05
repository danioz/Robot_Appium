*** Settings ***
Library     AppiumLibrary
Resource    ../Resources/base_keywords.robot
Resource    ../Resources/page_objects.robot

Test Setup  Open Android Test App
Test Teardown   Close Application

*** Test Cases ***
Open Application
    wait until element is visible   ${LOGIN_EMAIL_FIELD}
    wait until element is visible   ${LOGIN_PASSWORD_FIELD}
    wait until element is visible   ${LOGIN_SIGNIN_BUTTON}


