*** Settings ***
Documentation            Home da Conjuntos
Library                  Browser
Resource    ../resources/main.resource
Test Setup        Start Test
Test Teardown     Finish Test

*** Test Cases ***

#CT01
CT01: Verificar elementos de tela aba curso
    Validar título da página
    Validar imagens da tela
    Validar textos da tela
    Validar botões da tela
    Validar textos do rodapé
    Validar ícones das mídias sociais

#CT02
CT02: Verificar elementos de tela aba codigo
    Validar aba Código

#CT03
CT03: Clicar em Buscar Vagas sem preencher o Curso e a Cidade
    Validar obrigatoriedade dos campos Curso e Cidade

#CT04
CT04: Clicar em Buscar Vagas sem preencher o Código
    Validar obrigatoriedade do campo Código

#CT05
CT05: Validar campo Curso
    #placeholder="Selecione até 5 cursos ou áreas"
    Get Text       id=mui-2  ==  'Selecione até 5 cursos ou áreas'
    #Get Text    id=mui-2  >> text="Selecione até 5 cursos ou áreas"