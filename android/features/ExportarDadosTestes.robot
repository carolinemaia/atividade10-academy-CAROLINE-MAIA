*** Settings ***

Resource    ../../base.robot

Test Setup        Open App
Test Teardown     Teardown


*** Test Cases ***

##Cenarios de testes abaixo é necessário movimentação de produtos: cadastro, entradas e saídas. 
CT001 - Deve ser possivel acessar a funcionalidade de Exportar Dados
    Dado que usuário acessa o MENU na tela inicial
    Quando usuario acessa a funcionalidade de Exportar Dados
    Então deve ser possível visualizar todas as informações sobre exportar Dados

CT002 - Deve ser possivel exportar arquivo de produto gerado
    Dado que possui produto cadastrado
    E o usuário acessa a funcionalidade de Exportar Dados
    Quando clica na função Exportar Dados
    Então deve aparecer um alerta de Operação Concluida
    E o arquivo exportado deve ficar visivel

CT003 - Deve ser possivel enviar o arquivo de produto exportado
    Dado que possui produto cadastrado
    E o usuário acessa a funcionalidade de Exportar Dados
    E possui arquivos de produto para serem exportados
    Quando clica em enviar arquivo de produto
    Então o aplicativo deverá informar as opções para envio do arquivo exportado

CT004 - Deve ser possivel exportar arquivo de entradas
    Dado que possui movimentação de entrada de estoque
    E o usuário acessa a funcionalidade de Exportar Dados
    E possui arquivos de entrada para serem exportados
    Quando clica em enviar arquivo de entrada
    Então o aplicativo deverá informar as opções para envio do arquivo exportado

CT005 - Deve ser possivel exportar arquivo de saídas
    Dado que possui movimentação de saída de estoque
    E o usuário acessa a funcionalidade de Exportar Dados
    E possui arquivos de saída para serem exportados
    Quando clica em enviar arquivo de saída
    Então o aplicativo deverá informar as opções para envio do arquivo exportado

CT006 - Deve ser possível exportar arquivos de grupos
    Dado que o usuario acessa a funcionalidade de Exportar Dados
    E possui arquivos de grupos para serem exportados
    Quando clica em enviar arquivo de grupos
    Então o aplicativo deverá informar as opções para envio do arquivo exportado




    
