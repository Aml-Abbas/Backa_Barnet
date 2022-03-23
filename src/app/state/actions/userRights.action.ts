import { Action } from '@ngrx/store';
import { UserRight } from '../../models/UserRight';

export const CREATE_USER_RIGHT = '[User Right] Create User Right';
export const CREATE_USER_RIGHT_SUCCESS = '[User Right] Create User Right Success';
export const CREATE_USER_RIGHT_FAIL = '[User Right] Create User Right Fail';

export const UPDATE_USER_RIGHTS = '[User Rights] Update User Rights';
export const UPDATE_USER_RIGHTS_SUCCESS = '[User Rights] Update User Rights Success';
export const UPDATE_USER_RIGHTS_FAIL = '[User Rights] Update User Rights Fail';

export const UPDATE_USER_PERMISSION = '[User Permission] Update User Permission';
export const UPDATE_USER_PERMISSION_SUCCESS = '[User Permission] Update User Permission Success';
export const UPDATE_USER_PERMISSION_FAIL = '[User Permission] Update User Permission Fail';

export const UPDATE_USER_RIGHT = '[User Right] Update User Right';
export const UPDATE_USER_RIGHT_SUCCESS = '[User Right] Update User Right Success';
export const UPDATE_USER_RIGHT_FAIL = '[User Right] Update User Right Fail';

export const REMOVE_USER_RIGHT = '[User Right] Remove User Right';
export const REMOVE_USER_RIGHT_SUCCESS = '[User Right] Remove User Right Success';
export const REMOVE_USER_RIGHT_FAIL = '[User Right] Remove User Right Fail';

export class CreateUserRight implements Action {
  readonly type = CREATE_USER_RIGHT;
  constructor(public CurrentUserID: number,public UserID: number,public PersonID: number,public Type: number) { }
}

export class CreateUserRightSuccess implements Action {
  readonly type = CREATE_USER_RIGHT_SUCCESS;
  constructor(public payload: any) { }
}

export class CreateUserRightFail implements Action {
  readonly type = CREATE_USER_RIGHT_FAIL;
  constructor(public payload: any) { }
}

export class UpdateUserRights implements Action {
    readonly type = UPDATE_USER_RIGHTS;
    constructor(public payload: UserRight[]) { }
  }
  
  export class UpdateUserRightsSuccess implements Action {
    readonly type = UPDATE_USER_RIGHTS_SUCCESS;
    constructor(public payload: UserRight[]) { }
  }
  
  export class UpdateUserRightsFail implements Action {
    readonly type = UPDATE_USER_RIGHTS_FAIL;
    constructor(public payload: any) { }
  }

  export class UpdateUserRight implements Action {
    readonly type = UPDATE_USER_RIGHT;
    constructor(public payload: UserRight | null) { }
  }
  
  export class UpdateUserRightSuccess implements Action {
    readonly type = UPDATE_USER_RIGHT_SUCCESS;
    constructor(public payload: UserRight | null) { }
  }
  
  export class UpdateUserRightFail implements Action {
    readonly type = UPDATE_USER_RIGHT_FAIL;
    constructor(public payload: any) { }
  }
  
  export class RemoveUserRigh implements Action {
    readonly type = REMOVE_USER_RIGHT;
    constructor(public payload: any) { }
  }
  
  export class RemoveUserRighSuccess implements Action {
    readonly type = REMOVE_USER_RIGHT_SUCCESS;
    constructor(public payload: any) { }
  }
  
  export class RemoveUserRighFail implements Action {
    readonly type = REMOVE_USER_RIGHT_FAIL;
    constructor(public payload: any) { }
  }
  
  export class UpdateUserPermission implements Action {
    readonly type = UPDATE_USER_PERMISSION;
    constructor(public payload: UserRight[]) { }
  }
  
  export class UpdateUserPermissionSuccess implements Action {
    readonly type = UPDATE_USER_PERMISSION_SUCCESS;
    constructor(public payload: UserRight[]) { }
  }
  
  export class UpdateUserPermissionFail implements Action {
    readonly type = UPDATE_USER_PERMISSION_FAIL;
    constructor(public payload: any) { }
  }

  export type UserRightsAction =
  CreateUserRight | CreateUserRightSuccess | CreateUserRightFail |
  UpdateUserRights | UpdateUserRightsSuccess | UpdateUserRightsFail |
  UpdateUserPermission | UpdateUserPermissionSuccess | UpdateUserPermissionFail |
  RemoveUserRigh | RemoveUserRighSuccess | RemoveUserRighFail |
  UpdateUserRight | UpdateUserRightSuccess | UpdateUserRightFail ;
