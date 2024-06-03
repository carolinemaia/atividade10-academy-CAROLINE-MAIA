*** Settings ***

Resource    ../../base.robot
Resource    ../utils/config.robot
Resource    ../utils//commons.robot


*** Variables ***
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
${VALIDADE_DATA}        xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/data"]
${DATA_INSERIR}         xpath=//android.view.View[@content-desc="28 junho 2024"]
${DATA_CANCELAR}        xpath=//android.widget.Button[@resource-id="android:id/button2"]
${DATA_OK}              xpath=//android.widget.Button[@resource-id="android:id/button1"]
${PRODUTO_SALVAR}       xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_gravar_assunto"]
${PRODUTO_ID}           xpath=(//android.widget.TextView[@text="ID"])[1]
${PRODUTO_NOME}         xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/txt_descricao"]
${PRODUTO}              xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/textView3"]
${ESTOQUE_ENTRADA}      xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/entrada"]
${ESTOQUE_ADICIONA}     xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_qtdentrada"]
${ESTOQUE_SAIDA}        xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/saida"]
${ESTOQUE_DECREMENTA}    xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_qtdsaida"]
${valor}                80
${PRODUTO_QUANTIDADE}   xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/txt_quantidade"]
${QUANTIDADE_SALVAR}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_salvar"]
${EDITAR}               xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/editar"]
    
*** Keywords ***
Dado que o usuário acessa tela de cadastro de produto
    Espera elemento e clica    ${PRODUTO_NOVO}

Quando preencher os campos obrigatórios do novo produto
    Espera elemento e clica    ${DESCRICAO_CAMPO}
    Input Text    ${DESCRICAO_CAMPO}    PRODUTO AAC
    Espera elemento e clica    ${QUANTIDADE_CAMPO}
    Input Text    ${QUANTIDADE_CAMPO}    100
    Espera elemento e clica    ${VALOR_UNIT_CAMPO}
    Input Text    ${VALOR_UNIT_CAMPO}    10

Então o produto será cadastrado com sucesso
    Espera elemento e clica    ${PRODUTO_SALVAR}
E o produto pode ser consultado na listagem de produtos na tela inicial
    Espera elemento está visivel    ${PRODUTO_NOME}

E alterar a validade do produto
    Hide Keyboard
    Espera elemento e clica    ${VALIDADE_DATA}
    Espera elemento e clica    ${DATA_INSERIR}
    Click Element    ${DATA_OK}

Quando não preencher nenhum campo
    ${descricao_vazia}=  Get WebElement  ${DESCRICAO_CAMPO}
    Should Be Empty  ${descricao_vazia.text}
    
    ${descricao_vazia}=  Get WebElement  ${QUANTIDADE_CAMPO}
    Should Be Empty  ${descricao_vazia.text}

    ${descricao_vazia}=  Get WebElement  ${VALOR_UNIT_CAMPO}
    Should Be Empty  ${descricao_vazia.text}
  
E acessar a funcionalidade salvar produto
    Espera elemento e clica    ${PRODUTO_SALVAR}

Então não será possível cadastrar produto permanecendo na tela de cadastro com os campos obrigatórios sinalizados
    Espera elemento está visivel    ${PRODUTO}
    Espera elemento está visivel    ${DESCRICAO}
    Espera elemento está visivel    ${QUANTIDADE}
    Espera elemento está visivel    ${VALOR_UNIT}

Dado que possui produto cadastrado
    Produto cadastrado

E acessa funcionalidade de entrada de produtos
  
    Espera elemento e clica    ${ESTOQUE_ENTRADA}

Quando adiciona quantidade de produto no estoque  
    Espera elemento e clica    ${ESTOQUE_ADICIONA}
    Press Keycode    15
    Press Keycode    7

E acessar a funcionalidade salvar estoque
    Click Element    ${QUANTIDADE_SALVAR}

Então é possivel visualizar um aumento de quantidade do produto na pagina inicial
    Wait Until Element Is Visible    ${PRODUTO_QUANTIDADE}
    ${quantidade}=    Get Text    ${PRODUTO_QUANTIDADE}
    Should Be Equal As Strings    ${quantidade}    180.0   

E acessa funcionalidade de saida de produtos
    Espera elemento e clica    ${ESTOQUE_SAIDA}

Quando diminui quantidade de produto no estoque
    Espera elemento e clica    ${ESTOQUE_DECREMENTA}
    Press Keycode    15
    Press Keycode    7

Então é possivel visualizar uma diminuição de quantidade do produto na pagina inicial
    Wait Until Element Is Visible    ${PRODUTO_QUANTIDADE}
    ${quantidade}=    Get Text    ${PRODUTO_QUANTIDADE}
    Should Be Equal As Strings    ${quantidade}    20.0

E acessa funcionalidade de edição de produto
    Espera elemento e clica    ${EDITAR}

Então é possivel editar dados do produto
    Wait Until Element Is Visible    ${PRODUTO}

    Clear Text    ${DESCRICAO_CAMPO}
    Espera elemento e clica    ${DESCRICAO_CAMPO}
    Input Text    ${DESCRICAO_CAMPO}    PRODUTO BBC
    
    Clear Text    ${QUANTIDADE_CAMPO}
    Espera elemento e clica    ${QUANTIDADE_CAMPO}
    Input Text    ${QUANTIDADE_CAMPO}   50
    
    Clear Text    ${VALOR_UNIT_CAMPO}
    Espera elemento e clica    ${VALOR_UNIT_CAMPO}
    Input Text    ${VALOR_UNIT_CAMPO}   50

E é possível consultar as informações atualizadas na tela inicial
    Wait Until Element Is Visible    ${DESCRICAO_CAMPO}
    ${descricao_atualizada}=    Get Text    ${DESCRICAO_CAMPO}
    Should Be Equal As Strings    ${descricao_atualizada}    PRODUTO BBC

    Wait Until Element Is Visible    ${QUANTIDADE_CAMPO}
    ${quantidade_atualizada}=    Get Text    ${QUANTIDADE_CAMPO}
    Should Be Equal As Strings    ${quantidade_atualizada}    50
    
    Wait Until Element Is Visible    ${VALOR_UNIT_CAMPO}
    ${valor_atualizado}=    Get Text    ${VALOR_UNIT_CAMPO}
    Should Be Equal As Strings    ${valor_atualizado}    50





    



      
    
    

    
    
    

    