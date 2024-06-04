*** Settings ***

Resource    ../../base.robot

Test Setup        Open App
Test Teardown     Teardown

##Cenarios de testes abaixo é necessário movimentação de produtos (cadastro, entradas e saídas) e também exportação de dados.
# necessário também deletar o produto criado para verificar se a exportação está atendendo aos requisitos
*** Test Cases ***
CT001 - Deve ser possivel acessar a funcionalidade de Importar Dados
    Dado que usuário acessa o MENU na tela inicial
    Quando usuario acessa a funcionalidade de Importar Dados
    Então deve ser possível visualizar todas as funcionalidade de Importar Dados

CT002 - Deve ser possivel restaurar dados de produtos
    Dado que possui arquivos de exportacão de produtos na pasta Estoque
    E o usuario acessa a funcionalidade de Importar Dados
    Quando o usuario executa a função de Restaurar Produtos
    Então o usuário deve visualizar mensagem de confirmação de exportação
    E ao acessar a pagina inicial poderá visualizar o produto restaurado através da importação

CT003 - Deve ser possivel restaurar dados de entradas
    Dado que possui arquivos de exportação de entradas na pasta Estoque
    E o usuario acessa a funcionalidade de Importar Dados
    Quando o usuario executa a função de Restaurar Entradas
    Então o usuário deve visualizar mensagem de confirmação de exportação

CT004 - Deve ser possivel restaurar dados de saídas
    Dado que possui arquivos de exportação de saídas na pasta Estoque
    E o usuario acessa a funcionalidade de Importar Dados
    Quando o usuario executa a função de Restaurar Saídas
    Então o usuário deve visualizar mensagem de confirmação de exportação

CT005 - Deve ser possivel restaurar dados de grupos
    Dado que o usuario acessa a funcionalidade de Importar Dados
    Quando o usuario executa a função de Restaurar Grupos
    Então o usuário deve visualizar mensagem de confirmação de exportação

CT006 - Não deve ser possivel restaurar arquivos diferente da funcionalidade selecionada
    Dado que possui arquivos de exportação de entradas na pasta Estoque
    E o usuario acessa a funcionalidade de Importar Dados
    Quando o usuario acessa a função de Restaurar Saídas
    E seleciona arquivo de exportação de entradas
    Então operação não deve ser concluída com alerta que o arquivo não é da funcionalidade selecionada

    
    




