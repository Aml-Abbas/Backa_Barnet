import * as currentPerson from '../actions/currentPerson.action';
import {Person} from '../../models/Person';


export interface CurrentPersonState {
    currentPersonLoading: boolean;
    currentPersonLoaded: boolean;
    currentPerson: Person | null;
  }
  
  export const initialState: CurrentPersonState = {
    currentPersonLoading: false,
    currentPersonLoaded: false,
    currentPerson: null,
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
      default:
        return state;
    }
  }
  
  export const getCurrentPerson = (state: CurrentPersonState) => state.currentPerson;
  export const getCurrentPersonLoaded = (state: CurrentPersonState) => state.currentPersonLoaded;
  export const getCurrentPersonLoading = (state: CurrentPersonState) => state.currentPersonLoading;

export const getCurrentPersonPersonID = (state: CurrentPersonState) => state.currentPerson?.personID;
export const getCurrentPersonPersonNr = (state: CurrentPersonState) => state.currentPerson?.personNr;
export const getCurrentPersonName = (state: CurrentPersonState) => ( state.currentPerson?.firstName , state.currentPerson?.lastName);
export const getCurrentPersonCity = (state: CurrentPersonState) => state.currentPerson?.city;
export const getCurrentPersonAddress = (state: CurrentPersonState) => state.currentPerson?.address;
export const getCurrentPersonRoleID = (state: CurrentPersonState) => state.currentPerson?.personRoleID;
export const getCurrentPersonTypeID = (state: CurrentPersonState) => state.currentPerson?.personTypeID;
export const getCurrentPersonCreateBy = (state: CurrentPersonState) => state.currentPerson?.createBy;
export const getCurrentPersonCreateDate = (state: CurrentPersonState) => state.currentPerson?.createDate;
export const getCurrentPersonChangeBy = (state: CurrentPersonState) => state.currentPerson?.changeBy;
export const getCurrentPersonChangeDate = (state: CurrentPersonState) => state.currentPerson?.changeDate;
