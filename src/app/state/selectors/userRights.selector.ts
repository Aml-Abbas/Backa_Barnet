
import { createSelector } from '@ngrx/store';
import * as fromFeature from '../reducers';
import * as fromUserRights from '../reducers/userRights.reducer';

export const getUserRightsState = createSelector(
  fromFeature.getState,
  (state: fromFeature.State) => state.userRights
);

export const getUserRights = createSelector(
    getUserRightsState,
    fromUserRights.getUserRights
  );

  export const getUserRight = createSelector(
    getUserRightsState,
    fromUserRights.getUserRight
  );

  export const getUserPermission = createSelector(
    getUserRightsState,
    fromUserRights.getUserPermission
  );