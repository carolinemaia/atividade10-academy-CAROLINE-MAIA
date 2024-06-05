*** Settings ***

Resource    ../../base.robot
Resource    ../utils/config.robot
Resource    ../utils/commons.robot


*** Variables ***
${EXPORTAR}             id=br.com.pztec.estoque:id/btn_exportar
${GERAR_EXPORTACAO}     id=br.com.pztec.estoque:id/btn_gerar
${ENVIAR_PROD}          id=br.com.pztec.estoque:id/btn_prod
${produto_csv}          id=br.com.pztec.estoque:id/datafileprod
${arquivo_compart}      id=android:id/content_preview_filename
${entrada_csv}          id=br.com.pztec.estoque:id/datafileent
${ENVIAR_ENTRADA}       id=br.com.pztec.estoque:id/btn_ent
${saida_csv}            id=br.com.pztec.estoque:id/datafilesai
${ENVIAR_SAIDA}         id=br.com.pztec.estoque:id/btn_sai
${grupo_csv}            id=br.com.pztec.estoque:id/datafilegrupo
${ENVIAR_GRUPO}         id=br.com.pztec.estoque:id/btn_grupo

*** Keywords ***
Quando usuario acessa a funcionalidade de Exportar Dados
    Espera elemento e clica    ${EXPORTAR}

Então deve ser possível visualizar todas as informações sobre exportar Dados
    Espera elemento está visivel    ${TEXT_BACKUP}
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

Dado que o usuario acessa a funcionalidade de Exportar Dados
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
    E o usuário acessa funcionalidade de entrada de produtos
    Quando o usuário adiciona quantidade de produto no estoque
    E acessar a funcionalidade salvar estoque

E possui arquivos de entrada para serem exportados
    Espera elemento está visivel    ${entrada_csv}
    
Quando clica em enviar arquivo de entrada
    Click Element    ${ENVIAR_ENTRADA}

Dado que possui movimentação de saída de estoque
    Dado que possui produto cadastrado
    E o usuário acessa funcionalidade de saida de produtos
    Quando o usuário diminui quantidade de produto no estoque
    E acessar a funcionalidade salvar estoque

E possui arquivos de saída para serem exportados
    Espera elemento está visivel    ${saida_csv}

Quando clica em enviar arquivo de saída
    Wait Until Keyword Succeeds    10    1    Click Element    ${ENVIAR_SAIDA}

E possui arquivos de grupos para serem exportados
    Espera elemento está visivel    ${grupo_csv}

Quando clica em enviar arquivo de grupos
    Click Element    ${ENVIAR_GRUPO}
    


    









