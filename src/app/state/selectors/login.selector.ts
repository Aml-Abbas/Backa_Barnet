import {createSelector} from '@ngrx/store';
import * as fromFeature from '../reducers';
import * as fromLogin from '../reducers/login.reducer';


export const getLoginState = createSelector(
    fromFeature.getState,
    (state: fromFeature.State) => state.Login
  );
  
  export const getLoginPending = createSelector(getLoginState, fromLogin.getPending);
  export const getLoggedIn = createSelector(getLoginState, fromLogin.getLoggedIn);
  
  export const getPersons = createSelector(getLoginState, fromLogin.getPersons);
