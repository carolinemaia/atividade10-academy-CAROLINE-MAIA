*** Settings ***

Resource    ../../../base.robot

Test Setup        Open App
Test Teardown     Teardown


*** Test Cases ***

##para executar cenários de testes abaixo necessário cadastrar produto
CT001 - Deve ser possivel acrescentar quantidade de produto cadastrado
    Dado que possui produto cadastrado
    E o usuário acessa funcionalidade de entrada de produtos
    Quando o usuário adiciona quantidade de produto no estoque
    E acessar a funcionalidade salvar estoque
    Então é possivel visualizar um aumento de quantidade do produto na pagina inicial

CT002 - Deve ser possível decrementar quantidade de produto cadastrado
    Dado que possui produto cadastrado
    E o usuário acessa funcionalidade de saida de produtos
    Quando o usuário diminui quantidade de produto no estoque
    E acessar a funcionalidade salvar estoque
    Então é possivel visualizar uma diminuição de quantidade do produto na pagina inicial

CT003 - Não deve ser possível o estoque ficar com quantidade negativa
    Dado que possui produto cadastrado
    E o usuário acessa funcionalidade de saida de produtos
    Quando diminui quantidade de produto no estoque com numero maior que a quantidade atual
    Então uma mensagem com alerta que estoque está insuficiente deverá ser exibida não permitindo finalizar operação
    E ao clicar em ok retorna para formulário
