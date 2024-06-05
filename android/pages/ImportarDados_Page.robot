*** Settings ***

Resource    ../../base.robot
Resource    ../utils/config.robot
Resource    ../utils/commons.robot


*** Variables ***
${IMPORTAR}              id=br.com.pztec.estoque:id/btn_importar
${RESTAURAR_PRODUTOS}    id=br.com.pztec.estoque:id/btn_produtos
${RESTAURAR_ENTRADAS}    id=br.com.pztec.estoque:id/btn_entradas
${RESTAURAR_SAIDAS}      id=br.com.pztec.estoque:id/btn_saidas
${RESTAURAR_GRUPOS}      id=br.com.pztec.estoque:id/btn_grupos
${PASTA_ESTOQUE}         xpath=//android.widget.TextView[@resource-id="android:id/text1" and @text="Estoque"]
#arquivos
${import_prod}           xpath=//android.widget.TextView[@resource-id="android:id/text1" and @text="produtos.csv"]
${import_entrad}         xpath=//android.widget.TextView[@resource-id="android:id/text1" and @text="entradas.csv"]
${import_saidas}         xpath=//android.widget.TextView[@resource-id="android:id/text1" and @text="saidas.csv"]
${import_grupos}         xpath=//android.widget.TextView[@resource-id="android:id/text1" and @text="grupos.csv"]

*** Keywords ***
Quando usuario acessa a funcionalidade de Importar Dados
    Espera elemento e clica   ${IMPORTAR}

Então deve ser possível visualizar todas as funcionalidade de Importar Dados
    Espera elemento está visivel    ${RESTAURAR_PRODUTOS}
    Espera elemento está visivel    ${RESTAURAR_ENTRADAS}
    Espera elemento está visivel    ${RESTAURAR_SAIDAS}
    Espera elemento está visivel    ${RESTAURAR_GRUPOS}

Dado que possui arquivos de exportacão de produtos na pasta Estoque
    Produto ja cadastrado    Produto 001    10    2
    E o usuário acessa a funcionalidade de Exportar Dados
    Go Back
    Go Back
    Espera elemento e clica    ${DELETE}
    Espera elemento e clica    ${BUTTON_OK}
    Dado que usuário acessa o MENU na tela inicial

E o usuario acessa a funcionalidade de Importar Dados 
    Espera elemento e clica    ${IMPORTAR}

Quando o usuario executa a função de Restaurar Produtos
    Espera elemento e clica    ${RESTAURAR_PRODUTOS}
    Acessar pasta Estoque
    Espera elemento e clica    ${import_prod}

Então o usuário deve visualizar mensagem de confirmação de exportação
    Espera elemento está visivel    ${MENSAGEM}
    Click Element    ${BUTTON_OK}
    Espera elemento está visivel    ${MENSAGEM}
    Click Element    ${BUTTON_OK}

E ao acessar a pagina inicial poderá visualizar o produto restaurado através da importação
    Go Back
    Go Back
    Espera elemento está visivel    ${PRODUTO_NOME}
    ${descr}=    Get Text    ${PRODUTO_NOME}
    Should Be Equal    ${descr}    Produto 001

Dado que possui arquivos de exportação de entradas na pasta Estoque
    Produto ja cadastrado    Produto 001    100    20
    E o usuário acessa funcionalidade de entrada de produtos
    Quando o usuário adiciona quantidade de produto no estoque
    Click Element    ${QUANTIDADE_SALVAR}
    E o usuário acessa a funcionalidade de Exportar Dados
    Espera elemento está visivel    ${GERAR_EXPORTACAO}
    Go Back   


Quando o usuario executa a função de Restaurar Entradas
    Espera elemento e clica    ${RESTAURAR_ENTRADAS}
    Acessar pasta Estoque
    Espera elemento e clica    ${import_entrad}

Dado que possui arquivos de exportação de saídas na pasta Estoque
    Produto ja cadastrado    Produto 001    100    20
    E o usuário acessa funcionalidade de saida de produtos
    Quando o usuário diminui quantidade de produto no estoque
    Click Element    ${QUANTIDADE_SALVAR}
    E o usuário acessa a funcionalidade de Exportar Dados
    Go Back

Quando o usuario executa a função de Restaurar Saídas
    Espera elemento e clica    ${RESTAURAR_SAIDAS}
    Acessar pasta Estoque
    Espera elemento e clica    ${import_saidas}

Dado que o usuario acessa a funcionalidade de Importar Dados
    Espera elemento e clica    ${MENU}
    E o usuario acessa a funcionalidade de Importar Dados

Quando o usuario executa a função de Restaurar Grupos 
    Espera elemento e clica    ${RESTAURAR_GRUPOS}
    Acessar pasta Estoque
    Espera elemento e clica    ${import_grupos}

Quando o usuario acessa a função de Restaurar Saídas
    Espera elemento e clica    ${RESTAURAR_SAIDAS}

E seleciona arquivo de exportação de entradas
    Acessar pasta Estoque
    Espera elemento e clica    ${import_entrad}

Então operação não deve ser concluída com alerta que o arquivo não é da funcionalidade selecionada
    Espera elemento está visivel    ${MENSAGEM}
    Espera elemento e clica         ${BUTTON_OK}
    Espera elemento está visivel    ${RESTAURAR_PRODUTOS}
    Espera elemento está visivel    ${RESTAURAR_ENTRADAS}
    Espera elemento está visivel    ${RESTAURAR_SAIDAS}
    Espera elemento está visivel    ${RESTAURAR_GRUPOS}






    






     


