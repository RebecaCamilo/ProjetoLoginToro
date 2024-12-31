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

TC1: Login with valid email and password
    Login with ${valid_email} and ${valid_password}
    Check if you were redirected to the homepage

TC2: Login with valid cpf and password
    Login with ${valid_cpf} and ${valid_password}
    Check if you were redirected to the homepage

TC4: Login with invalid email
    Login with ${invalid_email} and ${valid_password}
    Check login error message ${login_error_message}

TC5: Login with invalid cpf
    Login with ${invalid_cpf} and ${valid_password}
    Check login error message ${login_error_message}

TC6: Login with invalid password
    Login with ${valid_cpf} and ${invalid_password}
    Check login error message ${login_error_message}

TC8: Login with blank "Email or CPF" field
    Fill in the Password field with ${valid_password}
    Press Enter button
    Check ${email_error_message} for error in form fields
    
TC9: Login with blank "Password" field
    Fill in the Email or CPF field with ${valid_email}
    Press Enter button
    Check ${password_error_message} for error in form fields
