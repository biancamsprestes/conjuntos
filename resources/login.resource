*** Settings ***
Documentation            Arquivo da tela de login da Conjuntos
Library                  Browser

*** Variables ***
${url}                     http://172.16.2.12:3000/conjuntos/estudante/login
${BROWSER}                 chrome
${title}                   Faça login na Conjuntos! Sua carreira não pode esperar.
${esqueciSenha}            text=Esqueci ou não tenho senha
${titleEsqueciSenha}       Estudante - Esqueci ou não tenho senha | Conjuntos
${iconeConjuntos}          "conjuntos/_next/static/media/logo-conjuntos.b1d77f6e.svg"
${titleCadastroEstudante}   Dê adeus a cadastros longos e cansativos | Conjuntos
${titleHomeEstudante}      Página do estudante - Suas candidaturas a vagas de estágio

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
    Get Title       equal    ${title}

#CT01
Validar textos da tela
    Get Text        text=Entrar como candidato
    Get Text        text=Faça seu login e encontre as vagas de estágio do momento em sua região.
    Get Element     css=input[placeholder='Seu e-mail aqui']
    Get Element     css=input[placeholder='Senha']

#CT01
Validar campos da tela
    Get Element    css=input[name='email']
    Get Element    css=input[name='password']

#CT01
Validar botoes da tela
    Get Element     css=button >> text=ENTRAR 
    Get Element     css=button >> text=QUERO ME CADASTRAR
    Get Text        ${esqueciSenha}

#CT02
Clicar em Esqueci ou não tenho senha na tela
    Click           xpath=//a[contains(@href, '/conjuntos/estudante/login/recuperar-senha')]
    Sleep                     1
    Get Title       equal    ${titleEsqueciSenha}

#CT02
Validar tela de Esqueci Senha
    Get Title       equal    ${titleEsqueciSenha}
    Get Elements    ${iconeConjuntos}
    Get Element     css=button >> text=PARA EMPRESAS
    Get Element     css=button >> text=CADASTRAR-SE
    #Get Text        text=Esqueci ou não tenho senha
    Get Text        text=Digite seu e-mail cadastrado e vamos enviar um link para você definir uma nova senha.
    Get Element    css=input[name='email']
    Get Element     css=button >> text=RECEBER LINK
    Get Element     xpath=//a[contains(text(),'VOLTAR')]

#CT03
Clicar em Quero me Cadastrar na tela
    Click    xpath=//button[contains(.,'QUERO ME CADASTRAR')]
    Sleep                     1
    Get Title       equal    ${titleCadastroEstudante}

#CT03
Verificar se foi direcionado para tela de cadastro de estudante 
    Get Title       equal    ${titleCadastroEstudante}
    Get Text        text=Qual é o seu nome completo?
    Get Text        text=Esse será o nome que as empresas verão no seu perfil.
    Get Element     css=input[name='name']

#CT04
Login com email e senha em branco
    Click                  css=button >> text=Entrar   
    Sleep                  1
    Get Text               id=mui-1-helper-text

#CT05
Login apenas com email
    [Arguments]            ${email}   
    Fill Text              css=input[name=email]        ${email}
    Click                  css=button >> text=Entrar   
    Sleep                  1
    Get Text               id=mui-2-helper-text

#CT06
Login apenas com senha
    [Arguments]            ${password}   
    Fill Text              css=input[name=password]     ${password}
    Click                  css=button >> text=Entrar   
    Sleep                  1
    Get Text               id=mui-1-helper-text  

#CT07
Login com formato de email errado
    [Arguments]            ${email}    ${password}   
    Fill Text              css=input[name=email]        ${email}
    Fill Text              css=input[name=password]     ${password}
    Click                  css=button >> text=Entrar  
    Sleep                  1

#CT08
Login com dados incorretos
    [Arguments]            ${email}    ${password}   
    Fill Text              css=input[name=email]        ${email}
    Fill Text              css=input[name=password]     ${password}
    Click                  css=button >> text=Entrar  
    Sleep                  1
    Get Text               id=mui-2-helper-text 


#CT09
Login com dados corretos
    [Arguments]            ${email}    ${password}   
    Fill Text              css=input[name=email]        ${email}
    Fill Text              css=input[name=password]     ${password}
    Click                  css=button >> text=Entrar  
    Sleep                  1

#CT09
Verificar tela de home do estudante
    Get Title       equal    ${titleHomeEstudante}
    Get Text        text=Olá, Mário
    Get Text        text=Nível do perfil: Iniciante
    Get Element     xpath=//a[contains(.,'ATUALIZAR PERFIL')]
    Get Text        text=Descubra seu perfil comportamental e garanta o melhor match com as empresas da sua região.
    Get Text        text=O teste leva cerca de 20min para resposta.
    Get Element     css=button >> text=FAZER TESTE
    Get Text        text=Minhas vagas
    Click           css=button >> text=Andamento
    Click           css=button >> text=Aprovado
    Click           css=button >> text=Encerradas
    Get Text        text=Vagas curtidas
    Get Text        text=Disponíveis
    Get Text        text=Expiradas
    Click           css=button >> text=Disponíveis
    Click           css=button >> text=Expiradas
    Get Element     xpath=//button[contains(.,'Início')]
    Get Element     xpath=//button[contains(.,'Vagas')]
    Get Element     xpath=//button[contains(.,'Notificações')]
    Get Element     xpath=//button[contains(.,'mário')]

    
