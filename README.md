Testes do CRUD de veículos ProvaCar (cadastro, consulta, edição e exclusão de modelos baseados na tabela Molicar).

## Tecnologias

- Playwright
- playwright-bdd
- Cenários escritos em Gherkin (português)

## Como rodar

npm install
npx playwright install
npm test

Para ver o relatório dos testes:

npx playwright show-report

## Estrutura

- features/ - cenários de teste em Gherkin
- steps/ - implementação dos passos
- pages/ - page objects das telas
- relatorio.txt - erros e melhorias encontrados na análise

## Status

Os cenários de teste estão escritos e o projeto está configurado.
A implementação dos passos automatizados está em andamento.
Os cenários com a tag @bug-Exx documentam erros encontrados e devem falhar até que sejam corrigidos.
