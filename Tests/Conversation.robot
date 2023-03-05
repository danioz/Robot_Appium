*** Settings ***
Library     AppiumLibrary
Resource    ../Resources/base_keywords.robot
Resource    ../Resources/password.robot
Resource    ../Resources/page_objects.robot

Suite Setup    Set Appium Timeout    10s

*** Test Cases ***
Conversation
    Open Android Test App on First Device
    Signin With User        ${USER1_EMAIL}      ${USER1_PASSWORD}
    Open Android Test App on Second Device
    Signin With User        ${USER2_EMAIL}      ${USER2_PASSWORD}
    Go To Chat Tab
    Switch Application    1
    Go To Chat Tab
    Create New Conversation                     ${USER2_NAME}
    Send Message Inside Conversation Window     Hello again user2
    Switch Application    2
    Wait Until Page Contains Conversation       ${USER1_NAME}
    Open Conversation                           ${USER1_NAME}
    Wait Until Conversation Contains Message    Hello again user2
    Send Message Inside Conversation Window     Hello again user1
    Switch Application    1
    Wait Until Conversation Contains Message    Hello again user1
