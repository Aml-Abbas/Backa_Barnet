import { Action } from '@ngrx/store';
import { Person } from 'src/app/models/Person';


export const LOGIN = '[Login] Login';
export const LOGIN_SUCCESS = '[Login] Login Success';
export const LOGIN_FAIL = '[Login] Login Fail';

export const LOGOUT = '[Logout] Logout';
export const LOGOUT_SUCCESS = '[Logout] Logout Success';
export const LOGOUT_FAIL = '[Logout] Logout Fail';

export class Login implements Action {
  readonly type = LOGIN;
  constructor(public payload: {email: string; password: string}) {
  }
}

export class LoginSuccess implements Action {
  readonly type = LOGIN_SUCCESS;
  constructor(public payload: Person[]) {
    console.log('in success action');
    console.log(payload);
  }
}

export class LoginFail implements Action {
  readonly type = LOGIN_FAIL;
  constructor(public payload: any) {}
}

export class Logout implements Action {
  readonly type = LOGOUT;
}

export class LogoutSuccess implements Action {
  readonly type = LOGOUT_SUCCESS;
}

export class LogoutFail implements Action {
  readonly type = LOGOUT_FAIL;
}


export type LoginAction = Login | LoginSuccess | LoginFail 
                            | Logout | LogoutSuccess | LogoutFail;
