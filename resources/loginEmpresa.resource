*** Settings ***
Documentation            Arquivo da tela de login de Empresa da Conjuntos
Library                  Browser

*** Variables ***
${url}                     http://172.16.2.12:3000/conjuntos/empresa/login
${BROWSER}                 chrome
${title}                   Acesse agora mesmo o cadastro da sua empresa na Conjuntos

*** Keywords ***

Start Test
    New browser             headless=False    #browser=${BROWSER}
    New Page                ${url}
    Sleep                     1

Finish Test
    #Thinking Time
    Sleep                     1
    Take Screenshot

#CT01
Validar título da página de login
    Sleep                     1
    Get Title    equal    ${title}

#CT01
Validar textos da tela
    Get Text    text=Entrar como empresa
    Get text    text=Sua empresa ainda não tem convênio?

#CT01
Validar campos da tela
    Get Element    css=input[name='cnpjCpf']

#CT01    
Validar botoes da tela
    Get Element     css=button >> text=PROSSEGUIR
    Get Element     css=button >> text=CADASTRAR MINHA EMPRESA
    Get Element     xpath=//a[contains(text(),'Esqueci ou não tenho senha')]

#CT02
Login sem CNPJ/CPF
    Click                  css=button >> text=PROSSEGUIR  
    Sleep                  1
    Get Text               text=Esse campo é obrigatório.

#CT03
Login com CNPJ/CPF não cadastrado
    [Arguments]            ${cpf/cnpj}   
    Fill Text              css=input[name=cnpjCpf]     ${cpf/cnpj} 
    Click                  css=button >> text=PROSSEGUIR   
    Sleep                  1
    Get Text               text=Não foi possível encontrar essa empresa. Se sua empresa já é cadastrada, confira se você digitou certo ou entre em contato com nosso suporte por telefone: (51) 3363-1000.

#CT04
Login com CNPJ/CPF inválido
    [Arguments]            ${cpf/cnpj}   
    Fill Text              css=input[name=cnpjCpf]     ${cpf/cnpj} 
    Click                  css=button >> text=PROSSEGUIR   
    Sleep                  1
    Get Text               text=Digite um CNPJ/CPF válido.

#CT05
Login com CNPJ/CPF válido
    [Arguments]            ${cpf/cnpj}   
    Fill Text              css=input[name=cnpjCpf]     ${cpf/cnpj} 
    Click                  css=button >> text=PROSSEGUIR   
    Sleep                  1
    Get Element            css=button >> text=ENTRAR

#CT06
Validar título da página de login Empresa
    Sleep                     1
    Get Title    equal    ${title}

#CT06    
Validar campos da tela de login Empresa
    Get Element    xpath=//div[@id='__next']/div/main/div/div/div/div/div/form/div[2]/div/input
    Get Element    css=input[name='password']

#CT06
Validar botoes da tela de login Empresa
    Get Element     css=button >> text=VOLTAR
    Get Element     css=button >> text=ENTRAR
    Get Element     xpath=//a[contains(text(),'Esqueci ou não tenho senha')]