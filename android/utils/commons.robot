*** Settings ***

Resource    ../../base.robot

*** Keywords ***
Espera elemento está visivel
    [Arguments]    ${elemento}
    Wait Until Element Is Visible    ${elemento}
    Element Should Be Visible        ${elemento}

Espera elemento e clica
    [Arguments]    ${elemento}
    Wait Until Element Is Visible    ${elemento}
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
    Espera elemento e clica    ${PRODUTO_NOVO}
    Novo produto com todos os campos    ${cod}    ${des}    ${uni}    ${qtd}    ${val}    ${lot}
    Click Element    ${PRODUTO_SALVAR}

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
    Espera elemento e clica    ${DESCRICAO_CAMPO}
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



    
