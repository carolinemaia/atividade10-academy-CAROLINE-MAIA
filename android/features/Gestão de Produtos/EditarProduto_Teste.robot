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

CT002 - Deve ser possivel editar validade do produto
    Dado que possui produto cadastrado
    E acessa funcionalidade de edição de produto
    Então é possível editar data de validade do produto ja cadastrado
    E é possível consultar a data atualizada na tela inicial




