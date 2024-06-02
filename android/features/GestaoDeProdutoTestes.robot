*** Settings ***

Resource    ../../base.robot

Test Setup        Open App
Test Teardown     Teardown


*** Test Cases ***
CT001 - Deve ser possivel cadastrar novo produto com sucesso
    Dado que o usuário acessa tela de cadastro de produto
    Quando preencher os campos obrigatórios do novo produto
    Então o produto será cadastrado com sucesso
    E o produto pode ser consultado na listagem de produtos na tela inicial

CT002 - Ao cadastrar o produto deve ser possível alterar a Validade
    Dado que o usuário acessa tela de cadastro de produto
    Quando preencher os campos obrigatórios do novo produto
    E alterar a validade do produto
    Então o produto será cadastrado com sucesso
    E o produto pode ser consultado na listagem de produtos na tela inicial

#Não é possivel utilizar o simbolo de alerta e o texto de campo obrigatorio pois não é inspencionado 
CT003 - Não deve ser possivel cadastrar novo produto sem informar os dados obrigatórios
    Dado que o usuário acessa tela de cadastro de produto
    Quando não preencher nenhum campo
    E acessar a funcionalidade salvar
    Então não será possível cadastrar produto permanecendo na tela de cadastro com os campos obrigatórios sinalizados



 


