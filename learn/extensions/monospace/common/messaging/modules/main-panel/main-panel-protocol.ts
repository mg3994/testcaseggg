// TODO: remove dependency and split out integrations as abstract classes (or interfaces)
import {Integrations} from '../../../../src/main-panel/integrations/utils/integrations-manager';
import {UserMetadata} from 'vscode-shared/vscodeplugin-exports';
import {WorkspaceMetadata} from 'vscode-shared/vscodeplugin-exports';
import {IntegrationId, WidgetId} from './integrations';

export interface MainPanelWebviewToExtension {
  navigateToDocs(): void;
  navigateToDashboard(): void;
  getTroubleshootingInfo(): void;
  openShareWorkspace(): void;
  openMonospaceCommands(): void;
  openMonospaceSettings(): void;
  navigateToFileABug(): void;
  navigateToFileAFeatureRequest(): void;
  navigateToSeeRoadmap(): void;
  navigateToSeeWebHostDocs(): void;
  navigateToTroubleshootingGuide(): void;
  getReleaseNotes(): void;
  navigateToFullReleaseNotes(): void;
  markReleaseNotesSeen(): void;
  openUrl(url: string): void;
  getUserMetadata(): void;
  getWorkspaceMetadata(): void;
  runIntegrationWidget(integrationId: IntegrationId, widgetId: WidgetId): void;
  getWorkspaceIntegrations(): void;
  toggleIntegrationAdded(IntegrationId: IntegrationId): void;
  toggledExpanded(id: IntegrationId, isExpanded: boolean): void;
  // eventually remove this once new main panel is no longer an experiment
  isNewUIEnabled(): void;
}

export interface TroubleshootingInfo {
  monospaceVersion: string;
  workspaceId: string;
  containerCommit: string;
  permanentTag: string;
}

export interface PortInfo {
  port: number;
  url: string;
  pid?: number;
}

export interface MainPanelExtensionToWebview {
  notifyTroubleshootingInfo(info: TroubleshootingInfo): void;
  notifyReleaseNotes(releaseNotes: string): void;
  backendPortUpdate(ports: PortInfo[]): void;
  flashTroubleshootSection(): void;
  notifyUserMetadata(metadata: UserMetadata): void;
  notifyWorkspaceMetadata(metadata: WorkspaceMetadata): void;
  notifyWorkspaceIntegrations(integrations: Integrations): void;
  // eventually remove this once new main panel is no longer an experiment
  notifyIsNewUIEnabled(isEnabled: boolean): void;
}
