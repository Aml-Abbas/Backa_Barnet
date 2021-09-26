import {createSelector} from '@ngrx/store';
import * as fromFeature from '../reducers';
import * as fromCurrentPerson from '../reducers/currentPerson.reducer';

export const getCurrentPersonState = createSelector(
  fromFeature.getState,
  (state: fromFeature.State) => state.currentPerson
);

export const getCurrentPersonLoading = createSelector(
  getCurrentPersonState,
  fromCurrentPerson.getCurrentPersonLoading
);


export const getCurrentPersonLoaded = createSelector(
  getCurrentPersonState,
  fromCurrentPerson.getCurrentPersonLoaded
);


export const getCurrentPerson = createSelector(
  getCurrentPersonState,
  fromCurrentPerson.getCurrentPerson
);

export const getCurrentPersonPersonID = createSelector(
  getCurrentPersonState,
  fromCurrentPerson.getCurrentPersonPersonID
);
export const getCurrentPersonName = createSelector(
  getCurrentPersonState,
  fromCurrentPerson.getCurrentPersonName
);
export const getCurrentPersonPersonNr = createSelector(
  getCurrentPersonState,
  fromCurrentPerson.getCurrentPersonPersonNr
);
export const getCurrentPersonCity = createSelector(
  getCurrentPersonState,
  fromCurrentPerson.getCurrentPersonCity
);
export const getCurrentPersonAddress = createSelector(
  getCurrentPersonState,
  fromCurrentPerson.getCurrentPersonAddress
);
export const getCurrentPersonRoleID = createSelector(
  getCurrentPersonState,
  fromCurrentPerson.getCurrentPersonRoleID
);

export const getCurrentPersonTypeID = createSelector(
  getCurrentPersonState,
  fromCurrentPerson.getCurrentPersonTypeID
);
export const getCurrentPersonCreateBy = createSelector(
  getCurrentPersonState,
  fromCurrentPerson.getCurrentPersonCreateBy
);
export const getCurrentPersonCreateDate = createSelector(
  getCurrentPersonState,
  fromCurrentPerson.getCurrentPersonCreateDate
);
export const getCurrentPersonChangeBy = createSelector(
  getCurrentPersonState,
  fromCurrentPerson.getCurrentPersonChangeBy
);
export const getCurrentPersonChangeDate = createSelector(
  getCurrentPersonState,
  fromCurrentPerson.getCurrentPersonChangeDate
);
