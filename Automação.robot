*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/web/index.php/admin/viewSystemUsers
${BROWSER}    chrome
${Username}    xpath=//input[@name='username']
${Password}    xpath=//input[@name='password']
${Login}       xpath=//button[@type='submit'][contains(.,'Login')]
${admin}       xpath=//a[contains(.,'Admin')]
${add}         xpath=//button[contains(.,'Add')]
${label}       xpath=(//div[contains(@class,'oxd-select-text oxd-select-text--active')])[1]
${Click}       xpath=(//div[contains(.,'Admin')])[18]
${Status}      xpath=(//div[@class='oxd-select-text oxd-select-text--active'])[2]
${Enable}      xpath=(//div[contains(.,'Enabled')])[13]
${Employee}    xpath=//input[contains(@placeholder,'Type for hints...')]   
${presskey}    xpath=//input[@placeholder='Type for hints...']    
${User}        xpath=(//input[@autocomplete='off'])[1]  
${Password2}   xpath=(//input[@autocomplete='off'])[2]    
${Confirm}     xpath=(//input[@autocomplete='off'])[3]    
${PIM}         xpath=//a[contains(.,'PIM')]    
${ADD2}        xpath=//button[contains(.,'Add')]
${FIRTS}       xpath=//input[contains(@placeholder,'First Name')]
${MIDDLE}      xpath=//input[contains(@class,'oxd-input oxd-input--active orangehrm-middlename')]
${LAST}        xpath=//input[contains(@class,'oxd-input oxd-input--active orangehrm-lastname')]
${Save}        xpath=//button[@type='submit'][contains(.,'Save')]
${Save2}       xpath=//button[contains(.,'Save')]


*** Keywords ***
Abrir Página de Exemplo
    [Documentation]    Este cenário acessa o site e verifica o título
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    5s  # Espera 5 segundos

Vericar titulo da página
    Title Should Be    OrangeHRM

Fazendo login
    [Documentation]    Este teste faz login no sistema
    Wait Until Element Is Visible    ${Username}    2s
    Input Text    ${Username}    admin
    Input Text    ${Password}    admin123
    Click Button    ${Login}
    Sleep    6s
    

Criando usuario
   Click Element     ${PIM}
    Sleep    3s
    Click Button    ${ADD2}
    Sleep    3s
    Input Text    ${FIRTS}    Matheus
    Sleep    1s
    Input Text    ${MIDDLE}    Ferreiraa
    Sleep    1s
    Input Text    ${LAST}    Teste
    sleep    1s
    Click Button    ${Save}
    Sleep    10s
        

Adicionando permissão de administrador ao usuario
    [Documentation]    Este teste adiciona um usuário
    Click Element    ${admin}
    Sleep    3s
    Click Button    ${add}
    Sleep    3s
    Click Element    ${label}
    Sleep   1s
    Click Element    ${Click}
    Sleep    2s
    Click Element    ${Status}
    Sleep   1s
    Click Element   ${Enable}
    Sleep    2s
    Input Text    ${Employee}   Matheus Ferreiraa
    Sleep    3s
    Press Keys      ${presskey}    ARROW_DOWN    ENTER
    Sleep    3s
    Input Text    ${User}    Matheus
    Sleep    3s
    Input Text   ${Password2}    admin123
    Sleep    1s
     Input Text    ${Confirm}    admin123
    Sleep    3s
    Click Button    ${Save2}    
    Sleep    10s
    Close Browser
    