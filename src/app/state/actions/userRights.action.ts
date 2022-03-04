import { Action } from '@ngrx/store';
import { UserRight } from '../../models/UserRight';

export const CREATE_USER_RIGHT = '[User Right] Create User Right';
export const CREATE_USER_RIGHT_SUCCESS = '[User Right] Create User Right Success';
export const CREATE_USER_RIGHT_FAIL = '[User Right] Create User Right Fail';

export const UPDATE_USER_RIGHTS = '[User Rights] Update User Rights';
export const UPDATE_USER_RIGHTS_SUCCESS = '[User Rights] Update User Rights Success';
export const UPDATE_USER_RIGHTS_FAIL = '[User Rights] Update User Rights Fail';

export const UPDATE_USER_RIGHT = '[User Right] Update User Right';
export const UPDATE_USER_RIGHT_SUCCESS = '[User Right] Update User Right Success';
export const UPDATE_USER_RIGHT_FAIL = '[User Right] Update User Right Fail';

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
  
  
  export type UserRightsAction =
  CreateUserRight | CreateUserRightSuccess | CreateUserRightFail |
  UpdateUserRights | UpdateUserRightsSuccess | UpdateUserRightsFail |
  UpdateUserRight | UpdateUserRightSuccess | UpdateUserRightFail ;
