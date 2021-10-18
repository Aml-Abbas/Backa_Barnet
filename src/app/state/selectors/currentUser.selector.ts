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
export const getCurrentUserPersonID = createSelector(
  getCurrentUserState,
  fromCurrentUser.getCurrentUserPersonID
);
export const getCurrentUserPersonNr = createSelector(
  getCurrentUserState,
  fromCurrentUser.getCurrentUserPersonNr
);
export const getCurrentUserLastName = createSelector(
  getCurrentUserState,
  fromCurrentUser.getCurrentUserLastName
);
export const getCurrentUserFirstName = createSelector(
  getCurrentUserState,
  fromCurrentUser.getCurrentUserFirstName
);
export const getCurrentUserPersonRoleId = createSelector(
  getCurrentUserState,
  fromCurrentUser.getCurrentUserPersonRoleId
);
export const getCurrentUserPersonTypeId = createSelector(
  getCurrentUserState,
  fromCurrentUser.getCurrentUserPersonTypeId
);

export const getCurrentUserEmail = createSelector(
  getCurrentUserState,
  fromCurrentUser.getCurrentUserEmail
);


export const getCurrentUserOrganisation = createSelector(
    getCurrentUserState,
    fromCurrentUser.getCurrentUserOrganisation
  );
  
export const getCurrentUserTitle = createSelector(
    getCurrentUserState,
    fromCurrentUser.getCurrentUserTitle
  );