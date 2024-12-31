*** Settings ***

Library    SeleniumLibrary

Test Setup    Run Keywords
...    Open Browser    url=${BASE_URL}    browser=${BROWSER}    AND
...    Maximize Browser Window

Test Teardown    Close Browser

*** Variables ***

${BASE_URL}         https://app.toroinvestimentos.com.br/entrar
${BROWSER}          chrome

${email}            rebecacamilo.qa@gmail.com
${cpf}              08491121412
${password}         3%pXRzzuCQ-bc7S

${invalidEmail}     rebecacamilo/qa@gmail.com
${invalidCpf}       11122233313
${invalidPassword}  rebecacamilo/qa@gmail.com

${dataErrorMessage}     Dados incorretos. Digite novamente.
${emailErrorMessage}     E-mail inválido
${passwordErrorMessage}     Senha inválida

${saudation}        class:patrimony-info-saudation

&{LOGIN_PAGE}
...    UsernameInput=id:username
...    PasswordInput=id:password
...    LoginButton=xpath://button[@type='submit']
...    DataErrorMessageClass=class:form-error-message
...    FieldsErrorMessage=xpath://span[@class='login-form-error-message']

*** Keywords ***

### Ações ###
Preencher campo E-mail ou CPF com ${username}
    Wait Until Element Is Visible    locator=${LOGIN_PAGE.UsernameInput}
    Input Text    locator=${LOGIN_PAGE.UsernameInput}    text=${username}

Preencher campo Senha com ${password}
    Wait Until Element Is Visible    locator=${LOGIN_PAGE.PasswordInput}
    Input Text    locator=${LOGIN_PAGE.PasswordInput}    text=${password}

Pressionar botao Entrar
    Wait Until Element Is Enabled    locator=${LOGIN_PAGE.LoginButton}
    Click Element    locator=${LOGIN_PAGE.LoginButton}

Realizar login com ${username} e ${password}
    Preencher campo E-mail ou CPF com ${username}
    Preencher campo Senha com ${password}
    Pressionar botao Entrar

### Verificações ###
Verificar se conseguiu realizar o login corretamente
    Wait Until Element Is Visible   ${saudation}    10s
    ${url}=    Get Location
    Should Contain    container=${url}    item=/home

Verificar ${mensagem} de erro no ${campo}
    Wait Until Element Is Visible   ${campo}
    ${mensagem_obtida}=    Get Text    locator=${campo}
    ${mensagem_esperada}=    Set Variable    ${mensagem}
    Should Be Equal    first=${mensagem_obtida}    second=${mensagem_esperada}

*** Test Cases ***

TC1: Login com E-mail e senha válidos
    Realizar login com ${email} e ${password}
    Verificar se conseguiu realizar o login corretamente

TC2: Login com CPF e senha válidos
    Realizar login com ${cpf} e ${password}
    Verificar se conseguiu realizar o login corretamente

TC4: Login com E-mail inválido
    Realizar login com ${invalidEmail} e ${password}
    Verificar ${dataErrorMessage} de erro no ${LOGIN_PAGE.DataErrorMessageClass}

TC5: Login com CPF inválido
    Realizar login com ${invalidCpf} e ${password}
    Verificar ${dataErrorMessage} de erro no ${LOGIN_PAGE.DataErrorMessageClass}

TC6: Login com Senha inválida
    Realizar login com ${cpf} e ${invalidPassword}
    Verificar ${dataErrorMessage} de erro no ${LOGIN_PAGE.DataErrorMessageClass}

TC8: Login com campo "E-mail ou CPF" em branco
    Preencher campo Senha com ${password}
    Pressionar botao Entrar
    Verificar ${emailErrorMessage} de erro no ${LOGIN_PAGE.FieldsErrorMessage}
    
TC9: Login com campo "Senha" em branco
    Preencher campo E-mail ou CPF com ${email}
    Pressionar botao Entrar
    Verificar ${passwordErrorMessage} de erro no ${LOGIN_PAGE.FieldsErrorMessage}
