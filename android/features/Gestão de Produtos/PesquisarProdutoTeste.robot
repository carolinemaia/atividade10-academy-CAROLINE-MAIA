*** Settings ***

Resource    ../../../base.robot

Test Setup        Open App
Test Teardown     Teardown


#necessário cadastrar produtos para executar os cenários abaixo
*** Test Cases ***
CT001 - Deve ser possivel pesquisar produto cadastrado
    Dado que possui vários produtos cadastrados
    Quando o usuário acessa funcionalidade de pesquisa de produto
    Então deve retornar resultado do produto pesquisado

CT002 - Deve ser possivel limpar o campo de pesquisa após digitar produto
    Dado que o usuário está na tela inicial
    E o usuário acessa funcionalidade de pesquisa de produto inserindo nome
    E acessa funcionalidade de limpar pesquisa
    Então o campo de busca deve está limpo

CT003 - Deve ser possivel sair do campo de busca clicando no X
    Dado que o usuário está na tela inicial
    E o usuário acessa funcionalidade de pesquisa de produto
    Quando o usuário acessa funcionalidade de limpar pesquisa
    Então a opção de digitar o produto deve ser finalizado
    
    

