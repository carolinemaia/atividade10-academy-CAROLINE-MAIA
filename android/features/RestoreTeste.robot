*** Settings ***

Resource    ../../base.robot

Test Setup        Open App
Test Teardown     Teardown

#Cenario de teste abaixo precisa ter backup realizado
*** Test Cases ***
CT001 - Deve ser possivel acessar funcionalidade de Restore
    Dado que usuário acessa o MENU na tela inicial
    Quando acessa a funcionalidade de Restore
    Então deve ser possível visualizar todas as informações sobre Restore

CT002 - Deve ser possivel selecionar arquivo para restaurar backup
    Dado que usuario possui backup realizado
    E que usuário acessa a funcionalidade de Restore
    Quando clica na função de Selecionar arquivo
    Então deve ser possivel selecionar arquivo na pasta estoque
    E deve ser possivel visualizar os arquivos de backup armazenados
