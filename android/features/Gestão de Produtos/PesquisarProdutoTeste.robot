*** Settings ***

Resource    ../../../base.robot

Test Setup        Open App
Test Teardown     Teardown


*** Test Cases ***
CT001 - Deve ser possivel pesquisar usuario cadastrado
    Dado que possui vários produtos cadastrados
    Quando acessa funcionalidade de pesquisa de produto
    Então deve retornar resultado do produto pesquisado

CT002 - Deve ser possivel limpar o campo de pesquisa após dgitar produto
    Dado que o usuário está na tela inicial
    E acessa funcionalidade de pesquisa de produto inserindo nome
    E acessa funcionalidade de limpar pesquisa
    Então o campo de busca deve está limpo

CT003 - Deve ser possivel sair do campo de busca clicando no X
    Dado que o usuário está na tela inicial
    E acessa funcionalidade de pesquisa de produto
    Quando acessa funcionalidade de limpar pesquisa
    Então a opção de digitar o produto deve ser finalizado
    
    

