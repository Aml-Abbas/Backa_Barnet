import {Action} from '@ngrx/store';
import {Person} from '../../models/Person';


export const UPDATE_PERSON = '[Current Person] Update Person';
export const UPDATE_PERSON_SUCCESS = '[Current Person] Update Person Success';
export const UPDATE_PERSON_FAIL = '[Current Person] Update Person Fail';

export class UpdatePerson implements Action {
    readonly type = UPDATE_PERSON;
  
    constructor(public payload: Person) {}
  }
  
  export class UpdatePersonSuccess implements Action {
    readonly type = UPDATE_PERSON_SUCCESS;
  
    constructor(public payload: Person) {}
  }
  
  export class UpdatePersonFail implements Action {
    readonly type = UPDATE_PERSON_FAIL;

    constructor(public payload: any) {}

  }
  
  export type CurrentPersonAction =
  | UpdatePerson | UpdatePersonSuccess | UpdatePersonFail;