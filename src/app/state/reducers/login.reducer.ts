/* import * as fromLogin from '../actions/login.action';


export interface LoginState {
    pending: boolean;
    loggedIn: boolean;
    response: AuthResponse | null;
  }
  
  export const initialState: LoginState = {
    pending: false,
    loggedIn: false,
    response: null,
  };
  
  export function reducer(
    state = initialState,
    action: fromLogin.LoginAction
  ): LoginState {
    switch (action.type) {
      case fromLogin.LOGIN: {
        return {
          ...state,
          pending: true,
          loggedIn: false,
        };
      }
      case fromLogin.LOGIN_SUCCESS: {
        return {
          ...state,
          pending: false,
          loggedIn: true,
          response: action.payload,
        };
      }
      case fromLogin.LOGOUT_SUCCESS:
      case fromLogin.LOGIN_FAIL:
      {
        return {
          ...state,
          pending: false,
          loggedIn: false,
          response: null
        };
      }
      default:
        return state;
    }
  }
  
  export const getAuthResponse = (state: LoginState) => state.response;
  export const getPending = (state: LoginState) => state.pending;
  export const getLoggedIn = (state: LoginState) => state.loggedIn && state.response?.roles === constants.ROLE_BUYER;
  export const getToken = (state: LoginState) => state.response?.Authorization;
  export const getAuthEmail = (state: LoginState) => state.response?.email;
   */