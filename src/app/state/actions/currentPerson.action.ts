import {Action} from '@ngrx/store';
import {Person} from '../../models/Person';
import {User} from '../../models/User';


export const UPDATE_PERSON = '[Current Person] Update Person';
export const UPDATE_PERSON_SUCCESS = '[Current Person] Update Person Success';
export const UPDATE_PERSON_FAIL = '[Current Person] Update Person Fail';

export const UPDATE_ADMIN_USER = '[Current Admin User] Update Admin User';
export const UPDATE_ADMIN_USER_SUCCESS = '[Current Admin User] Update Admin User Success';
export const UPDATE_ADMIN_USER_FAIL = '[Current Admin User] Update Admin User Fail';

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


  export class UpdateAdminUser implements Action {
    readonly type = UPDATE_ADMIN_USER;
    constructor(public payload: User | null) {}
  }
  
  export class UpdateAdminUserSuccess implements Action {
    readonly type = UPDATE_ADMIN_USER_SUCCESS;
    constructor(public payload: User | null) {}
  }
  
  export class UpdateAdminUserFail implements Action {
    readonly type = UPDATE_ADMIN_USER_FAIL;
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
    readonly type = UPDATE_ADMIN_USER_FAIL;
    constructor(public payload: any) {}
  }


  export type CurrentPersonAction = UpdatePerson | UpdatePersonSuccess | UpdatePersonFail|
   UpdateAdminUser | UpdateAdminUserSuccess | UpdatePersonFail|
   UpdateUsers | UpdateUsersSuccess | UpdateUsersFail;

