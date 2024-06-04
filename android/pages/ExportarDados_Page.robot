*** Settings ***

Resource    ../../base.robot
Resource    ../utils/config.robot
Resource    ../utils/commons.robot


*** Variables ***
${EXPORTAR}             xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_exportar"]
${EXPORTAR_CSV}         xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/textView4"]
${GERAR_EXPORTACAO}     xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_gerar"]
${ENVIAR_PROD}          xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_prod"]
${produto_csv}          xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/datafileprod"]
${arquivo_compart}      xpath=//android.widget.TextView[@resource-id="android:id/content_preview_filename"]
${entrada_csv}          xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/datafileent"]
${ENVIAR_ENTRADA}       xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_ent"]
${saida_csv}            xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/datafilesai"]
${ENVIAR_SAIDA}         xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_sai"]

*** Keywords ***
Quando usuario acessa a funcionalidade de Exportar Dados
    Espera elemento e clica    ${EXPORTAR}

Então deve ser possível visualizar todas as informações sobre exportar Dados
    Espera elemento está visivel    ${EXPORTAR_CSV}
    Espera elemento está visivel    ${GERAR_EXPORTACAO}
    Espera elemento está visivel    ${ENVIAR_PROD}

E o usuário acessa a funcionalidade de Exportar Dados
    Espera elemento e clica    ${MENU}
    Espera elemento e clica    ${EXPORTAR}
    Espera elemento e clica    ${GERAR_EXPORTACAO}
    Espera elemento e clica    ${BUTTON_OK}

Quando clica na função Exportar Dados
    Espera elemento e clica    ${GERAR_EXPORTACAO}

E o arquivo exportado deve ficar visivel 
    Espera elemento está visivel    ${produto_csv}

Dado que o usuario acessa a funcionade de Exportar Dados
    E o usuário acessa a funcionalidade de Exportar Dados

E possui arquivos de produto para serem exportados
    Espera elemento está visivel    ${produto_csv}

 Quando clica em enviar arquivo de produto
    Click Element    ${ENVIAR_PROD}

Então o aplicativo deverá informar as opções para envio do arquivo exportado
    Espera elemento está visivel    ${COMPARTILHAR}
    Espera elemento está visivel    ${arquivo_compart}
    Go Back

Dado que possui movimentação de entrada de estoque
    Dado que possui produto cadastrado
    E acessa funcionalidade de entrada de produtos
    Quando adiciona quantidade de produto no estoque
    E acessar a funcionalidade salvar estoque

E possui arquivos de entrada para serem exportados
    Espera elemento está visivel    ${entrada_csv}
    
Quando clica em enviar arquivo de entrada
    Click Element    ${ENVIAR_ENTRADA}

Dado que possui movimentação de saída de estoque
    Dado que possui produto cadastrado
    E acessa funcionalidade de saida de produtos
    Quando diminui quantidade de produto no estoque
    E acessar a funcionalidade salvar estoque

E possui arquivos de saída para serem exportados
    Espera elemento está visivel    ${saida_csv}

Quando clica em enviar arquivo de saída
    Click Element    ${ENVIAR_SAIDA}


    









