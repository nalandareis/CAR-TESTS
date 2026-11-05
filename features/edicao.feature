# language: pt

Funcionalidade: Edição de modelo
  Como usuário do ProvaCar
  Quero editar modelos cadastrados
  Para corrigir ou atualizar suas informações

  Contexto:
    Dado que estou na página de modelos
    E abro a edição do modelo com Molicar "00400101-1"

  @CT30 @bug-B09
  Cenário: Abrir a edição de um modelo
    Então o modal deve exibir o título "Editar modelo"
    E os campos devem estar preenchidos com os dados do modelo

  @CT31 @CT34
  Cenário: Editar e salvar um modelo
    Quando altero o campo "Cavalos" para "175"
    E clico em "Salvar"
    Então a grade deve exibir "175" na coluna "Cavalos" desse modelo
    E a alteração deve continuar após recarregar a página

  @CT32 @bug-B10
  Cenário: Registro de auditoria após edição
    Quando altero o campo "Cavalos" para "175"
    E clico em "Salvar"
    E abro novamente a edição do modelo
    Então o campo "Alteração" deve exibir o usuário logado e a data e hora atuais
    E a data de "Alteração" deve ser diferente da data de "Inclusão"

  @CT33
  Cenário: Cancelar a edição
    Quando altero o campo "Cavalos" para "999"
    E clico em "Cancelar"
    Então a grade deve manter o valor original na coluna "Cavalos" desse modelo
