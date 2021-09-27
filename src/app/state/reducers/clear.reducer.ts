import * as LoginAction from '../actions/login.action';
import {Action, ActionReducer, INIT} from '@ngrx/store';
import {State} from './index';


export const clearMetaReducer= (
    reducer: ActionReducer<State>
    ): ActionReducer<State> =>{
    return function(state, action) {
       if(action.type === LoginAction.LOGOUT_SUCCESS) {
         return reducer(undefined, action);
       }
       return reducer(state, action);
    }
 }; 

 