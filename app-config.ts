export interface AppConfig {
  pageTitle: string;
  pageDescription: string;
  companyName: string;

  supportsChatInput: boolean;
  supportsVideoInput: boolean;
  supportsScreenShare: boolean;
  isPreConnectBufferEnabled: boolean;

  logo: string;
  startButtonText: string;
  accent?: string;
  logoDark?: string;
  accentDark?: string;

  // for LiveKit Cloud Sandbox
  sandboxId?: string;
  agentName?: string;
}

export const APP_CONFIG_DEFAULTS: AppConfig = {
  companyName: 'SparkTech',
  pageTitle: 'SparkTech Voice Agent',
  pageDescription: 'A voice agent built with SparkTech Agency',

  supportsChatInput: true,
  supportsVideoInput: true,
  supportsScreenShare: true,
  isPreConnectBufferEnabled: true,

  logo: 'https://www.sparktech.agency/favicon.png',
  accent: '#72eb51',
  logoDark: 'https://www.sparktech.agency/favicon.png',
  accentDark: '#72eb51',
  startButtonText: 'Talk To Sparky',

  // for LiveKit Cloud Sandbox
  sandboxId: undefined,
  agentName: undefined,
};
