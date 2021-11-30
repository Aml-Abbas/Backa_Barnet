import { Action } from '@ngrx/store';


export const CREATE_ESTIMATE = '[Estimate] Create Estimate';
export const CREATE_ESTIMATE_SUCCESS = '[Estimate] Create Estimate Success';
export const CREATE_ESTIMATE_FAIL = '[Estimate] Create Estimate Fail';


export class CreateEstimateCard implements Action {
    readonly type = CREATE_ESTIMATE;
    constructor(public payload: any) {}
  }
  
  export class CreateEstimateSuccess implements Action {
    readonly type = CREATE_ESTIMATE_SUCCESS;
    constructor(public payload: any) {}
  }
  
  export class CreateEstimateFail implements Action {
    readonly type = CREATE_ESTIMATE_FAIL;
    constructor(public payload: any) {}
  }
  
  export type EstimateAction = CreateEstimateCard | CreateEstimateSuccess | CreateEstimateFail ;