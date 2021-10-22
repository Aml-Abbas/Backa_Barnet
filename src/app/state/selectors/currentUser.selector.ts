import {createSelector} from '@ngrx/store';
import * as fromFeature from '../reducers';
import * as fromCurrentUser from '../reducers/currentUser.reducer';


export const getCurrentUserState = createSelector(
  fromFeature.getState,
  (state: fromFeature.State) => state.currentUser
);

export const getCurrentUserLoading = createSelector(
  getCurrentUserState,
  fromCurrentUser.getCurrentUserLoading
);


export const getCurrentUserLoaded = createSelector(
  getCurrentUserState,
  fromCurrentUser.getCurrentUserLoaded
);


export const getCurrentUser = createSelector(
  getCurrentUserState,
  fromCurrentUser.getCurrentUser
);
export const getCurrentUserID = createSelector(
  getCurrentUserState,
  fromCurrentUser.getCurrentUserID
);
export const getCurrentUserRoleID= createSelector(
  getCurrentUserState,
  fromCurrentUser.getCurrentUserRoleID
);
export const getCurrentUserLastName = createSelector(
  getCurrentUserState,
  fromCurrentUser.getCurrentUserLastName
);
export const getCurrentUserFirstName = createSelector(
  getCurrentUserState,
  fromCurrentUser.getCurrentUserFirstName
);
export const getCurrentUserDescription = createSelector(
  getCurrentUserState,
  fromCurrentUser.getCurrentUserDescription
);

export const getCurrentUserEmail = createSelector(
  getCurrentUserState,
  fromCurrentUser.getCurrentUserEmail
);