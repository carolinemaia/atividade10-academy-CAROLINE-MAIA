*** Settings ***

Resource    ../../../base.robot

Test Setup        Open App
Test Teardown     Teardown


*** Test Cases ***

CT001 - Deve ser possivel acrescentar quantidade de produto cadastrado
    Dado que possui produto cadastrado
    E acessa funcionalidade de entrada de produtos
    Quando adiciona quantidade de produto no estoque
    E acessar a funcionalidade salvar estoque
    Então é possivel visualizar um aumento de quantidade do produto na pagina inicial

CT002 - Deve ser possível decrementar quantidade de produto cadastrado
    Dado que possui produto cadastrado
    E acessa funcionalidade de saida de produtos
    Quando diminui quantidade de produto no estoque
    E acessar a funcionalidade salvar estoque
    Então é possivel visualizar uma diminuição de quantidade do produto na pagina inicial