*** Settings ***
Library     AppiumLibrary
Resource    ../Resources/base_keywords.robot
Resource    ../Resources/password.robot
Resource    ../Resources/locators.robot

*** Variables ***

# *** Application Variables
${ANDROID_AUTOMATION_NAME}          UIAutomator2
${ANDROID_PLATFORM_NAME}            Android
#${ANDROID_DEVICE_NAME}              emulator-5554
#${ANDROID_DEVICE_NAME}              emulator-5556
${CHAT21_APPLICATION_ID}            chat21.android.demo
${APPIUM_PORT_DEVICE1}              4723
${APPIUM_PORT_DEVICE2}              4725
${appActivity}                      chat21.android.demo.SplashActivity


*** Keywords ***
Open Android Test App
  [Arguments]    ${APPIUM_PORT}=${APPIUM_PORT_DEVICE1}
  open application  http://localhost:${APPIUM_PORT}/wd/hub
#  ...  deviceName=${ANDROID_DEVICE_NAME}
  ...  automationName=${ANDROID_AUTOMATION_NAME}
  ...  platformName=${ANDROID_PLATFORM_NAME}
  ...  appPackage=${CHAT21_APPLICATION_ID}
  ...  appActivity=${appActivity}
  ${ALERT}      Run Keyword And Return Status    Page Should Contain Element    ${ANDROID10_CONTINUE_BUTTON}
  Run Keyword If    '${ALERT}' == 'True'         Bypass Android 10 Alerts

Open Android Test App on First Device
    Open Android Test App    ${APPIUM_PORT_DEVICE1}

Open Android Test App on Second Device
    Open Android Test App    ${APPIUM_PORT_DEVICE2}

Bypass Android 10 Alerts
    Wait Until Page Contains Element    ${ANDROID10_CONTINUE_BUTTON}
    Wait For And Click Element          ${ANDROID10_CONTINUE_BUTTON}
    Wait Until Page Contains Element    ${ANDROID10_OK_BUTTON}
    Wait For And Click Element          ${ANDROID10_OK_BUTTON}

Signin With User
    [Arguments]             ${EMAIL}    ${USER_PASSWORD}
    Input User Email        ${EMAIL}
    Input User Password     ${USER_PASSWORD}
    Submit Login
    Verify Login Is Successful

Input User Email
    [Arguments]     ${EMAIL}
    Verify Login Email Field Is Displayed
    Wait For And Input Text             ${LOGIN_EMAIL_FIELD}        ${EMAIL}

Input User Password
    [Arguments]     ${USER_PASSWORD}
    Wait For And Input Text             ${LOGIN_PASSWORD_FIELD}     ${USER_PASSWORD}

Submit Login
    Wait For And Click Element          ${LOGIN_SIGNIN_BUTTON}

Verify Login Is Successful
    Wait Until Page Contains Element    ${MAIN_HOME_TAB}

Logout With User
    Go To Profile Page
    Click The Logout Button
    Verify Login Email Field Is Displayed

Go To Profile Page
    Wait For And Click Element          ${MAIN_PROFILE_TAB}
    Wait Until Page Contains Element    ${PROFILE_LOGOUT_BUTTON}

Click The Logout Button
    Wait For And Click Element          ${PROFILE_LOGOUT_BUTTON}

Verify Login Email Field Is Displayed
    Wait Until Page Contains Element    ${LOGIN_EMAIL_FIELD}

Go To Chat Tab
    Wait For And Click Element          ${MAIN_CHAT_TAB}
    Wait Until Page Contains Element    ${CHAT_NEW_CONVERSATION_BUTTON}

# *** Chat Tab ***
Create New Conversation
    [Arguments]     ${NAME}
    Wait For And Click Element          ${CHAT_NEW_CONVERSATION_BUTTON}
    Wait Until Page Contains Element    ${NEW_CONVERSATION_CONTACTS_HEADER_SEARCH_BUTTON}
    Search For Contact                  ${NAME}
    Wait For And Click Element          //android.widget.TextView[contains(@resource-id,'fullname') and @text="${NAME}"]

Search For Contact
    [Arguments]     ${NAME}
    Wait For And Click Element          ${NEW_CONVERSATION_CONTACTS_HEADER_SEARCH_BUTTON}
    Wait For And Input Text             ${NEW_CONVERSATION_CONTACTS_HEADER_SEARCH_FIELD}      ${NAME}
    Wait Until Page Contains Element    //android.widget.TextView[contains(@resource-id,'fullname') and @text="${NAME}"]
    Wait Until Converstation Window Is Open    ${NAME}

Wait Until Page Contains Conversation
    [Arguments]     ${NAME}
    Wait Until Page Contains Element    //android.widget.TextView[contains(@resource-id,'recipient_display_name') and @text="${NAME}"]

Open Conversation
    [Arguments]     ${NAME}
    Wait Until Page Contains Conversation    ${NAME}
    Wait Until Page Contains Element    //android.widget.TextView[contains(@resource-id,'recipient_display_name') and @text="${NAME}"]
    Wait Until Converstation Window Is Open     ${NAME}

Wait Until Converstation Window Is Open
    [Arguments]     ${NAME}
    Wait Until Page Contains Element    //android.widget.TextView[contains(@resource-id,'toolbar-title') and @text="${NAME}"]

Send Message Inside Conversation Window
    [Arguments]     ${MESSAGE}
    Wait For And Input Text         ${CONVERSATION_INPUT_FIELD}    ${MESSAGE}
    Wait For And Click Element      ${CONVERSATION_SEND_MESSAGE_BUTTON}
    Wait Until Conversation Contains Message    ${MESSAGE}

Wait Until Conversation Contains Message
    [Arguments]     ${MESSAGE}
    Wait Until Page Contains Element    //android.widget.TextView[contains(@resource-id,'message') and @text="${MESSAGE}"]



