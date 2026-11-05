import { defineConfig, devices } from '@playwright/test';
import { defineBddConfig } from 'playwright-bdd';

/* Liga os cenários em Gherkin (features) à implementação dos passos (steps) */
const testDir = defineBddConfig({
  features: 'features/*.feature',
  steps: 'steps/*.js',
  missingSteps: 'skip-scenario',
});

/**
 * @see https://playwright.dev/docs/test-configuration
 */
export default defineConfig({
  testDir,
  fullyParallel: false,
  workers: 1,
  forbidOnly: !!process.env.CI,
  retries: process.env.CI ? 2 : 0,
  reporter: 'html',
  use: {
    /* URL base da aplicação testada */
    baseURL: 'http://provaqa.fandi.com.br',

    trace: 'on-first-retry',
    /* Guarda print e vídeo quando um teste falha (evidência para os bugs) */
    screenshot: 'only-on-failure',
    video: 'retain-on-failure',
  },

  /* Configure projects: browsers */
  projects: [
    {
      name: 'chromium',
      use: { ...devices['Desktop Chrome'] },
    },
  ],
});