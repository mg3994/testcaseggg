import merge from 'lodash/merge';
import {IconName} from 'react-shared/components/Icon';
import {filterObject} from './utils';

/**
 * TS helper to make all properties that extend `null` optional in the schema
 */
type Definable<T> = {
  [P in keyof T as null extends T[P] ? never : P]-?: Exclude<T[P], null>;
} & {
  [P in keyof T as null extends T[P] ? P : never]?: Exclude<T[P], null>;
};

/**
 * Types being explicitly declared in this file so that they can be accessed full-stack.
 * It seems we can't deduce types (widgets, states, etc.) based on the integation classes,
 * due to circular deps, which creates a bit of repetition with having to keep this all in-sync.
 */

interface SharedState {
  added: boolean;
  expanded: boolean;
}

interface GcloudState {
  authenticated: boolean | null;
  enabled: boolean;
  projectId: string | null;
}

interface FirebaseHostingState extends SharedState {
  authedEmail: string | null;
  projectId: string | null;
  showTryAppHosting: boolean | null;
  deploymentHostingUrl: string | null;
  firebaseRcPath: string | null;
}

interface CloudRunDeployState extends SharedState, GcloudState {
  lastDeployment: {url: string; serviceName: string; lastUpdated: string} | null;
  region: string | null;
  allowUnauthenticatedInvocationsFlag: string | null;
  sourceFlag: string | null;
}
interface GeminiApiState extends SharedState, GcloudState {}

interface GoogleMapsState extends SharedState, GcloudState {}

export interface IntegrationStates {
  firebase_hosting: FirebaseHostingState;
  cloud_run_deploy: CloudRunDeployState;
  gemini_api: GeminiApiState;
  google_maps_platform: GoogleMapsState;
}

export type IntegrationId = keyof IntegrationStates;

export type IntegerationState = IntegrationStates[IntegrationId];

export abstract class Integration<T extends IntegrationId = IntegrationId> {
  abstract readonly id: IntegrationId;
  abstract readonly title: string;
  abstract readonly addCtaTitle: string;
  abstract readonly description: string;
  abstract readonly icon: string;
  abstract readonly label: 'New' | undefined;

  abstract readonly widgets: Widgets<T>;

  abstract state: Partial<IntegrationStates[T]>;
  updateState(newState: Partial<IntegrationStates[T]>) {
    this.state = merge(this.state, newState);
  }
  defaultState(state: Definable<IntegrationStates[T]>) {
    return state;
  }

  abstract saveableStates: (keyof IntegrationStates[T])[];
  setSaveableStates(saveableStates: (keyof IntegrationStates[T])[]) {
    return saveableStates;
  }
  getSaveableStates(): Partial<Pick<IntegrationStates[T], keyof IntegrationStates[T]>> {
    return filterObject(this.state, this.saveableStates);
  }

  abstract revalidate(userInitiated?: boolean): void | Promise<void>;
}

export type Widgets<T extends IntegrationId> = {
  [K in WidgetId<T>]: Widget;
};

export type Widget = {
  icon: IconName;
  title: string;
  loadingText?: string;
  run: () => void | Promise<void>;
  loading?: boolean;
  hideLoading?: boolean;
  skipRevalidationOnRun?: boolean;
  subtitle?: string;
};

export type WidgetId<T extends IntegrationId = IntegrationId> = IntegrationWidgets[T][number];
interface IntegrationWidgets {
  firebase_hosting: [
    'login',
    'initialize',
    'deploy_to_prod',
    'deploy_to_channel',
    'open_docs',
    'open_app_hosting',
    'try_app_hosting'
  ];
  cloud_run_deploy: [
    'run_oauth',
    'enable_api',
    'deploy',
    'open_dashboard',
    'open_cloud_run_app',
    'set_service_env_var'
  ];
  gemini_api: ['run_oauth', 'enable_api', 'get_api_key', 'open_docs'];
  google_maps_platform: ['run_oauth', 'enable_api', 'get_api_key', 'open_docs', 'manage_apis'];
}
