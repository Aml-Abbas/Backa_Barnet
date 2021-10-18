import {User} from '../../models/User';
import * as userActions from '../actions/currentUser.action';

export interface CurrentUserState {
  currentUserLoading: boolean;
  currentUserLoaded: boolean;
  currentUser: User | null;
}

export const initialState: CurrentUserState = {
  currentUserLoading: false,
  currentUserLoaded: false,
  currentUser: null,
};

export function reducer(
  state = initialState,
  action: userActions.CurrentUserAction
): CurrentUserState {
  switch (action.type) {
    case userActions.LOAD_CURRENT_USER: {
      return {
        ...state,
        currentUserLoaded: false,
        currentUserLoading: true
      };
    }
    case userActions.LOAD_CURRENT_USER_SUCCESS: {
      return {
        ...state,
        currentUserLoaded: true,
        currentUserLoading: false,
        currentUser: action.payload
      };
    }
    case userActions.LOAD_CURRENT_USER_FAIL: {
      return {
        ...state,
        currentUserLoaded: false,
        currentUserLoading: false,
        currentUser: null,
      };
    }
    default:
      return state;
  }
}

export const getCurrentUser = (state: CurrentUserState) => state.currentUser;
export const getCurrentUserLoaded = (state: CurrentUserState) => state.currentUserLoaded;
export const getCurrentUserLoading = (state: CurrentUserState) => state.currentUserLoading;
export const getCurrentUserPersonID = (state: CurrentUserState) => state.currentUser?.personID;
export const getCurrentUserPersonNr = (state: CurrentUserState) => state.currentUser?.personNr;
export const getCurrentUserLastName = (state: CurrentUserState) => state.currentUser?.lastName;
export const getCurrentUserFirstName = (state: CurrentUserState) => state.currentUser?.firstName;
export const getCurrentUserPersonRoleId = (state: CurrentUserState) => state.currentUser?.personRoleID;
export const getCurrentUserPersonTypeId = (state: CurrentUserState) => state.currentUser?.personTypeID;
export const getCurrentUserEmail = (state: CurrentUserState) => state.currentUser?.email;
export const getCurrentUserOrganisation = (state: CurrentUserState) => state.currentUser?.organisation;
export const getCurrentUserTitle = (state: CurrentUserState) => state.currentUser?.title;
