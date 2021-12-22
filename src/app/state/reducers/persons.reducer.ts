import { Person } from '../../models/Person';
import * as pesonsAction from '../actions/persons.action';

export interface PersonsState {
  personsLoading: boolean;
  personsLoaded: boolean;
  persons: Person[];
}

export const initialState: PersonsState = {
  personsLoading: false,
  personsLoaded: false,
  persons: [],
};

export function reducer(
  state = initialState,
  action: pesonsAction.PersonsAction
): PersonsState {
  switch (action.type) {
    case pesonsAction.LOAD_PERSONS: {
      return {
        ...state,
        personsLoaded: false,
        personsLoading: true
      };
    }
    case pesonsAction.LOAD_PERSONS_SUCCESS: {
      return {
        ...state,
        personsLoaded: true,
        personsLoading: false,
        persons: action.payload
      };
    }
    case pesonsAction.LOAD_PERSONS_FAIL: {
      return {
        ...state,
        personsLoaded: false,
        personsLoading: false,
        persons: [],
      };
    }
    default:
      return state;
  }
}

export const getPersons = (state: PersonsState) => state.persons;
export const getPersonsLoading = (state: PersonsState) => state.personsLoading;
export const getPersonsLoaded = (state: PersonsState) => state.personsLoaded;
