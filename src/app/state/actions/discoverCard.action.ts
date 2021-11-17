import { Action } from '@ngrx/store';
import { DiscoverCard } from 'src/app/models/DiscoverCard';


export const LOAD_DISCOVERCARD = '[DiscoverCard] Load DiscoverCard';
export const LOAD_DISCOVERCARD_SUCCESS = '[DiscoverCard] Load DiscoverCard Success';
export const LOAD_DISCOVERCARD_FAIL = '[DiscoverCard] Load DiscoverCard Fail';

export const CREATE_DISCOVERCARD = '[DiscoverCard] Create DiscoverCard';
export const CREATE_DISCOVERCARD_SUCCESS = '[DiscoverCard] Create DiscoverCard Success';
export const CREATE_DISCOVERCARD_FAIL = '[DiscoverCard] Create DiscoverCard Fail';

export const UPDATE_DISCOVERCARD = '[DiscoverCard] Update DiscoverCard';
export const UPDATE_DISCOVERCARD_SUCCESS = '[DiscoverCard] Update DiscoverCard Success';
export const UPDATE_DISCOVERCARD_FAIL = '[DiscoverCard] Update DiscoverCard Fail';

export class LoadDiscoverCard implements Action {
  readonly type = LOAD_DISCOVERCARD;
  constructor(public payload: string) {
  }
}

export class LoadDiscoverCardSuccess implements Action {
  readonly type = LOAD_DISCOVERCARD_SUCCESS;
  constructor(public payload: DiscoverCard[]) {}
}

export class LoadDiscoverCardFail implements Action {
  readonly type = LOAD_DISCOVERCARD_FAIL;
  constructor(public payload: any) {}
}

export class CreateDiscoverCard implements Action {
  readonly type = CREATE_DISCOVERCARD;
  constructor(public payload: any) {}
}

export class CreateDiscoverCardSuccess implements Action {
  readonly type = CREATE_DISCOVERCARD_SUCCESS;
  constructor(public payload: any) {}
}

export class CreateDiscoverCardFail implements Action {
  readonly type = CREATE_DISCOVERCARD_FAIL;
  constructor(public payload: any) {}
}

export class UpdateDiscoverCard implements Action {
  readonly type = UPDATE_DISCOVERCARD;
  constructor(public payload: any) {}
}

export class UpdateDiscoverCardSuccess implements Action {
  readonly type = UPDATE_DISCOVERCARD_SUCCESS;
  constructor(public payload: any) {}
}

export class UpdateDiscoverCardFail implements Action {
  readonly type = UPDATE_DISCOVERCARD_FAIL;
  constructor(public payload: any) {}
}

export type DiscoverCardAction = LoadDiscoverCard | LoadDiscoverCardSuccess | LoadDiscoverCardFail |
                                CreateDiscoverCard | CreateDiscoverCardSuccess | CreateDiscoverCardFail|
                                UpdateDiscoverCard | UpdateDiscoverCardSuccess | UpdateDiscoverCardFail;
