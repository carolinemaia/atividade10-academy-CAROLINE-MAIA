*** Settings ***

Resource    ../../base.robot
Resource    ../utils/config.robot
Resource    ../utils/commons.robot


*** Variables ***
${BACKUP}                xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_backup"]
${GERAR_BACKUP}          xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_gerar"]
${ENVIAR_BACKUP}         xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_send"]
${DADOS_BACKUP}          xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/datafile"]
${TEXT_BACKUP}           xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/textView4"]
${OPERACAO_CONCLUIDA}    xpath=//android.widget.TextView[@resource-id="android:id/alertTitle"]
${COMPARTILHAR}          xpath=//android.widget.TextView[@resource-id="android:id/title"]
${ARQUIVO_BACKUP}        xpath=//android.widget.LinearLayout[@resource-id="android:id/content_preview_file_layout"]


*** Keywords ***
Dado que usuário acessa o MENU na tela inicial
    Espera elemento e clica    ${MENU}

Quando acessa a funcionalidade de Backup
    Espera elemento e clica    ${BACKUP}

Então deve ser possível visualizar todas as informações sobre backup
    Wait Until Element Is Visible    ${GERAR_BACKUP}
    Element Should Be Visible    ${GERAR_BACKUP}
    Element Should Be Visible    ${ENVIAR_BACKUP}
    Element Should Be Visible    ${DADOS_BACKUP}
    Element Should Be Visible    ${TEXT_BACKUP}

Dado que usuário acessa a funcionalidade de Backup
    Dado que usuário acessa o MENU na tela inicial
    Quando acessa a funcionalidade de Backup

Quando clica na função Gerar Backup
    Espera elemento e clica    ${GERAR_BACKUP}

Então deve aparecer um alerta de Operação Concluida
    Espera elemento está visivel    ${OPERACAO_CONCLUIDA}
    Click Element    ${BUTTON_OK}    

E o backup deve ser gerado com informações da geração
    Espera para visualizar o elemento    ${DADOS_BACKUP}

E tem backup gerado
    Espera para visualizar o elemento    ${DADOS_BACKUP}

Quando acessa a funcionalidade de enviar backup
    Click Element    ${ENVIAR_BACKUP}

Então o aplicativo deverá informar as opções para envio do backup
    Espera para visualizar o elemento    ${COMPARTILHAR}
    Element Should Be Visible    ${ARQUIVO_BACKUP}
    Go Back
    