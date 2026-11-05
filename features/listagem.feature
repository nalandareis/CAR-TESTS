# language: pt

Funcionalidade: Listagem de modelos de veículos
  Como usuário do ProvaCar
  Quero visualizar os modelos cadastrados
  Para consultar as informações da tabela Molicar

  Contexto:
    Dado que estou na página de modelos

  @CT01
  Cenário: Carregar a listagem de modelos
    Então a grade deve exibir os registros cadastrados
    E a grade deve conter as colunas "Tipo", "Fabricante", "Família", "Modelo", "Combustível", "Ano início", "Ano fim", "Portas", "Cilindradas", "Cavalos", "Molicar", "Ativo" e "Ação"

  @CT02 @bug-B01
  Cenário: Coerência dos anos entre a grade e o formulário
    Dado que o modelo "ELEGANCE 2.0 8V FLEXPOWER 4P MAN. BLINDADON3" está na grade
    Quando abro a edição desse modelo
    Então o "Ano início" do formulário deve ser igual ao "Ano início" da grade
    E o "Ano fim" do formulário deve ser igual ao "Ano fim" da grade
    E o "Ano início" deve ser menor ou igual ao "Ano fim"

  @CT03 @bug-B02 @bug-B03 @bug-B14
  Cenário: Acentuação dos textos exibidos
    Então a coluna "Combustível" deve exibir "ÁLCOOL/GASOLINA" com acentuação correta
    E os cabeçalhos "Família" e "Combustível" devem estar acentuados
    E o combustível exibido na grade deve ser igual ao exibido no formulário

  @CT04 @bug-B04 @bug-B05 @bug-B06
  Cenário: Integridade dos registros exibidos
    Então nenhum registro deve ter o campo "Molicar" vazio  
    E nenhum registro deve ter "Cilindradas" ou "Cavalos" iguais a zero
    E não deve haver registros duplicados

#obs: eu percebi que essa parte do molicar tinham alguns cadastros que estavam sem o molicar, quando você tenta cadastrar ou editar e não põe essa parte do molicar a plataforma não aceita, então ter um determiando carro cadastrado sem isso, para mim seria um erro que passou