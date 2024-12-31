# Case de Automação – Toro Investimentos
Este repositório contém um projeto de automação de testes para a funcionalidade de Login do site Toro Investimentos, utilizando o Robot Framework. O objetivo principal é validar diferentes cenários de login, com base nos dados de E-mail, CPF e Senha.

## Tecnologias Utilizadas
- Robot Framework: Framework de automação para testes.
- SeleniumLibrary: Biblioteca de Selenium para interação com o navegador.
- Python: Linguagem usada para o desenvolvimento do Robot Framework.

### Cenários de Teste
Os cenários de teste foram escrito em Gherkin e cobrem os seguintes cenários de login:
1. Login com E-mail e Senha Válidos
2. Login com CPF e Senha Válidos
3. Login após Redefinição de Senha
4. Login com E-mail Inválido
5. Login com CPF Inválido
6. Login com Senha Inválida
7. Login com Campo "E-mail ou CPF" em Branco
8. Login com Campo "Senha" em Branco
9. Login com Campos "E-mail ou CPF" e "Senha" em Branco
   
### Testes Automatizados:
Os casos de teste escolhidos para serem automatizados incluem os caminhos felizes da funcionalidade e também cenários de erro. <br>
TC1 - Login com E-mail e Senha Válidos <br>
TC2 - Login com CPF e Senha Válidos <br>
TC4 - Login com E-mail Inválido <br>
TC5 - Login com CPF Inválido <br>
TC6 - Login com Senha Inválida <br>
TC7 - Login com Campo "E-mail ou CPF" em Branco <br>
TC8 - Login com Campo "Senha" em Branco <br>

### Page Objects
O código utiliza o padrão Page Object para uma melhor organização e manutenção do código de automação. Os arquivos relacionados são:
- login_page.robot: Contém os elementos e ações relacionados à página de login.
- login.robot: Contém os testes automatizados propriamente ditos.

### Estrutura do Código
- Settings:
O arquivo settings.robot define as configurações globais, como a URL base e o navegador a ser utilizado.

- Variables:
As variáveis são definidas para facilitar a manutenção e reutilização de dados no código, como o e-mail e senha válidos/invalidos.

- Keywords:
São definidos os Keywords que representam as ações e verificações realizadas durante a automação:
Login com E-mail/CPF e Senha
Verificar Mensagens de Erro
Verificar Redirecionamento

- Test Cases:
Local onde estão os casos de teste em linguagem de fácil compreensão devido o uso de Keywords.

Os resultados dos testes serão gerados em arquivos HTML e log.
