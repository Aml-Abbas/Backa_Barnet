import { Action } from '@ngrx/store';
import { Estimate } from 'src/app/models/Estimate';
import { EstimateCard } from 'src/app/models/EstimateCard';


export const CREATE_ESTIMATE = '[Estimate] Create Estimate';
export const CREATE_ESTIMATE_SUCCESS = '[Estimate] Create Estimate Success';
export const CREATE_ESTIMATE_FAIL = '[Estimate] Create Estimate Fail';

export const LOAD_ESTIMATE = '[Estimate] Load Estimate';
export const LOAD_ESTIMATE_SUCCESS = '[Estimate] Load Estimate Success';
export const LOAD_ESTIMATE_FAIL = '[Estimate] Load Estimate Fail';

export const LOAD_ESTIMATE_CARDS = '[Estimate Cards] Load Estimate Cards';
export const LOAD_ESTIMATE_CARDS_SUCCESS = '[Estimate Cards] Load Estimate Cards Success';
export const LOAD_ESTIMATE_CARDS_FAIL = '[Estimate Cards] Load Estimate Cards Fail';

export const LOCK_ESTIMATE_CARDS = '[Estimate Cards] Lock Estimate Cards';
export const LOCK_ESTIMATE_CARDS_SUCCESS = '[Estimate Cards] Lock Estimate Cards Success';
export const LOCK_ESTIMATE_CARDS_FAIL = '[Estimate Cards] Lock Estimate Cards Fail';

export class CreateEstimateCard implements Action {
  readonly type = CREATE_ESTIMATE;
  constructor(public payload: any) { }
}

export class CreateEstimateSuccess implements Action {
  readonly type = CREATE_ESTIMATE_SUCCESS;
  constructor(public payload: any) { }
}

export class CreateEstimateFail implements Action {
  readonly type = CREATE_ESTIMATE_FAIL;
  constructor(public payload: any) { }
}

export class LoadEstimate implements Action {
  readonly type = LOAD_ESTIMATE;
  constructor(public payload: string) {
  }
}

export class LoadEstimateSuccess implements Action {
  readonly type = LOAD_ESTIMATE_SUCCESS;
  constructor(public payload: Estimate[]) { }
}

export class LoadEstimateFail implements Action {
  readonly type = LOAD_ESTIMATE_FAIL;
  constructor(public payload: any) { }
}

export class LoadEstimateCards implements Action {
  readonly type = LOAD_ESTIMATE_CARDS;

  constructor(public payload: EstimateCard[]) { }
}

export class LoadEstimateCardsSuccess implements Action {
  readonly type = LOAD_ESTIMATE_CARDS_SUCCESS;

  constructor(public payload: EstimateCard[]) { }
}

export class LoadEstimateCardsFail implements Action {
  readonly type = LOAD_ESTIMATE_CARDS_FAIL;

  constructor(public payload: any) { }

}

export class LockEstimateCards implements Action {
  readonly type = LOCK_ESTIMATE_CARDS;

  constructor(public payload: EstimateCard[]) { }
}

export class LockEstimateCardsSuccess implements Action {
  readonly type = LOCK_ESTIMATE_CARDS_SUCCESS;

  constructor(public payload: any) { }
}

export class LockEstimateCardsFail implements Action {
  readonly type = LOCK_ESTIMATE_CARDS_FAIL;

  constructor(public payload: any) { }

}

export type EstimateAction = LoadEstimate | LoadEstimateSuccess | LoadEstimateFail |
  LoadEstimateCards | LoadEstimateCardsSuccess | LoadEstimateCardsFail |
  LockEstimateCards | LockEstimateCardsSuccess | LockEstimateCardsFail |
  CreateEstimateCard | CreateEstimateSuccess | CreateEstimateFail;