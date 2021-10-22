import {Action} from '@ngrx/store';
import {User} from '../.././models/User';

export const LOAD_CURRENT_USER = '[Current User] Load Current User';
export const LOAD_CURRENT_USER_SUCCESS = '[Current User] Load Current User Success';
export const LOAD_CURRENT_USER_FAIL = '[Current User] Load Current User Fail';


export class LoadCurrentUser implements Action {
    readonly type = LOAD_CURRENT_USER;
  
    constructor(public payload: string) {}
  }
  
  export class LoadCurrentUserSuccess implements Action {
    readonly type = LOAD_CURRENT_USER_SUCCESS;
  
    constructor(public payload: User) {}
  }
  
  export class LoadCurrentUserFail implements Action {
    readonly type = LOAD_CURRENT_USER_FAIL;
  
    constructor(public payload: any) {}
  }
  

  export type CurrentUserAction =
  | LoadCurrentUser | LoadCurrentUserSuccess | LoadCurrentUserFail;