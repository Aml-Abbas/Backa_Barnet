import { Action } from '@ngrx/store';
import { DiscoverCard } from 'src/app/models/DiscoverCard';


export const LOAD_DISCOVERCARD = '[DiscoverCard] Load DiscoverCard';
export const LOAD_DISCOVERCARD_SUCCESS = '[DiscoverCard] Load DiscoverCard Success';
export const LOAD_DISCOVERCARD_FAIL = '[DiscoverCard] Load DiscoverCard Fail';

export const CREATE_DISCOVERCARD = '[DiscoverCard] Create DiscoverCard';
export const CREATE_DISCOVERCARD_SUCCESS = '[DiscoverCard] Create DiscoverCard Success';
export const CREATE_DISCOVERCARD_FAIL = '[DiscoverCard] Create DiscoverCard Fail';

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

export type DiscoverCardAction = LoadDiscoverCard | LoadDiscoverCardSuccess | LoadDiscoverCardFail |
                                CreateDiscoverCard | CreateDiscoverCardSuccess | CreateDiscoverCardFail;
