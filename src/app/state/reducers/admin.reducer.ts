import * as admin from '../actions/admin.action';
import {User} from '../../models/User';
import { Barnteam } from 'src/app/models/Barnteam';


export interface CurrentAdminState {
    currentAdminUser: User | null;
    currentAdminBarnteam: Barnteam | null;
    teams: Barnteam[];
  }
  
  export const initialState: CurrentAdminState = {
    currentAdminUser: null,
    currentAdminBarnteam: null,
    teams:[],
  };
  
  export function reducer(
    state = initialState,
    action: admin.AdminAction
  ): CurrentAdminState {
    switch (action.type) {
      case admin.UPDATE_ADMIN_USER_SUCCESS: {
        return {
          ...state,
          currentAdminUser: action.payload,       
       };
      }
      case admin.UPDATE_ADMIN_BARNTEAM_SUCCESS: {
        return {
          ...state,
          currentAdminBarnteam: action.payload,       
       };
      }case admin.UPDATE_TEAMS_SUCCESS: {
        return {
          ...state,
          teams: action.payload,       
       };
      }
      default:
        return state;
    }
  }
  
export const getCurrentAdminUser = (state: CurrentAdminState) => state.currentAdminUser;
export const getCurrentAdminBarnteam = (state: CurrentAdminState) => state.currentAdminBarnteam;
export const getCurrentTeams = (state: CurrentAdminState) => state.teams;
