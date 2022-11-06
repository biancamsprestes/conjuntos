*** Settings ***
Documentation            Tela de Login de Estudante da Conjuntos
Library                  Browser
Resource    ../resources/login.resource
Test Setup        Start Test
Test Teardown     Finish Test

*** Test Cases ***
#CT01
CT01: Verificar elementos de tela de login do Estudante
    Validar título da página de login
    Validar textos da tela
    Validar campos da tela
    Validar botoes da tela

#CT02
CT02: Clicar em Esqueci ou não tenho senha
    Clicar em Esqueci ou não tenho senha na tela
    Validar tela de Esqueci Senha

#CT03 Esse CT será mais validado mais adiante
CT03: Clicar em Quero me Cadastrar
    Clicar em Quero me Cadastrar na tela
    Verificar se foi direcionado para tela de cadastro de estudante 

#CT04
CT04: Fazer login sem preencher nenhum dos campos
    Login com email e senha em branco        

#CT05
CT05: Fazer login preenchendo apenas o campo Email
    Login apenas com email    novaplataformatestes@cieers.org.br

#CT06
CT06: Fazer login preenchendo apenas o campo Senha
    Login apenas com senha    Usuario@12

#CT07
CT07: Fazer login preenchendo o campo Email com formato errado
    Login com formato de email errado    novaplataformatestes    Usuario@12
    
#CT08
CT08: Fazer login com dados incorretos
    Login com dados incorretos    mariomv@gmail.com    Usuario@20     #a senha está incorreta

#CT09
CT09: Fazer login corretamente
    Login com dados corretos    mariomv@gmail.com    Usuario@12
    Verificar tela de home do estudante