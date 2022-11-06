*** Settings ***
Documentation            Arquivo principal do projeto Conjuntos
Library                  Browser

*** Variables ***
${url}                     http://172.16.2.12:3000/conjuntos
${BROWSER}                 chrome
${title}                   Oportunidades de estágio no Rio Grande do Sul | Conjuntos
${iconeConjuntos}          "conjuntos/_next/static/media/logo-conjuntos.b1d77f6e.svg"
${iconeRodapeConjuntos}    "conjuntos/_next/image?url=%2Fconjuntos%2F_next%2Fstatic%2Fmedia%2Flogo-conjuntos-subtitle.fc335388.png&amp;w=384&amp;q=100"
${iconeCiee}               "/conjuntos/_next/image?url=%2Fconjuntos%2F_next%2Fstatic%2Fmedia%2Flogo-cieers.b17bf7f0.png&amp;w=128&amp;q=100"
${iconeFacebook}           "https://www.facebook.com/CIEERS.ORG"
${iconeLinkedIn}           "https://www.linkedin.com/company/ciee-rs"
${iconeInstagram}          "https://www.instagram.com/ciee_rs/"
${iconeSpotify}            "/conjuntos/_next/static/media/spotify-icon.edd22df3.svg"
${iconeTikTok}             "/conjuntos/_next/static/media/tiktok-icon.eeffabb2.svg"
${iconeYT}                 "https://www.youtube.com/channel/UCKe_TEUzFVH7pnprlkdKieg"


*** Keywords ***

Start Test
    New browser             headless=True    #browser=${BROWSER}
    New Page                ${url}
    Sleep                     1

Finish Test
    #Thinking Time
    Sleep                     1
    Take Screenshot

Validar título da página
    Sleep                     1
    Get Title       equal    ${title}

Validar imagens da tela
    Get Elements    ${iconeConjuntos}
    Get Elements    ${iconeRodapeConjuntos}
    Get Elements    ${iconeCiee}
      
Validar textos da tela
    Get Text        text=Encontre seu novo estágio aqui
    Get Text        text=Descubra centenas de oportunidades e dê um passo na sua carreira
    Get Element     css=input[placeholder='Selecione até 5 cursos ou áreas']
    Get Element     css=input[placeholder='Selecione até 5 cidades']
Validar botões da tela
    Get Element     css=button >> text=Buscar vagas   
    Get Element     css=button >> text=PARA EMPRESAS
    Get Element     css=button >> text=ENTRAR

Validar textos do rodapé
    Get Text        text=Telefone
    Get Text        text=(51) 3363-1000
    Get Text        text=E-mail
    Get Text        text=sac@cieers.org.br
    Get Text        text=Política de Privacidade - Política de Segurança
    Get Text        text=CIEE-RS Todos os direitos reservados - Designed and developed by CWI Software

Validar ícones das mídias sociais
    Get Elements    ${iconeFacebook}
    Get Elements    ${iconeLinkedIn}
    Get Elements    ${iconeInstagram}
    Get Elements    ${iconeSpotify}
    Get Elements    ${iconeTikTok}
    Get Elements    ${iconeYT}

Validar obrigatoriedade dos campos Curso e Cidade
    Click          css=button >> text=Buscar vagas
    Get Text       id=mui-2-helper-text >> text="Este campo é obrigatório"
Validar obrigatoriedade do campo Código
    Click          css=button >> text=Código
    Click          css=button >> text=Buscar vagas
    Get Text       text=Este campo é obrigatório

Validar aba Código
    Click          css=button >> text=Código
    Get Text       text=Digite somente números
    Get Text       text=Busque uma vaga pelo seu código de 10 dígitos:
    Fill Text      css=input[name=code]    Código da vaga
    Click          css=input[name=code]
    Get Element    css=input[placeholder='Ex: 00/00000-0 00']
    Get Element    css=button >> text=Buscar vagas


    



