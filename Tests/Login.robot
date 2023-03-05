*** Settings ***
Library     AppiumLibrary
Resource    ../Resources/base_keywords.robot
Resource    ../Resources/password.robot
Resource    ../Resources/page_objects.robot

Suite Setup   Set Appium Timeout    10s
Test Teardown    Close Application

*** Test Cases ***
Login User 1
    Open Android Test App on First Device
    Signin With User        ${USER1_EMAIL}      ${USER1_PASSWORD}
    Logout With User

Login User 2
    Open Android Test App on Second Device
    Signin With User        ${USER2_EMAIL}      ${USER2_PASSWORD}
    Logout With User
