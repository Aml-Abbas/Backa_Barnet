import { Action } from '@ngrx/store';

export const CREATE_USER = '[User] Create User';
export const CREATE_USER_SUCCESS = '[User] Create User Success';
export const CREATE_USER_FAIL = '[User] Create User Fail';

export const UPDATE_USER = '[User] Update User';
export const UPDATE_USER_SUCCESS = '[User] Update User Success';
export const UPDATE_USER_FAIL = '[User] Update User Fail';

export const REMOVE_USER = '[User] Remove User';
export const REMOVE_USER_SUCCESS = '[User] Remove User Success';
export const REMOVE_USER_FAIL = '[User] Remove User Fail';

export class CreateUser implements Action {
    readonly type = CREATE_USER;
    constructor(public payload: any) {}
  }
  
  export class CreateUserSuccess implements Action {
    readonly type = CREATE_USER_SUCCESS;
    constructor(public payload: any) {}
  }
  
  export class CreateUserFail implements Action {
    readonly type = CREATE_USER_FAIL;
    constructor(public payload: any) {}
  }

  export class UpdateUser implements Action {
    readonly type = UPDATE_USER;
    constructor(public payload: any) {}
  }
  
  export class UpdateUserSuccess implements Action {
    readonly type = UPDATE_USER_SUCCESS;
    constructor(public payload: any) {}
  }
  
  export class UpdateUserFail implements Action {
    readonly type = UPDATE_USER_FAIL;
    constructor(public payload: any) {}
  }

  export class RemoveUser implements Action {
    readonly type = REMOVE_USER;
    constructor(public payload: any) {}
  }
  
  export class RemoveUserSuccess implements Action {
    readonly type = REMOVE_USER_SUCCESS;
    constructor(public payload: any) {}
  }
  
  export class RemoveUserFail implements Action {
    readonly type = REMOVE_USER_FAIL;
    constructor(public payload: any) {}
  }

  export type AdminAction = CreateUser | CreateUserSuccess | CreateUserFail |
  UpdateUser | UpdateUserSuccess | UpdateUserFail |
  RemoveUser | RemoveUserSuccess | RemoveUserFail ;
