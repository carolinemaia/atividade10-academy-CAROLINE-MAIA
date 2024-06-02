*** Settings ***

Resource    ../../base.robot
Resource    ../utils/config.robot
Resource    ../utils//commons.robot

*** Variables ***
${CODIGO}               xpath=//android.widget.TextView[@text="Código"]
${CODIGO_CAMPO}         xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_codigo"]
${DESCRICAO}            xpath=//android.widget.TextView[@text="Descrição"]
${DESCRICAO_CAMPO}      xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_descricao"]
${UNIDADE}              xpath=//android.widget.TextView[@text="Unidade"]
${UNIDADE_CAMPO}        xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_unidade"]
${QUANTIDADE}           xpath=//android.widget.TextView[@text="Quantidade"]
${QUANTIDADE_CAMPO}     xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_quantidade"]
${VALOR_UNIT}           xpath=//android.widget.TextView[@text="Val.Unit."]
${VALOR_UNIT_CAMPO}     xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_valunit"]
${LOTE}                 xpath=//android.widget.TextView[@text="Lote"]
${LOTE_CAMPO}           xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_lote"]
${VALIDADE}             xpath=//android.widget.TextView[@text="Validade"]
${VALIDADE_DATA}        xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/data"]
${DATA_INSERIR}         xpath=//android.view.View[@content-desc="28 junho 2024"]
${DATA_CANCELAR}        xpath=//android.widget.Button[@resource-id="android:id/button2"]
${DATA_OK}              xpath=//android.widget.Button[@resource-id="android:id/button1"]
${SALVAR}               xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_gravar_assunto"]
${PRODUTO_ID}           xpath=(//android.widget.TextView[@text="ID"])[1]
${PRODUTO_NOME}         xpath=(//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/txt_descricao"])[1]



        

*** Keywords ***
Dado que o usuário acessa tela de cadastro de produto
    Espera elemento e clica    ${PRODUTO_NOVO}

Quando preencher os campos obrigatórios do novo produto
    Espera elemento e clica    ${DESCRICAO_CAMPO}
    Input Text    ${DESCRICAO_CAMPO}    PRODUTO AAA
    Espera elemento e clica    ${QUANTIDADE_CAMPO}
    Input Text    ${QUANTIDADE_CAMPO}    100
    Espera elemento e clica    ${VALOR_UNIT_CAMPO}
    Input Text    ${VALOR_UNIT_CAMPO}    10

Então o produto será cadastrado com sucesso
    Espera elemento e clica    ${SALVAR}
E o produto pode ser consultado na listagem de produtos na tela inicial
    Wait Until Keyword Succeeds    4    1    Element Should Be Visible    ${PRODUTO_NOME}
    


    

    
    
    

    