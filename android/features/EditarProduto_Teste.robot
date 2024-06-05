*** Settings ***

Resource    ../../base.robot

Test Setup        Open App
Test Teardown     Teardown


*** Test Cases ***

#necessário cadastrar produtos para executar os cenários abaixo
CT001 - Deve ser possivel editar informações do produto
    Dado que possui produto cadastrado
    E o usuário acessa funcionalidade de edição de produto
    Então é possivel o usuário editar dados do produto
    E é possível consultar as informações atualizadas na tela inicial

CT002 - Deve ser possivel editar validade do produto
    Dado que possui produto cadastrado
    E o usuário acessa funcionalidade de edição de produto
    Então é possível o usuário editar data de validade do produto ja cadastrado
    E é possível consultar a data atualizada na tela inicial

CT003 - Deve ser possível deletar produto cadastrado
    Dado que possui produto cadastrado
    Quando o usuário acessar a funcionalidade de delete
    Então aparecerá a opção de confirmar a operação
    E ao confirmar o produto não deverá constar na pagina inicial




