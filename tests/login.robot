*** Settings ***

Test Setup    Run Keywords
...    Open Browser    url=${BASE_URL}    browser=${BROWSER}    AND
...    Maximize Browser Window

Test Teardown    Close Browser

Resource    ../resources/pages/login_page.robot

*** Variables ***

${BASE_URL}                  https://app.toroinvestimentos.com.br/entrar
${BROWSER}                   chrome

${valid_email}               rebecacamilo.qa@gmail.com
${valid_cpf}                 08491121412
${valid_password}            3%pXRzzuCQ-bc7S

${invalid_email}             rebecacamilo/qa@gmail.com
${invalid_cpf}               11122233313
${invalid_password}          teste%1234

${login_error_message}       Dados incorretos. Digite novamente.
${email_error_message}       E-mail inválido
${password_error_message}    Senha inválida

*** Test Cases ***

TC1: Login com E-mail e senha válidos
    Realizar login com ${valid_email} e ${valid_password}
    Verificar se conseguiu realizar o login corretamente

TC2: Login com CPF e senha válidos
    Realizar login com ${valid_cpf} e ${valid_password}
    Verificar se conseguiu realizar o login corretamente

TC4: Login com E-mail inválido
    Realizar login com ${invalid_email} e ${valid_password}
    Verificar ${login_error_message} de erro no login

TC5: Login com CPF inválido
    Realizar login com ${invalid_cpf} e ${valid_password}
    Verificar ${login_error_message} de erro no login

TC6: Login com Senha inválida
    Realizar login com ${valid_cpf} e ${invalid_password}
    Verificar ${login_error_message} de erro no login

TC8: Login com campo "E-mail ou CPF" em branco
    Preencher campo Senha com ${valid_password}
    Pressionar botao Entrar
    Verificar ${email_error_message} de erro nos campos do formulario
    
TC9: Login com campo "Senha" em branco
    Preencher campo E-mail ou CPF com ${valid_email}
    Pressionar botao Entrar
    Verificar ${password_error_message} de erro nos campos do formulario
