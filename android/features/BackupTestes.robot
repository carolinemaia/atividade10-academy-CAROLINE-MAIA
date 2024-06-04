*** Settings ***

Resource    ../../base.robot

Test Setup        Open App
Test Teardown     Teardown


*** Test Cases ***
CT001 - Deve ser possível acessar a funcionalidade de backup
    Dado que usuário acessa o MENU na tela inicial
    Quando o usuário acessa a funcionalidade de Backup
    Então deve ser possível visualizar todas as informações sobre backup

CT002 - Deve ser possível gerar backup
    Dado que usuário acessa a funcionalidade de Backup
    Quando o usuário clica na função Gerar Backup
    Então deve aparecer um alerta de Operação Concluida
    E o backup deve ser gerado com informações da geração

CT003 - Deve ser possível enviar o backup
    Dado que usuário acessa a funcionalidade de Backup
    E tem backup gerado
    Quando o usuário acessa a funcionalidade de enviar backup
    Então o aplicativo deverá informar as opções para envio do backup


    