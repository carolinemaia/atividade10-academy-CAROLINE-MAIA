*** Settings ***

Resource    ../../base.robot

Test Setup        Open App
Test Teardown     Teardown


*** Test Cases ***
CT001 - Deve ser possivel cadastrar novo produto com sucesso
    Dado que o usuário acessa tela de cadastro de produto
    Quando preencher os campos obrigatórios do novo produto
    Então o produto será cadastrado com sucesso

