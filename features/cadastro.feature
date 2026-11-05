# language: pt

Funcionalidade: Cadastro de modelo
  Como usuário do ProvaCar
  Quero cadastrar novos modelos de veículos
  Para manter a base de modelos atualizada

  Contexto:
    Dado que estou na página de modelos
    E abro o formulário clicando em "Novo modelo"

  @CT16
  Cenário: Abrir o formulário de novo modelo
    Então o modal deve exibir o título "Novo modelo"
    E todos os campos devem estar vazios
    E o campo "Código" deve estar bloqueado com o texto "Automático"

  @CT16 @bug-B13
  Cenário: Ordem dos campos dependentes
    Então o campo "Fabricante" deve aparecer antes do campo "Família"

  @CT17 @CT29
  Cenário: Cadastrar modelo com dados válidos
    Quando preencho o formulário com dados válidos
    E clico em "Salvar"
    Então o modal deve ser fechado
    E deve ser exibida uma mensagem de sucesso
    E o novo modelo deve aparecer na grade
    E o modelo deve continuar na grade após recarregar a página

  @CT18
  Cenário: Salvar com o formulário vazio
    Quando clico em "Salvar" sem preencher nenhum campo
    Então o cadastro não deve ser realizado
    E todos os campos obrigatórios devem ser destacados com mensagem de erro

  @CT19
  Esquema do Cenário: Salvar sem um campo obrigatório
    Quando preencho o formulário com dados válidos
    Mas deixo o campo "<campo>" vazio
    E clico em "Salvar"
    Então o cadastro não deve ser realizado
    E deve ser exibida a mensagem de campo obrigatório para "<campo>"

    Exemplos:
      | campo        |
      | Família      |
      | Fabricante   |
      | Molicar      |
      | Modelo       |
      | Combustível  |
      | Portas       |
      | Ano início   |
      | Ano fim      |
      | Cilindradas  |
      | Cavalos      |

  @CT20 @bug-B06
  Cenário: Cadastrar Molicar duplicado
    Quando preencho o formulário com dados válidos
    E informo o Molicar "01708737-5", que já está cadastrado
    E clico em "Salvar"
    Então o cadastro não deve ser realizado
    E deve ser exibida uma mensagem de Molicar já cadastrado

  @CT21 @CT22 @CT24
  Esquema do Cenário: Valores inválidos em campos numéricos
    Quando preencho o formulário com dados válidos
    E informo "<valor>" no campo "<campo>"
    E clico em "Salvar"
    Então o cadastro não deve ser realizado
    E deve ser exibida uma mensagem de valor inválido para "<campo>"

    Exemplos:
      | campo       | valor |
      | Portas      | abc   |
      | Portas      | -1    |
      | Portas      | 50    |
      | Ano início  | abc   |
      | Ano início  | 1800  |
      | Ano fim     | 3000  |
      | Cilindradas | 0     |
      | Cilindradas | -100  |
      | Cavalos     | 0     |
      | Cavalos     | abc   |

  @CT23
  Cenário: Ano fim menor que ano início
    Quando preencho o formulário com dados válidos
    E informo "2010" no campo "Ano início"
    E informo "2005" no campo "Ano fim"
    E clico em "Salvar"
    Então o cadastro não deve ser realizado
    E deve ser exibida a mensagem "Ano fim deve ser maior ou igual ao ano início"

  @CT25 @bug-B11
  Cenário: Campos exibidos na grade disponíveis no formulário
    Então o formulário deve conter os campos "Tipo", "Ativo", "Aut." e "Cadastro Manual"

  @CT26 @CT27
  Esquema do Cenário: Fechar o formulário sem salvar
    Quando preencho o formulário com dados válidos
    E clico em "<botao>"
    Então o modal deve ser fechado
    E o modelo não deve ser cadastrado

    Exemplos:
      | botao    |
      | Cancelar |
      | X        |

  @CT28
  Cenário: Formulário de novo modelo abre limpo após uma edição
    Dado que abri e fechei a edição de um modelo existente
    Quando abro o formulário clicando em "Novo modelo"
    Então todos os campos devem estar vazios
