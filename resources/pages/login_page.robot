*** Settings ***

Library    SeleniumLibrary

*** Variables ***

&{LOGIN_PAGE}
...    username_field=id:username
...    password_field=id:password
...    login_button=xpath://button[@type='submit']
...    login_error_message=class:form-error-message
...    fields_error_message=xpath://span[@class='login-form-error-message']

&{HOME_PAGE}
...    saudation=class:patrimony-info-saudation

*** Keywords ***

### Ações ###
Fill in the Email or CPF field with ${username}
    Wait Until Element Is Visible    locator=${LOGIN_PAGE.username_field}
    Input Text    locator=${LOGIN_PAGE.username_field}    text=${username}

Fill in the Password field with ${password}
    Wait Until Element Is Visible    locator=${LOGIN_PAGE.password_field}
    Input Text    locator=${LOGIN_PAGE.password_field}    text=${password}

Press Enter button
    Wait Until Element Is Enabled    locator=${LOGIN_PAGE.login_button}
    Click Element    locator=${LOGIN_PAGE.login_button}

Login with ${username} and ${password}
    Fill in the Email or CPF field with ${username}
    Fill in the Password field with ${password}
    Press Enter button

### Verificações ###
Check if you were redirected to the homepage
    Wait Until Element Is Visible   ${HOME_PAGE.saudation}    10s
    ${url}=    Get Location
    Should Contain    container=${url}    item=/home

Verificar ${message} de erro no ${field}
    Wait Until Element Is Visible   ${field}
    ${obtained_message}=    Get Text    locator=${field}
    ${expected_message}=    Set Variable    ${message}
    Should Be Equal    first=${obtained_message}    second=${expected_message}

Check login error message ${message}
    Verificar ${message} de erro no ${LOGIN_PAGE.login_error_message}

Check ${message} for error in form fields
    Verificar ${message} de erro no ${LOGIN_PAGE.fields_error_message}
