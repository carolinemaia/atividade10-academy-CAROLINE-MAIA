*** Settings ***

Resource    ../../../base.robot

Test Setup        Open App
Test Teardown     Teardown


*** Test Cases ***

CT001 - Deve ser possivel editar quantidade de estoque
    Dado que possui produto cadastrado
    E acessa funcionalidade de edição de produto
    Então é possivel editar dados do produto
    E é possível consultar as informações atualizadas na tela inicial



