import * as vscode from 'vscode';
import {z} from 'zod';

export const webviewToExtensionSchema = z.union([
  z.object({
    type: z.literal('resetLighthouse'),
  }),
  z.object({
    type: z.literal('startLighthouseAudit'),
    auditsToRun: z.array(z.string()),
  }),
]);
export type WebviewToExtensionMessage = z.infer<typeof webviewToExtensionSchema>;
export function sendToExtension(webview: vscode.Webview, message: WebviewToExtensionMessage) {
  const result = webviewToExtensionSchema.safeParse(message);
  if (result.success) {
    webview.postMessage(message);
  } else {
    console.error('Invalid message format', result.error);
  }
}

export const extensionToWebviewSchema = z.union([
  z.literal('showLoadingState'),
  z.literal('showErrorState'),
]);
export type ExtensionToWebviewMessage = z.infer<typeof extensionToWebviewSchema>;
export function sendToWebview(webview: vscode.Webview, message: ExtensionToWebviewMessage) {
  const result = extensionToWebviewSchema.safeParse(message);
  if (result.success) {
    webview.postMessage(message);
  } else {
    console.error('Invalid message format', result.error);
  }
}
