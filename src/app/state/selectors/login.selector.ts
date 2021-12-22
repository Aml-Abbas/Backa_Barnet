import { createSelector } from '@ngrx/store';
import * as fromFeature from '../reducers';
import * as fromLogin from '../reducers/login.reducer';


export const getLoginState = createSelector(
  fromFeature.getState,
  (state: fromFeature.State) => state.Login
);

export const getLoginPending = createSelector(getLoginState, fromLogin.getPending);
export const getLoggedIn = createSelector(getLoginState, fromLogin.getLoggedIn);


export const getCurrentUser = createSelector(
  getLoginState,
  fromLogin.getCurrentUser
);
export const getCurrentUserID = createSelector(
  getLoginState,
  fromLogin.getCurrentUserID
);
export const getCurrentUserRoleID = createSelector(
  getLoginState,
  fromLogin.getCurrentUserRoleID
);
export const getCurrentUserLastName = createSelector(
  getLoginState,
  fromLogin.getCurrentUserLastName
);
export const getCurrentUserFirstName = createSelector(
  getLoginState,
  fromLogin.getCurrentUserFirstName
);
export const getCurrentUserDescription = createSelector(
  getLoginState,
  fromLogin.getCurrentUserDescription
);

export const getCurrentUserEmail = createSelector(
  getLoginState,
  fromLogin.getCurrentUserEmail
);
 // export const getPersons = createSelector(getLoginState, fromLogin.getPersons);
