*** Settings ***

Resource    ../../base.robot
Resource    ../utils/config.robot
Resource    ../utils//commons.robot

*** Variables ***
${CADASTRO_PRODUTO}          xpath=//android.widget.TextView[@text="Cadastro de Produtos"]
${PRODUTO_NOVO}              xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/Button1"]
${MENU}                      xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/Button3"]
${PRODUTO_PESQUISA}          xpath=//android.widget.ImageView[@content-desc="Pesquisar"]
${PRODUTO_CONSULTA}          xpath=//android.widget.EditText[@resource-id="android:id/search_src_text"]
${CONSULTA_FECHAR}           xpath=//android.widget.ImageView[@content-desc="Limpar consulta"]
${NAVEGAR_CIMA}              xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_menos"]
${NAVEGAR_BAIXO}             xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_mais"]

*** Keywords ***