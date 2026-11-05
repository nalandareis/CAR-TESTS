# language: pt

Funcionalidade: Exclusão de modelo
  Como usuário do ProvaCar
  Quero excluir modelos cadastrados
  Para remover registros que não devem mais existir

  Contexto:
    Dado que estou na página de modelos

  @CT35 @bug-B12
  Cenário: Confirmação antes de excluir
    Quando clico no ícone de exclusão de um modelo
    Então deve ser exibida uma mensagem pedindo confirmação da exclusão
    E o modelo deve continuar na grade até a confirmação

  @CT36 @CT37
  Cenário: Excluir um modelo
    Quando clico no ícone de exclusão de um modelo
    E confirmo a exclusão
    Então o modelo não deve mais aparecer na grade
    E deve ser exibida uma mensagem de sucesso
    E o modelo não deve voltar após recarregar a página

  @CT36
  Cenário: Cancelar a exclusão
    Quando clico no ícone de exclusão de um modelo
    E cancelo a exclusão
    Então o modelo deve continuar na grade
