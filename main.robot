*** Settings ***
Resource    Automação.robot

*** Test Cases ***
Executar Testes de Automação
    [Documentation]    Este teste executa os testes definidos no arquivo Automação.robot
    Abrir Página de Exemplo
    Vericar titulo da página
    Fazendo login
    Criando usuario
    Adicionando permissão de administrador ao usuario