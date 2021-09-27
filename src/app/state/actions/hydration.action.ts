import {Action, createAction, props} from '@ngrx/store';
import {State} from '..';

export const hydrate = createAction('[Hydration] Hydrate');

export const UPDATE_STORAGE = '[Hydration] Update Storage';
export const UPDATE_STORAGE_AVAILABLE_DATES = '[Hydration] Update Storage Available Dates';

export class UpdateStorage implements Action {
  readonly type = UPDATE_STORAGE;

  constructor(public key: string, public value: any) {
  }
}

export class UpdateStorageAvailableDates implements Action {
  readonly type = UPDATE_STORAGE_AVAILABLE_DATES
  constructor(public newDates: Date[]) {
  }
}

export const hydrateSuccess = createAction(
  '[Hydration] Hydrate Success',
  props<{ state: State }>()
);

export const hydrateFailure = createAction('[Hydration] Hydrate Failure');

export type HydrationActions = UpdateStorage | UpdateStorageAvailableDates;
