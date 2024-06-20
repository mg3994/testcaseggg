/**
 * @fileoverview Lists all possible messages that can be passed back and forth
 * between two environments (VScode and Webview)
 */

import {
  MainPanelExtensionToWebview,
  MainPanelWebviewToExtension,
} from './modules/main-panel/main-panel-protocol';

interface CoreWebviewToExtension {
  showMessage(msg: string): void;
}

// Messages sent from Webview to extension
export type WebviewToExtension = CoreWebviewToExtension & MainPanelWebviewToExtension;

interface CoreExtensionToWebview {}

// Messages sent from Extension to Webview
export type ExtensionToWebview = CoreExtensionToWebview & MainPanelExtensionToWebview;
