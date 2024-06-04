*** Settings ***

Resource    ../../base.robot
Resource    ../utils/config.robot
Resource    ../utils/commons.robot


*** Variables ***
${RESTORE}                          xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_restore"]
${RESTAURAR_BACKUP}                 xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/textView3"]
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
    Espera elemento está visivel    ${RESTAURAR_BACKUP}
    Element Should Be Visible    ${TEXT_RESTORE}
    Element Should Be Visible    ${SELECIONAR_ARQUIVO_RESTORE}

Dado que usuário acessa a funcionalidade de Restore
    Espera elemento e clica    ${MENU}
    Espera elemento e clica    ${RESTORE}

Quando clica na função de Selecionar arquivo
    Espera elemento e clica    ${SELECIONAR_ARQUIVO_RESTORE}

Então deve ser possivel selecionar arquivo de estoque
    Espera elemento está visivel    ${ALERTA_TITULO}
    Swipe By Percent    40    80    40    20
    Espera elemento e clica    ${ESTOQUE_ARQUIVO}

E deve ser possivel visualizar os arquivos de backup armazenados
    Espera elemento está visivel    ${ALERTA_TITULO}
    Espera elemento está visivel    ${bkp_arq}
    Espera elemento está visivel    ${arq_pdf}

