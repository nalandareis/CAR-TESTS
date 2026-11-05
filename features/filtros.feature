# language: pt

Funcionalidade: Filtro de modelos
  Como usuário do ProvaCar
  Quero filtrar os modelos cadastrados
  Para encontrar rapidamente o veículo que procuro

  Contexto:
    Dado que estou na página de modelos

  @CT05 @CT06 @CT11 @CT12
  Esquema do Cenário: Filtrar por campo de seleção
    Quando seleciono "<valor>" no filtro "<filtro>"
    Então todos os registros da grade devem ter "<valor>" na coluna "<coluna>"

    Exemplos:
      | filtro          | valor     | coluna          |
      | Tipo            | AUTOMOVEL | Tipo            |
      | Tipo            | UTILITARIO| Tipo            |
      | Fabricante      | AUDI      | Fabricante      |
      | Ativo           | Sim       | Ativo           |
      | Ativo           | Não       | Ativo           |
      | Cadastro Manual | Sim       | Cadastro Manual |

  @CT07
  Cenário: Família sem fabricante selecionado
    Quando abro o filtro "Família" sem selecionar um fabricante
    Então deve existir apenas a opção "Selecione..."

  @CT07
  Cenário: Família depende do fabricante selecionado
    Quando seleciono "AUDI" no filtro "Fabricante"
    Então o filtro "Família" deve listar apenas famílias da "AUDI"

  @CT08 @CT09
  Esquema do Cenário: Filtrar por Molicar
    Quando informo "<molicar>" no filtro "Molicar"
    Então a grade deve exibir apenas registros cujo Molicar contém "<molicar>"

    Exemplos:
      | molicar    |
      | 00400101-1 |
      | 004001     |

  @CT10
  Cenário: Filtrar por modelo sem diferenciar maiúsculas e minúsculas
    Quando informo "v6" no filtro "Modelo"
    Então a grade deve exibir os modelos "2.8 V6" e "2.8 V6 AVANT"

  @CT13
  Cenário: Combinar filtros
    Quando seleciono "AUTOMOVEL" no filtro "Tipo"
    E seleciono "AUDI" no filtro "Fabricante"
    E seleciono "100" no filtro "Família"
    E seleciono "Não" no filtro "Cadastro Manual"
    E seleciono "Não" no filtro "Ativo"
    Então a grade deve exibir 2 registros
    E os modelos exibidos devem ser "2.8 V6" e "2.8 V6 AVANT"

  @CT14
  Cenário: Filtro sem resultados
    Quando informo "XYZ123" no filtro "Modelo"
    Então a grade não deve exibir registros
    E deve ser exibida a mensagem "Nenhum registro encontrado"

  @CT15
  Cenário: Limpar filtros
    Dado que filtrei a grade pelo fabricante "AUDI"
    Quando volto todos os filtros para "Selecione..." e apago os campos de texto
    Então a grade deve exibir novamente todos os registros
