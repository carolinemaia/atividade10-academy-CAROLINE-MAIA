*** Settings ***

Resource    ../../base.robot
Resource    ../utils/config.robot
Resource    ../utils/commons.robot


*** Variables ***
#atalhos 
${PRODUTO_NOVO}              id=br.com.pztec.estoque:id/Button1
${MENU}                      id=br.com.pztec.estoque:id/Button3

#pesquisaProduto
${PRODUTO_PESQUISA}          xpath=//android.widget.ImageView[@content-desc="Pesquisar"]
${CONSULTA_FECHAR}           xpath=//android.widget.ImageView[@content-desc="Limpar consulta"]
${CAMPO_PESQUISA}            xpath=//android.widget.EditText[@resource-id="android:id/search_src_text"]

#descricao
${CADASTRO_PRODUTO}          xpath=//android.widget.TextView[@text="Cadastro de Produtos"]
${DESCRICAO}                 xpath=//android.widget.TextView[@text="Descrição"]
${QUANTIDADE}                xpath=//android.widget.TextView[@text="Quantidade"]
${PRODUTO}                   id=br.com.pztec.estoque:id/textView3

#inserir/editar produto
${CODIGO_CAMPO}              xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_codigo"]
${DESCRICAO_CAMPO}           xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_descricao"]
${UNIDADE_CAMPO}             xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_unidade"]
${QUANTIDADE_CAMPO}          xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_quantidade"]
${VALOR_UNIT_CAMPO}          xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_valunit"]
${LOTE_CAMPO}                xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_lote"]
${DATA_INSERIR}              xpath=//android.view.View[@content-desc="28 junho 2024"]

#visualizar produto
${PRODUTO_COD}               xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/txt_codigo"]
${VALOR_UNIT}                xpath=//android.widget.TextView[@text="Val.Unit."]
${DATA}                      xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/data"]
${VALIDADE_DATA}             xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/txt_validade"]
${PRODUTO_ID}                xpath=(//android.widget.TextView[@text="ID"])[1]
${PRODUTO_NOME}              xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/txt_descricao"]

#botões
${DATA_CANCELAR}             id=android:id/button2
${BUTTON_OK}                 id=android:id/button1
${PRODUTO_SALVAR}            id=br.com.pztec.estoque:id/btn_gravar_assunto
${ESTOQUE_ENTRADA}           id=br.com.pztec.estoque:id/entrada
${ESTOQUE_SAIDA}             id=br.com.pztec.estoque:id/saida
${QUANTIDADE_SALVAR}         id=br.com.pztec.estoque:id/btn_salvar
${EDITAR}                    id=br.com.pztec.estoque:id/editar
${DELETE}                    id=br.com.pztec.estoque:id/deletar

#outras
${ESTOQUE_ADICIONA}          id=br.com.pztec.estoque:id/txt_qtdentrada
${ESTOQUE_DECREMENTA}        id=br.com.pztec.estoque:id/txt_qtdsaida
${PRODUTO_QUANTIDADE}        id=br.com.pztec.estoque:id/txt_quantidade
${PRODUTO_VALOR}             id=br.com.pztec.estoque:id/txt_valunit
${MENSAGEM}                  id=android:id/message
${VALOR_ATUAL}               id=br.com.pztec.estoque:id/txt_qtdatual

#inserindo valores
${numero_inserido}    2000
${valor}                80

    
*** Keywords ***
Dado que o usuário acessa tela de cadastro de produto
    Espera elemento e clica    ${PRODUTO_NOVO}

Quando preencher todos os campos do novo produto
    Novo produto com todos os campos    01    Pasta de Amendoin    g    15    65    001A

Quando preencher os campos obrigatórios do novo produto
    Produto somente com campos obrigatorios    Creatina Max    5    85  

Então o produto será cadastrado com sucesso
    Espera elemento e clica    ${PRODUTO_SALVAR}

E o produto pode ser consultado na listagem de produtos na tela inicial
    Espera elemento está visivel    ${PRODUTO_NOME}
    Element Should Contain Text     ${PRODUTO_COD}     01
    Element Should Contain Text     ${PRODUTO_NOME}    Pasta de Amendoin

E alterar a validade do produto
    Altera a validade

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
    Produto ja cadastrado    Produto AA1    100    5

E o usuário acessa funcionalidade de entrada de produtos
    Espera elemento e clica    ${ESTOQUE_ENTRADA}

Quando o usuário adiciona quantidade de produto no estoque  
    Espera elemento e clica    ${ESTOQUE_ADICIONA}
    Press Keycode    15
    Press Keycode    7

E acessar a funcionalidade salvar estoque
    Click Element    ${QUANTIDADE_SALVAR}

Então é possivel visualizar um aumento de quantidade do produto na pagina inicial
    Consultar dados atualizados do produto    ${PRODUTO_QUANTIDADE}    180.0 

E o usuário acessa funcionalidade de saida de produtos
    Espera elemento e clica    ${ESTOQUE_SAIDA}

Quando o usuário diminui quantidade de produto no estoque
    Decrementa estoque    80

Então é possivel visualizar uma diminuição de quantidade do produto na pagina inicial
    Consultar dados atualizados do produto    ${PRODUTO_QUANTIDADE}    20.0

E o usuário acessa funcionalidade de edição de produto
    Espera elemento e clica    ${EDITAR}

Então é possivel o usuário editar dados do produto
    Wait Until Element Is Visible    ${PRODUTO}

    Editar Produto    ${DESCRICAO_CAMPO}     PRODUTO BBC
    Editar Produto    ${QUANTIDADE_CAMPO}    50
    Editar Produto    ${VALOR_UNIT_CAMPO}    50

    Click Element    ${PRODUTO_SALVAR}

E é possível consultar as informações atualizadas na tela inicial
    Consultar dados atualizados do produto    ${PRODUTO_NOME}          PRODUTO BBC
    Consultar dados atualizados do produto    ${PRODUTO_QUANTIDADE}    50
    Consultar dados atualizados do produto    ${PRODUTO_VALOR}         50,00

Então é possível o usuário editar data de validade do produto ja cadastrado
    Hide Keyboard
    Altera a validade
    Click Element    ${PRODUTO_SALVAR}

E é possível consultar a data atualizada na tela inicial
    Espera elemento está visivel    ${VALIDADE_DATA}
    Consultar dados atualizados do produto    ${VALIDADE_DATA}    28/06/2024

Quando diminui quantidade de produto no estoque com numero maior que a quantidade atual
    Decrementa estoque    ${numero_inserido}    
    
Então uma mensagem com alerta que estoque está insuficiente deverá ser exibida não permitindo finalizar operação
    Espera elemento está visivel    ${VALOR_ATUAL}

    ${valor}=  Get Text  ${VALOR_ATUAL}
    ${valor}=  Convert To Integer  ${valor}
    Click Element    ${QUANTIDADE_SALVAR}
    Run Keyword If    ${numero_inserido} > ${valor}    Espera elemento está visivel    ${MENSAGEM}
    
E ao clicar em ok retorna para formulário
    Espera elemento e clica    ${BUTTON_OK}

Quando o usuário acessar a funcionalidade de delete
    Espera elemento e clica    ${DELETE}

Então aparecerá a opção de confirmar a operação
    Espera elemento está visivel    ${MENSAGEM}

E ao confirmar o produto não deverá constar na pagina inicial
    Click Element    ${BUTTON_OK}
    Wait Until Page Does Not Contain    ${PRODUTO_NOME}
    Page Should Not Contain Element     ${PRODUTO_NOME}  

Dado que possui vários produtos cadastrados
    Produto ja cadastrado    Produto 001    10    5
    Produto ja cadastrado    Produto 002    58    2
  
Quando o usuário acessa funcionalidade de pesquisa de produto
    Espera elemento e clica    ${PRODUTO_PESQUISA}
    Input Text    ${CAMPO_PESQUISA}    Produto 001
    Press Keycode    66

Então deve retornar resultado do produto pesquisado
    Wait Until Element Is Visible  ${PRODUTO_NOME}

    ${descr}=    Get Text    ${PRODUTO_NOME}

    Should Be Equal    ${descr}    Produto 001

Dado que o usuário está na tela inicial
    Espera elemento está visivel    ${CADASTRO_PRODUTO}
    Element Should Be Visible    ${MENU}
    Element Should Be Visible    ${PRODUTO_NOVO}

E o usuário acessa funcionalidade de pesquisa de produto inserindo nome
   Quando o usuário acessa funcionalidade de pesquisa de produto

E acessa funcionalidade de limpar pesquisa
    Click Element    ${CONSULTA_FECHAR}

Então o campo de busca deve está limpo
    Wait Until Element Is Visible    ${CAMPO_PESQUISA}
    ${busca}=  Get Text  ${CAMPO_PESQUISA}
    Should Not Contain    ${busca}    Produto 001

E o usuário acessa funcionalidade de pesquisa de produto
    Click Element    ${PRODUTO_PESQUISA}

Quando o usuário acessa funcionalidade de limpar pesquisa
    E acessa funcionalidade de limpar pesquisa

Então a opção de digitar o produto deve ser finalizado
    Page Should Not Contain Element    ${CAMPO_PESQUISA}   
    



    
    
    
    
    
    
    





    



      
    
    

    
    
    

    