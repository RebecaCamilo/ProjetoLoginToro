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
Preencher campo E-mail ou CPF com ${username}
    Wait Until Element Is Visible    locator=${LOGIN_PAGE.username_field}
    Input Text    locator=${LOGIN_PAGE.username_field}    text=${username}

Preencher campo Senha com ${password}
    Wait Until Element Is Visible    locator=${LOGIN_PAGE.password_field}
    Input Text    locator=${LOGIN_PAGE.password_field}    text=${password}

Pressionar botao Entrar
    Wait Until Element Is Enabled    locator=${LOGIN_PAGE.login_button}
    Click Element    locator=${LOGIN_PAGE.login_button}

Realizar login com ${username} e ${password}
    Preencher campo E-mail ou CPF com ${username}
    Preencher campo Senha com ${password}
    Pressionar botao Entrar

### Verificações ###
Verificar se conseguiu realizar o login corretamente
    Wait Until Element Is Visible   ${HOME_PAGE.saudation}    10s
    ${url}=    Get Location
    Should Contain    container=${url}    item=/home

Verificar ${mensagem} de erro no ${campo}
    Wait Until Element Is Visible   ${campo}
    ${mensagem_obtida}=    Get Text    locator=${campo}
    ${mensagem_esperada}=    Set Variable    ${mensagem}
    Should Be Equal    first=${mensagem_obtida}    second=${mensagem_esperada}

Verificar ${mensagem} de erro no login
    Verificar ${mensagem} de erro no ${LOGIN_PAGE.login_error_message}

Verificar ${mensagem} de erro nos campos do formulario
    Verificar ${mensagem} de erro no ${LOGIN_PAGE.fields_error_message}
