
import {createSelector} from '@ngrx/store';
import * as fromFeature from '../reducers';
import * as fromAdmin from '../reducers/admin.reducer';

export const getAdminState = createSelector(
  fromFeature.getState,
  (state: fromFeature.State) => state.admin
);


export const getCurrentAdminUser = createSelector(
  getAdminState,
  fromAdmin.getCurrentAdminUser
);

export const getCurrentAdminBarnteam = createSelector(
  getAdminState,
  fromAdmin.getCurrentAdminBarnteam
);

export const getCurrentTeams = createSelector(
  getAdminState,
  fromAdmin.getCurrentTeams
);
