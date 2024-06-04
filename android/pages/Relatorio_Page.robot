*** Settings ***

Resource    ../../base.robot
Resource    ../utils/config.robot
Resource    ../utils/commons.robot


*** Variables ***
${RELATÓRIO}                id=br.com.pztec.estoque:id/btn_relatorios
${INVENTÁRIO}               id=br.com.pztec.estoque:id/inventario
${REL_ENTRADA}              id=br.com.pztec.estoque:id/relentrada
${REL_SAIDA}                id=br.com.pztec.estoque:id/relsaida
${GERAR_PDF}                id=br.com.pztec.estoque:id/btn_gerar
${pdf_relat}                id=br.com.pztec.estoque:id/datafile
${VISUALIZAR_PDF}           id=br.com.pztec.estoque:id/btn_abrir
${ENVIAR_PDF}               id=br.com.pztec.estoque:id/btn_email
${DATA_INICIAL}             id=br.com.pztec.estoque:id/data1
${DATA_FINAL}               id=br.com.pztec.estoque:id/data2
${selecionar_data_ini}      xpath=//android.view.View[@content-desc="01 junho 2024"]
${selecionar-data-fin}      xpath=//android.view.View[@content-desc="15 junho 2024"]

*** Keywords ***
Quando usuario acessa a funcionalidade de Relatórios
    Espera elemento e clica    ${RELATÓRIO}

Então deve ser possível visualizar todas as opções de Relatórios
    Espera para visualizar o elemento    ${INVENTÁRIO}
    Element Should Be Visible            ${REL_ENTRADA}
    Element Should Be Visible            ${REL_SAIDA}

Dado que o usuario acessa a funcionalidade de Relatorios de Inventário de Estoque
    Dado que usuário acessa o MENU na tela inicial
    Quando usuario acessa a funcionalidade de Relatórios
    Espera elemento e clica    ${INVENTÁRIO}

Quando o usuario executa a função de gerar relatório em pdf
    Espera elemento e clica    ${GERAR_PDF}

Então o PDF deve ser gerado
    Espera elemento está visivel    ${pdf_relat}

E deve ser possivel visualizar o pdf
    Click Element    ${VISUALIZAR_PDF}
    Go Back

E deve ser possivel compartilhar PDF
    Espera elemento e clica    ${ENVIAR_PDF}
    Espera elemento está visivel    ${COMPARTILHAR}
    Go Back

Dado que o usuario acessa a funcionalidade de Relatorios de Entradas no Estoque
    Dado que usuário acessa o MENU na tela inicial
    Quando usuario acessa a funcionalidade de Relatórios
    Espera elemento e clica    ${REL_ENTRADA}

Quando o usuario informa o período de datas do relatório
    Selecionar Datas    ${selecionar_data_ini}    ${selecionar-data-fin}

E executa a função de gerar relatório em pdf
    Quando o usuario executa a função de gerar relatório em pdf

Dado que o usuario acessa a funcionalidade de Relatorios de Saídas do Estoque
    Dado que usuário acessa o MENU na tela inicial
    Quando usuario acessa a funcionalidade de Relatórios
    Espera elemento e clica    ${REL_SAIDA}

Quando executa a função de gerar relatório em pdf 
    Quando o usuario executa a função de gerar relatório em pdf

Então deve aparecer um alerta solicitando que informe as datas
    Espera elemento está visivel    ${MENSAGEM}
    Click Element    ${BUTTON_OK}


    

