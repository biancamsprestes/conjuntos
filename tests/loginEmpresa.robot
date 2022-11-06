*** Settings ***
Documentation            Tela de Login de Empresa da Conjuntos
Library                  Browser
Resource    ../resources/loginEmpresa.resource
Test Setup        Start Test
Test Teardown     Finish Test

*** Test Cases ***
#CT01
CT01: Verificar elementos de tela de login de Empresa
    Validar título da página de login
    Validar textos da tela
    Validar campos da tela
    Validar botoes da tela

#CT02
CT02: Seguir com o login sem informar CNPJ/CPF
    Login sem CNPJ/CPF

#CT03
CT03: Seguir com o login informando CNPJ/CPF não cadastrado
    Login com CNPJ/CPF não cadastrado    144.547.310-04

#CT04
CT04: Seguir com o login informando CNPJ/CPF inválido
    Login com CNPJ/CPF inválido    099.232.313-12

#CT05
CT05: Seguir com o login informando CNPJ/CPF cadastrado
    Login com CNPJ/CPF válido    87.958.583/0001-46

#CT06
CT06: Validar tela da segunda etapa do login de Empresa 
    Login com CNPJ/CPF válido    87.958.583/0001-46
    Validar título da página de login Empresa
    Validar campos da tela de login Empresa
    Validar botoes da tela de login Empresa