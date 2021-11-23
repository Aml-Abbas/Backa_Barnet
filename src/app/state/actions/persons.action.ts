import {Action} from '@ngrx/store';
import { Person } from 'src/app/models/Person';

export const LOAD_PERSONS = '[Persons] Load Persons';
export const LOAD_PERSONS_SUCCESS = '[Persons] Load Persons Success';
export const LOAD_PERSONS_FAIL = '[Persons] Load Persons Fail';

export const UPDATE_STATUS = '[Current Status] Update Status';
export const UPDATE_STATUS_SUCCESS = '[Current Status] Update Status Success';
export const UPDATE_STATUS_FAIL = '[Current Status] Update Status Fail';

export class LoadPersons implements Action {
    readonly type = LOAD_PERSONS;
  
    constructor(public payload: string) {}
  }
  
  export class LoadPersonsSuccess implements Action {
    readonly type = LOAD_PERSONS_SUCCESS;
  
    constructor(public payload: Person []) {}
  }
  
  export class LoadPersonsFail implements Action {
    readonly type = LOAD_PERSONS_FAIL;
  
    constructor(public payload: any) {}
  }
  
  export class UpdateStatus implements Action {
    readonly type = UPDATE_STATUS;
    constructor(public payload: any) {}
  }
  
  export class UpdateStatusSuccess implements Action {
    readonly type = UPDATE_STATUS_SUCCESS;
    constructor(public payload: any) {}
  }
  
  export class UpdateStatusFail implements Action {
    readonly type = UPDATE_STATUS_FAIL;
    constructor(public payload: any) {}
  }


  export type PersonsAction =
  | LoadPersons | LoadPersonsSuccess | LoadPersonsFail|
    UpdateStatus | UpdateStatusSuccess | UpdateStatusFail;