/* import {createSelector} from '@ngrx/store';
import * as fromFeature from '../reducers';
import * as fromLogin from '../reducers/login.reducer';


export const getBuyerLoginState = createSelector(
    fromFeature.getState,
    (state: fromFeature.State) => state.Login
  );
  
  export const getBuyerLoginPending = createSelector(getBuyerLoginState, fromLogin.getPending);
  export const getBuyerLoggedIn = createSelector(getBuyerLoginState, fromLogin.getLoggedIn);
  
  export const getBuyerAuthResponse = createSelector(getBuyerLoginState, fromLogin.getAuthResponse);
  
  export const getBuyerToken = createSelector(getBuyerLoginState, fromLogin.getToken);
  export const getBuyerAuthEmail = createSelector(getBuyerLoginState, fromLogin.getAuthEmail);
   */