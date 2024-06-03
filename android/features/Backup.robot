*** Settings ***

Resource    ../../base.robot

Test Setup        Open App
Test Teardown     Teardown


*** Test Cases ***
CT001 - Deve ser possível acessar a funcionalidade de backup
    Dado que usuário acessa o MENU na tela inicial
    Quando acessa a funcionalidade de Backup
    Então deve ser possível visualizar todas as informações sobre backup

CT002 - Deve ser possível gerar backup
    Dado que usuário acessa a funcionalidade de Backup
    Quando clica na função Gerar Backup
    Então o backup deve ser gerado com informações da geração

CT003 - Deve ser possível enviar o backup
    Dado que usuário acessa a funcionalidade de Backup
    E tem backup gerado
    Quando acessa a funcionalidade de enviar backup
    Então o dispositivo deverá informar as opções para envio do backup
    