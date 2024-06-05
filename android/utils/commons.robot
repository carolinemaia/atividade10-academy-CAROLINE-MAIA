*** Settings ***

Resource    ../../base.robot

*** Keywords ***
Espera elemento está visivel
    [Arguments]    ${elemento}
    Wait Until Element Is Visible    ${elemento}
    Element Should Be Visible        ${elemento}

Espera elemento e clica
    [Arguments]    ${elemento}
    Wait Until Element Is Visible    ${elemento}    10
    Click Element                    ${elemento}    

Clica e Input Texto
    [Arguments]    ${elemento}    ${elemento2}
    Wait Until Element Is Visible    ${elemento}
    Click Element        ${elemento}
    Input Text           ${elemento}    ${elemento2}

Espera para visualizar o elemento
    [Arguments]    ${elemento}
    Wait Until Keyword Succeeds    4    1    Element Should Be Visible    ${elemento}

Cadastrar mais de um produto
    [Arguments]    ${cod}    ${des}    ${uni}    ${qtd}    ${val}    ${lot}
    Dado que o usuário acessa tela de cadastro de produto
    Novo produto com todos os campos    ${cod}    ${des}    ${uni}    ${qtd}    ${val}    ${lot}
    Então o produto será cadastrado com sucesso

Altera a validade
    Hide Keyboard
    Espera elemento e clica    ${DATA}
    Espera elemento e clica    ${DATA_INSERIR}
    Click Element    ${BUTTON_OK}

Decrementa estoque
    [Arguments]    ${element}
    Espera elemento e clica    ${ESTOQUE_DECREMENTA}
    Input Text    ${ESTOQUE_DECREMENTA}    ${element}

Novo produto com todos os campos
    [Arguments]    ${cod}    ${des}    ${uni}    ${qtd}    ${val}    ${lot}
    Espera elemento e clica    ${CODIGO_CAMPO}
    Input Text    ${CODIGO_CAMPO}    ${cod}

    Espera elemento e clica    ${DESCRICAO_CAMPO}
    Input Text    ${DESCRICAO_CAMPO}    ${des}

    Espera elemento e clica    ${UNIDADE_CAMPO}
    Input Text    ${UNIDADE_CAMPO}    ${uni}

    Espera elemento e clica    ${QUANTIDADE_CAMPO}
    Input Text    ${QUANTIDADE_CAMPO}    ${qtd}

    Espera elemento e clica    ${VALOR_UNIT_CAMPO}
    Input Text    ${VALOR_UNIT_CAMPO}    ${val}

    Espera elemento e clica    ${LOTE_CAMPO}
    Input Text    ${LOTE_CAMPO}    ${lot}

Produto somente com campos obrigatorios
    
    [Arguments]    ${des}    ${qtd}    ${val}
    Wait Until Keyword Succeeds    8    1    Click Element    ${DESCRICAO_CAMPO}
    Input Text    ${DESCRICAO_CAMPO}    ${des}
    
    Espera elemento e clica    ${QUANTIDADE_CAMPO}
    Input Text    ${QUANTIDADE_CAMPO}    ${qtd}

    Espera elemento e clica    ${VALOR_UNIT_CAMPO}
    Input Text    ${VALOR_UNIT_CAMPO}    ${val}
    

Produto ja cadastrado
    Espera elemento e clica    ${PRODUTO_NOVO}
    [Arguments]    ${des}    ${qtd}    ${val}
    Produto somente com campos obrigatorios    ${des}    ${qtd}    ${val}
    Click Element    ${PRODUTO_SALVAR}

Acessar pasta Estoque
    Swipe By Percent    40    80    40    20
    Espera elemento e clica    ${PASTA_ESTOQUE}

Selecionar Datas
    [Arguments]    ${data1}    ${data2}
    Espera elemento e clica    ${DATA_INICIAL}
    Espera elemento e clica    ${data1}
    Click Element    ${BUTTON_OK}
    Espera elemento e clica    ${DATA_FINAL}
    Espera elemento e clica    ${data2}
    Click Element    ${BUTTON_OK}

Editar Produto
    [Arguments]    ${CAMPO}    ${element}
    Clear Text    ${CAMPO}
    Espera elemento e clica    ${CAMPO}
    Input Text    ${CAMPO}    ${element}

Consultar dados atualizados do produto
    [Arguments]    ${CAMPO}    ${element}      
    Wait Until Element Is Visible    ${CAMPO}
    ${dado_atualizado}=    Get Text    ${CAMPO}
    Should Be Equal As Strings    ${dado_atualizado}    ${element}




    
