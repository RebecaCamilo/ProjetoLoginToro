*** Settings ***

Library    SeleniumLibrary


*** Variables ***

&{LOGIN_PAGE_LOCATORS}
...    username_field=id:username
...    password_field=id:password
...    login_button=xpath://button[@type='submit']
...    login_error_message=class:form-error-message
...    fields_error_message=xpath://span[@class='login-form-error-message']

&{HOME_PAGE_LOCATORS}
...    saudation=class:patrimony-info-saudation


*** Keywords ***

### Ações ###
Fill in the Email or CPF field
    [Arguments]    ${USERNAME}
    Wait Until Element Is Visible    locator=${LOGIN_PAGE_LOCATORS.username_field}
    Input Text    locator=${LOGIN_PAGE_LOCATORS.username_field}    text=${USERNAME}

Fill in the Password field
    [Arguments]    ${PASSWORD}
    Wait Until Element Is Visible    locator=${LOGIN_PAGE_LOCATORS.password_field}
    Input Text    locator=${LOGIN_PAGE_LOCATORS.password_field}    text=${PASSWORD}

Press Enter button
    Wait Until Element Is Enabled    locator=${LOGIN_PAGE_LOCATORS.login_button}
    Click Element    locator=${LOGIN_PAGE_LOCATORS.login_button}

Login with credentials
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Fill in the Email or CPF field    ${USERNAME}
    Fill in the Password field    ${PASSWORD}
    Press Enter button

### Verificações ###
Check redirected to the homepage
    Wait Until Element Is Visible   ${HOME_PAGE_LOCATORS.saudation}    15s
    ${url}=    Get Location
    Should Contain    container=${url}    item=/home

Check error ${message} in ${field}
    Wait Until Element Is Visible   ${field}
    ${obtained_message}=    Get Text    locator=${field}
    ${expected_message}=    Set Variable    ${message}
    Should Be Equal    first=${obtained_message}    second=${expected_message}

Check login error message
    [Arguments]    ${MESSAGE}
    Check error ${MESSAGE} in ${LOGIN_PAGE_LOCATORS.login_error_message}

Check form field error message
    [Arguments]    ${MESSAGE}
    Check error ${MESSAGE} in ${LOGIN_PAGE_LOCATORS.fields_error_message}
