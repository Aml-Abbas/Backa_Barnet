import {Action} from '@ngrx/store';
import { UpdateAdminUserFail } from '.';
import {Person} from '../../models/Person';
import {User} from '../../models/User';


export const UPDATE_PERSON = '[Current Person] Update Person';
export const UPDATE_PERSON_SUCCESS = '[Current Person] Update Person Success';
export const UPDATE_PERSON_FAIL = '[Current Person] Update Person Fail';

export const UPDATE_USERS = '[Users] Update Users';
export const UPDATE_USERS_SUCCESS = '[Users] Update Users Success';
export const UPDATE_USERS_FAIL = '[Users] Update Users Fail';


export class UpdatePerson implements Action {
    readonly type = UPDATE_PERSON;
    constructor(public payload: Person | null) {}
  }
  
  export class UpdatePersonSuccess implements Action {
    readonly type = UPDATE_PERSON_SUCCESS;
    constructor(public payload: Person | null) {}
  }
  
  export class UpdatePersonFail implements Action {
    readonly type = UPDATE_PERSON_FAIL;
    constructor(public payload: any) {}
  }

  export class UpdateUsers implements Action {
    readonly type = UPDATE_USERS;
    constructor(public payload: User[]) {}
  }
  
  export class UpdateUsersSuccess implements Action {
    readonly type = UPDATE_USERS_SUCCESS;
    constructor(public payload: User[]) {}
  }
  
  export class UpdateUsersFail implements Action {
    readonly type = UPDATE_USERS_FAIL;
    constructor(public payload: any) {}
  }


  export type CurrentPersonAction = 
   UpdatePerson | UpdatePersonSuccess | UpdatePersonFail|
   UpdateUsers | UpdateUsersSuccess | UpdateUsersFail;

