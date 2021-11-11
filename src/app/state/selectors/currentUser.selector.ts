import {createSelector} from '@ngrx/store';
import * as fromFeature from '../reducers';
import * as fromPersons from '../reducers/persons.reducer';


export const getPersonsState = createSelector(
  fromFeature.getState,
  (state: fromFeature.State) => state.persons
);

export const getCurrentUserLoading = createSelector(
  getPersonsState,
  fromPersons.getPersonsLoading
);


export const getCurrentUserLoaded = createSelector(
  getPersonsState,
  fromPersons.getPersonsLoaded
);

export const getPersons = createSelector(
  getPersonsState,
  fromPersons.getPersons
);