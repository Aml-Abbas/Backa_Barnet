import { createSelector } from '@ngrx/store';
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

export const getCurrentPersonName = createSelector(
  getCurrentPersonState,
  fromCurrentPerson.getCurrentPersonName
);
export const getCurrentPersonPersonNbr = createSelector(
  getCurrentPersonState,
  fromCurrentPerson.getCurrentPersonName
);

export const getCurrentPersonStatus = createSelector(
  getCurrentPersonState,
  fromCurrentPerson.getCurrentPersonStatus
);
export const getCurrentPersonChangedBy = createSelector(
  getCurrentPersonState,
  fromCurrentPerson.getCurrentPersonChangedBy
);
export const getCurrentPersonChangedOn = createSelector(
  getCurrentPersonState,
  fromCurrentPerson.getCurrentPersonChangedOn
);

export const getCurrentUsers = createSelector(
  getCurrentPersonState,
  fromCurrentPerson.getCurrentUsers
);
