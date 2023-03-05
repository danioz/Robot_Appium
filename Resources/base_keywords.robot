*** Settings ***
Library    AppiumLibrary

*** Keywords ***
Wait For And Click Element
    [Arguments]    ${locator}
    wait until element is visible       ${locator}
    click element                       ${locator}

Wait For And Input Text
    [Arguments]    ${locator}    ${text}
    wait until element is visible       ${locator}
    input text                          ${locator}    ${text}

Wait And Get Text
    [Arguments]    ${locator}
    wait until element is visible       ${locator}
    ${text}=    get text    ${locator}
    [Return]    ${text}

Wait And Get Element
    [Arguments]    ${locator}
    wait until element is visible       ${locator}
    ${element}    get webelement       ${locator}
    [Return]    ${element}

Wait And Get Elements
    [Arguments]    ${locator}
    wait until element is visible       ${locator}
    @{elements}    get webelements      ${locator}
    [Return]    @{elements}

Run Keyword Until Success
    [Arguments]     ${keyword}     @{keyword_arg}
    Wait Until Keyword Succeeds  20x    1s      ${keyword}     @{keyword_arg}