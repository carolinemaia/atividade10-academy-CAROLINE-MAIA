*** Settings ***

Resource    ../../base.robot

Test Setup        Open App
Test Teardown     Teardown


*** Test Cases ***
CT001 - Deve ser possivel cadastrar produtos com sucesso
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
    E acessar a funcionalidade salvar produto
    Então não será possível cadastrar produto permanecendo na tela de cadastro com os campos obrigatórios sinalizados

CT004 - Deve ser possivel acrescentar quantidade de produto cadastrado
    Dado que possui produto cadastrado
    E acessa funcionalidade de entrada de produtos
    Quando adiciona quantidade de produto no estoque
    E acessar a funcionalidade salvar estoque
    Então é possivel visualizar um aumento de quantidade do produto na pagina inicial

CT005 - Deve ser possível decrementar quantidade de produto cadastrado
    Dado que possui produto cadastrado
    E acessa funcionalidade de saida de produtos
    Quando diminui quantidade de produto no estoque
    E acessar a funcionalidade salvar estoque
    Então é possivel visualizar uma diminuição de quantidade do produto na pagina inicial

CT006 - Deve ser possivel editar quantidade de estoque
    Dado que possui produto cadastrado
    E acessa funcionalidade de edição de produto
    Então é possivel editar dados do produto
    E as informacoes do produto



    

 


