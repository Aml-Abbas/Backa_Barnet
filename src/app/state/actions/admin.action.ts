import { Action } from '@ngrx/store';
import {User} from '../../models/User';
import {Barnteam} from '../../models/Barnteam';

export const CREATE_USER = '[User] Create User';
export const CREATE_USER_SUCCESS = '[User] Create User Success';
export const CREATE_USER_FAIL = '[User] Create User Fail';

export const UPDATE_USER = '[User] Update User';
export const UPDATE_USER_SUCCESS = '[User] Update User Success';
export const UPDATE_USER_FAIL = '[User] Update User Fail';

export const REMOVE_USER = '[User] Remove User';
export const REMOVE_USER_SUCCESS = '[User] Remove User Success';
export const REMOVE_USER_FAIL = '[User] Remove User Fail';

export const UPDATE_ADMIN_USER = '[Current Admin User] Update Admin User';
export const UPDATE_ADMIN_USER_SUCCESS = '[Current Admin User] Update Admin User Success';
export const UPDATE_ADMIN_USER_FAIL = '[Current Admin User] Update Admin User Fail';

export const CREATE_BARNTEAM = '[Barnteam] Create Barnteam';
export const CREATE_BARNTEAM_SUCCESS = '[Barnteam] Create Barnteam Success';
export const CREATE_BARNTEAM_FAIL = '[Barnteam] Create Barnteam Fail';

export const UPDATE_BARNTEAM = '[Barnteam] Update Barnteam';
export const UPDATE_BARNTEAM_SUCCESS = '[Barnteam] Update Barnteam Success';
export const UPDATE_BARNTEAM_FAIL = '[Barnteam] Update Barnteam Fail';

export const REMOVE_BARNTEAM = '[Barnteam] Remove Barnteam';
export const REMOVE_BARNTEAM_SUCCESS = '[Barnteam] Remove Barnteam Success';
export const REMOVE_BARNTEAM_FAIL = '[Barnteam] Remove Barnteam Fail';

export const UPDATE_ADMIN_BARNTEAM = '[Current Admin Barnteam] Update Admin Barnteam';
export const UPDATE_ADMIN_BARNTEAM_SUCCESS = '[Current Admin Barnteam] Update Admin Barnteam Success';
export const UPDATE_ADMIN_BARNTEAM_FAIL = '[Current Admin Barnteam] Update Admin Barnteam Fail';

export const UPDATE_TEAMS = '[Teams] Update Teams';
export const UPDATE_TEAMS_SUCCESS = '[Teams] Update Teams Success';
export const UPDATE_TEAMS_FAIL = '[Teams] Update Teams Fail';

export class CreateUser implements Action {
    readonly type = CREATE_USER;
    constructor(public payload: any) {}
  }
  
  export class CreateUserSuccess implements Action {
    readonly type = CREATE_USER_SUCCESS;
    constructor(public payload: any) {}
  }
  
  export class CreateUserFail implements Action {
    readonly type = CREATE_USER_FAIL;
    constructor(public payload: any) {}
  }

  export class UpdateUser implements Action {
    readonly type = UPDATE_USER;
    constructor(public payload: any) {}
  }
  
  export class UpdateUserSuccess implements Action {
    readonly type = UPDATE_USER_SUCCESS;
    constructor(public payload: any) {}
  }
  
  export class UpdateUserFail implements Action {
    readonly type = UPDATE_USER_FAIL;
    constructor(public payload: any) {}
  }

  export class RemoveUser implements Action {
    readonly type = REMOVE_USER;
    constructor(public payload: any) {}
  }
  
  export class RemoveUserSuccess implements Action {
    readonly type = REMOVE_USER_SUCCESS;
    constructor(public payload: any) {}
  }
  
  export class RemoveUserFail implements Action {
    readonly type = REMOVE_USER_FAIL;
    constructor(public payload: any) {}
  }

  export class UpdateAdminUser implements Action {
    readonly type = UPDATE_ADMIN_USER;
    constructor(public payload: User | null) {}
  }
  
  export class UpdateAdminUserSuccess implements Action {
    readonly type = UPDATE_ADMIN_USER_SUCCESS;
    constructor(public payload: User | null) {}
  }
  
  export class UpdateAdminUserFail implements Action {
    readonly type = UPDATE_ADMIN_USER_FAIL;
    constructor(public payload: any) {}
  }

  export class CreateBarnteam implements Action {
    readonly type = CREATE_BARNTEAM;
    constructor(public payload: any) {}
  }
  
  export class CreateBarnteamSuccess implements Action {
    readonly type = CREATE_BARNTEAM_SUCCESS;
    constructor(public payload: any) {}
  }
  
  export class CreateBarnteamFail implements Action {
    readonly type = CREATE_BARNTEAM_FAIL;
    constructor(public payload: any) {}
  }

  export class UpdateBarnteam implements Action {
    readonly type = UPDATE_BARNTEAM;
    constructor(public payload: any) {}
  }
  
  export class UpdateBarnteamSuccess implements Action {
    readonly type = UPDATE_BARNTEAM_SUCCESS;
    constructor(public payload: any) {}
  }
  
  export class UpdateBarnteamFail implements Action {
    readonly type = UPDATE_BARNTEAM_FAIL;
    constructor(public payload: any) {}
  }

  export class RemoveBarnteam implements Action {
    readonly type = REMOVE_BARNTEAM;
    constructor(public payload: any) {}
  }
  
  export class RemoveBarnteamSuccess implements Action {
    readonly type = REMOVE_BARNTEAM_SUCCESS;
    constructor(public payload: any) {}
  }
  
  export class RemoveBarnteamFail implements Action {
    readonly type = REMOVE_BARNTEAM_FAIL;
    constructor(public payload: any) {}
  }

  export class UpdateAdminBarnteam implements Action {
    readonly type = UPDATE_ADMIN_BARNTEAM;
    constructor(public payload: Barnteam | null) {}
  }
  
  export class UpdateAdminBarnteamSuccess implements Action {
    readonly type = UPDATE_ADMIN_BARNTEAM_SUCCESS;
    constructor(public payload: Barnteam | null) {}
  }
  
  export class UpdateAdminBarnteamFail implements Action {
    readonly type = UPDATE_ADMIN_BARNTEAM_FAIL;
    constructor(public payload: any) {}
  }

  export class UpdateTeams implements Action {
    readonly type = UPDATE_TEAMS;
    constructor(public payload: Barnteam[]) {}
  }
  
  export class UpdateTeamsSuccess implements Action {
    readonly type = UPDATE_TEAMS_SUCCESS;
    constructor(public payload: Barnteam[]) {}
  }
  
  export class UpdateTeamsFail implements Action {
    readonly type = UPDATE_TEAMS_FAIL;
    constructor(public payload: any) {}
  }

  export type AdminAction = 
  CreateUser | CreateUserSuccess | CreateUserFail |
  UpdateUser | UpdateUserSuccess | UpdateUserFail |
  RemoveUser | RemoveUserSuccess | RemoveUserFail |
  UpdateAdminUser | UpdateAdminUserSuccess | UpdateAdminUserFail|

  CreateBarnteam | CreateBarnteamSuccess | CreateBarnteamFail |
  UpdateBarnteam | UpdateBarnteamSuccess | UpdateBarnteamFail |
  RemoveBarnteam | RemoveBarnteamSuccess | RemoveBarnteamFail |
  UpdateAdminBarnteam | UpdateAdminBarnteamSuccess | UpdateAdminBarnteamFail |
  UpdateTeams | UpdateTeamsSuccess | UpdateTeamsFail;

