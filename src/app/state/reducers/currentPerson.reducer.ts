import * as currentPerson from '../actions/currentPerson.action';
import {Person} from '../../models/Person';
import {User} from '../../models/User';


export interface CurrentPersonState {
    currentPersonLoading: boolean;
    currentPersonLoaded: boolean;
    currentPerson: Person | null;
    users: User[];

  }
  
  export const initialState: CurrentPersonState = {
    currentPersonLoading: false,
    currentPersonLoaded: false,
    currentPerson: null,
    users: [],
  };
  
  export function reducer(
    state = initialState,
    action: currentPerson.CurrentPersonAction
  ): CurrentPersonState {
    switch (action.type) {
      case currentPerson.UPDATE_PERSON:{
        return {
          ...state,
          currentPersonLoaded: false,
          currentPersonLoading: true
        };
      }
      case currentPerson.UPDATE_PERSON_SUCCESS: {
        return {
          ...state,
          currentPerson: action.payload,
          currentPersonLoaded: true,
          currentPersonLoading: false
        };
      }
      case currentPerson.UPDATE_USERS_SUCCESS: {
        return {
          ...state,
          users: action.payload,       
       };
      }
      default:
        return state;
    }
  }
  
  export const getCurrentPerson = (state: CurrentPersonState) => state.currentPerson;
  export const getCurrentPersonLoaded = (state: CurrentPersonState) => state.currentPersonLoaded;
  export const getCurrentPersonLoading = (state: CurrentPersonState) => state.currentPersonLoading;

export const getCurrentPersonPersonNbr = (state: CurrentPersonState) => state.currentPerson?.personNbr;
export const getCurrentPersonName = (state: CurrentPersonState) => ( state.currentPerson?.firstName , state.currentPerson?.lastName);
export const getCurrentPersonStatus = (state: CurrentPersonState) => state.currentPerson?.status;
export const getCurrentPersonChangedBy = (state: CurrentPersonState) => state.currentPerson?.changedBy;
export const getCurrentPersonChangedOn = (state: CurrentPersonState) => state.currentPerson?.changedOn;

export const getCurrentUsers = (state: CurrentPersonState) => state.users;
