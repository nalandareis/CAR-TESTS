import { createBdd } from 'playwright-bdd'; //cria as funções Given/When/Then que ligam as frases do Gherkin ao código

const { Given, When } = createBdd();

// Abre a tela de modelos antes de cada cenário, usado no Contexto de todas as features
Given('que estou na página de modelos', async ({ page }) => {
  await page.goto('https://provaqa.dev.fandi.com.br'); //parte que irá abrir a pagina do ambiente de testes
});