*** Settings ***

Test Setup    Open Browser    url=${BASE_URL}    browser=${BROWSER}
Test Teardown    Close Browser

Resource    ../resources/pages/login_page.resource
Variables    ../resources/variables/user_data.py
Variables    ../resources/variables/login_error_messages.py


*** Variables ***

${BASE_URL}                  https://app.toroinvestimentos.com.br/entrar
${BROWSER}                   chrome


*** Test Cases ***

TC1: Login with valid email and password
    [Tags]    HAPPY PATH
    Login with credentials    ${VALID_LOGIN_DATA["email"]}    ${VALID_LOGIN_DATA["password"]}
    Check redirected to the homepage

TC2: Login with valid cpf and password
    [Tags]    HAPPY PATH
    Login with credentials    ${VALID_LOGIN_DATA["cpf"]}    ${VALID_LOGIN_DATA["password"]}
    Check redirected to the homepage

TC4: Login with invalid email
    [Tags]    UNHAPPY PATH
    Login with credentials    ${INVALID_LOGIN_DATA["email"]}    ${VALID_LOGIN_DATA["password"]}
    Check login error message    ${ERROR_MESSAGES["login_fail"]}

TC5: Login with invalid cpf
    [Tags]    UNHAPPY PATH
    Login with credentials    ${INVALID_LOGIN_DATA["cpf"]}    ${VALID_LOGIN_DATA["password"]}
    Check login error message    ${ERROR_MESSAGES["login_fail"]}

TC6: Login with invalid password
    [Tags]    UNHAPPY PATH
    Login with credentials    ${VALID_LOGIN_DATA["cpf"]}    ${INVALID_LOGIN_DATA["password"]}
    Check login error message    ${ERROR_MESSAGES["login_fail"]}

TC8: Login with blank "Email or CPF" field
    [Tags]    UNHAPPY PATH
    Fill in the Password field    ${VALID_LOGIN_DATA["password"]}
    Press Enter button
    Check form field error message   ${ERROR_MESSAGES["email"]}
    
TC9: Login with blank "Password" field
    [Tags]    UNHAPPY PATH
    Fill in the Email or CPF field    ${VALID_LOGIN_DATA["email"]}
    Press Enter button
    Check form field error message   ${ERROR_MESSAGES["password"]}