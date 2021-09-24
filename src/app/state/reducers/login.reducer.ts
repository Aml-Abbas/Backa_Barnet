 import * as fromLogin from '../actions/login.action';
 import { Person } from 'src/app/models/Person';


export interface LoginState {
    pending: boolean;
    loggedIn: boolean;
    response: Person[] | null;
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
        console.log('in success reducer');
        console.log(action.payload);    
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
  
  export const getPersons = (state: LoginState) => state.response;
  export const getPending = (state: LoginState) => state.pending;
  export const getLoggedIn = (state: LoginState) => state.loggedIn;
  