*** Settings ***

Resource    ../../../base.robot

Test Setup        Open App
Test Teardown     Teardown


*** Test Cases ***
CT001 - Deve ser possivel cadastrar produtos com sucesso
    Dado que o usuário acessa tela de cadastro de produto
    Quando preencher todos os campos do novo produto
    Então o produto será cadastrado com sucesso
    E o produto pode ser consultado na listagem de produtos na tela inicial

CT002 - Ao cadastrar o produto deve ser possível selecionar uma data de Validade
    Dado que o usuário acessa tela de cadastro de produto
    Quando preencher todos os campos do novo produto
    E alterar a validade do produto
    Então o produto será cadastrado com sucesso
    E o produto pode ser consultado na listagem de produtos na tela inicial

#Não é possivel utilizar o simbolo de alerta e o texto de campo obrigatorio pois não é inspencionado 
CT003 - Não deve ser possivel cadastrar novo produto sem informar os dados obrigatórios
    Dado que o usuário acessa tela de cadastro de produto
    Quando não preencher nenhum campo
    E acessar a funcionalidade salvar produto
    Então não será possível cadastrar produto permanecendo na tela de cadastro com os campos obrigatórios sinalizados

CT004 - Cadastrar mais de um produto
    [Template]    Cadastrar mais de um produto
    FOR    ${counter}    IN RANGE    1    
        001    Creatina    g    10    85    001A
        002    Whey        g    8    220    001B
        003    Colageno    g    10    35    001C
                
    END

    
    




    

 


