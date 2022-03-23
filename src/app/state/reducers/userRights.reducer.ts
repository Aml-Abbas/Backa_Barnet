import * as userRights from '../actions/userRights.action';
import { UserRight } from '../../models/UserRight';


export interface UserRightsState {
  userRights: UserRight[];
  userPermission: UserRight[];
  userRight: UserRight | null;
}

export const initialState: UserRightsState = {
    userRights: [],
    userPermission: [],
    userRight: null,
};

export function reducer(
  state = initialState,
  action: userRights.UserRightsAction
): UserRightsState {
  switch (action.type) {
    case userRights.UPDATE_USER_RIGHTS_SUCCESS: {
      return {
        ...state,
        userRights: action.payload,
      };
    }
    case userRights.UPDATE_USER_PERMISSION_SUCCESS: {
      return {
        ...state,
        userPermission: action.payload,
      };
    }

    case userRights.UPDATE_USER_RIGHT_SUCCESS: {
      return {
        ...state,
        userRight: action.payload,
      };
    }

    default:
      return state;
  }
}

export const getUserRights = (state: UserRightsState) => state.userRights;
export const getUserRight = (state: UserRightsState) => state.userRight;
export const getUserPermission = (state: UserRightsState) => state.userPermission;
