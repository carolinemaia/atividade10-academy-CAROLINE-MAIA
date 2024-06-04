*** Settings ***

Resource    ../../base.robot
Resource    ../utils/config.robot
Resource    ../utils/commons.robot


*** Variables ***
${RESTORE}                          xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_restore"]
${TEXT_RESTORE}                     xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/lbl_mensagem"]
${SELECIONAR_ARQUIVO_RESTORE}       xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_procurar"]
${ALERTA_TITULO}                    xpath=//android.widget.TextView[@resource-id="android:id/alertTitle"]
${ESTOQUE_ARQUIVO}                  xpath=//android.widget.TextView[@resource-id="android:id/text1" and @text="Estoque"]
${bkp_arq}                          xpath=//android.widget.TextView[@resource-id="android:id/text1" and @text="APP_20240603.bkp"]
${arq_pdf}                          xpath=//android.widget.TextView[@resource-id="android:id/text1" and @text="inventario.pdf"]

*** Keywords ***
Quando acessa a funcionalidade de Restore
    Espera elemento e clica    ${RESTORE}

Então deve ser possível visualizar todas as informações sobre Restore
    Espera elemento está visivel     ${TEXT_RESTORE}
    Element Should Be Visible        ${SELECIONAR_ARQUIVO_RESTORE}

Dado que usuario possui backup realizado
    Dado que usuário acessa a funcionalidade de Backup
    Quando clica na função Gerar Backup
    Wait Until Keyword Succeeds    5    1    Element Should Be Visible    ${OPERACAO_CONCLUIDA}
    Click Element    ${BUTTON_OK}
    Go Back

E que usuário acessa a funcionalidade de Restore
    Quando acessa a funcionalidade de Restore

Quando clica na função de Selecionar arquivo
    Espera elemento e clica    ${SELECIONAR_ARQUIVO_RESTORE}

Então deve ser possivel selecionar arquivo na pasta estoque
    Espera elemento está visivel    ${ALERTA_TITULO}
    Swipe By Percent    40    80    40    20
    Espera elemento e clica    ${ESTOQUE_ARQUIVO}

E deve ser possivel visualizar os arquivos de backup armazenados
    Espera elemento está visivel    ${ALERTA_TITULO}
    Espera elemento está visivel    ${bkp_arq}

