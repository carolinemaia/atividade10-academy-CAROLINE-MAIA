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

Produto cadastrado
    Espera elemento e clica    ${PRODUTO_NOVO}
    Espera elemento e clica    ${DESCRICAO_CAMPO}
    Input Text    ${DESCRICAO_CAMPO}    PRODUTO AAC
    Espera elemento e clica    ${QUANTIDADE_CAMPO}
    Input Text    ${QUANTIDADE_CAMPO}    100
    Espera elemento e clica    ${VALOR_UNIT_CAMPO}
    Input Text    ${VALOR_UNIT_CAMPO}    10
    Click Element    ${PRODUTO_SALVAR}
