*** Settings ***

Resource    ../../base.robot

Test Setup        Open App
Test Teardown     Teardown

*** Test Cases ***
CT001 - Deve ser possivel acessar funcionalidade de Relatórios
    Dado que usuário acessa o MENU na tela inicial
    Quando usuario acessa a funcionalidade de Relatórios
    Então deve ser possível visualizar todas as opções de Relatórios

CT002 - Deve ser possivel extrair relatório de Inventário de estoque
    Dado que o usuario acessa a funcionalidade de Relatorios de Inventário de Estoque
    Quando o usuario executa a função de gerar relatório em pdf
    Então o PDF deve ser gerado 
    E deve ser possivel visualizar o pdf
    E deve ser possivel compartilhar PDF

CT003 - Deve ser possivel extrair relatório de Entradas no Estoque
    Dado que o usuario acessa a funcionalidade de Relatorios de Entradas no Estoque
    Quando o usuario informa o período de datas do relatório
    E executa a função de gerar relatório em pdf
    Então o PDF deve ser gerado 
    E deve ser possivel visualizar o pdf
    E deve ser possivel compartilhar PDF

CT004 - Deve ser possivel extrair relatório de Saídas do Estoque
    Dado que o usuario acessa a funcionalidade de Relatorios de Saídas do Estoque
    Quando o usuario informa o período de datas do relatório
    E executa a função de gerar relatório em pdf
    Então o PDF deve ser gerado 
    E deve ser possivel visualizar o pdf
    E deve ser possivel compartilhar PDF

CT005 - Não deve ser possível extrair relatório de Entradas sem informas datas
    Dado que o usuario acessa a funcionalidade de Relatorios de Entradas no Estoque
    Quando executa a função de gerar relatório em pdf 
    Então deve aparecer um alerta solicitando que informe as datas

CT006 - Não deve ser possível extrair relatório de Saídas sem informas datas
    Dado que o usuario acessa a funcionalidade de Relatorios de Saídas do Estoque
    Quando executa a função de gerar relatório em pdf 
    Então deve aparecer um alerta solicitando que informe as datas
