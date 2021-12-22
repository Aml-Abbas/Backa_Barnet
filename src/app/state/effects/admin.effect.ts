import { Injectable } from '@angular/core';
import * as adminAction from '../actions/admin.action';
import { map, switchMap, catchError } from 'rxjs/operators';
import { of } from 'rxjs';
import { Actions, createEffect, ofType } from '@ngrx/effects';
import * as fromRoot from '../../../app/state';
import { AdminService } from 'src/app/services/admin/admin.service';

@Injectable()
export class AdminEffect {
  constructor(private actions$: Actions,
    private adminService: AdminService) { }

  createUser$ = createEffect(() =>
    this.actions$.pipe(
      ofType(adminAction.CREATE_USER),
      switchMap((action: adminAction.CreateUser) => {

        return this.adminService.createUser(action.LastName, action.FirstName, action.Email,
          action.Organisation, action.RoleID, action.unitIDs).pipe(
            map((response) => new adminAction.CreateUserSuccess(response)),
            catchError((error: any) => of(new adminAction.CreateUserFail(error)))
          );
      })
    )
  );

  updateUser$ = createEffect(() =>
    this.actions$.pipe(
      ofType(adminAction.REMOVE_USER_UNITS_SUCCESS),
      switchMap((action: adminAction.RemoveUserUnitsSuccess) => {

        return this.adminService.editUser(action.LastName, action.FirstName,
          action.Organisation, action.RoleID, action.unitIDs, action.UserID).pipe(
            map((response) => new adminAction.UpdateUserSuccess(response)),
            catchError((error: any) => of(new adminAction.UpdateUserFail(error)))
          );
      })
    )
  );

  removeUserUnits$ = createEffect(() =>
    this.actions$.pipe(
      ofType(adminAction.REMOVE_USER_UNITS),
      switchMap((action: adminAction.RemoveUserUnits) => {

        return this.adminService.removeUserUnits(action.LastName, action.FirstName,
          action.Organisation, action.RoleID, action.unitIDs, action.UserID).pipe(
            map((response) => new adminAction.RemoveUserUnitsSuccess(action.LastName, action.FirstName,
              action.Organisation, action.RoleID, action.unitIDs, action.UserID)),
            catchError((error: any) => of(new adminAction.RemoveUserUnitsFail(error)))
          );
      })
    )
  );

  removeUser$ = createEffect(() =>
    this.actions$.pipe(
      ofType(adminAction.REMOVE_USER),
      switchMap((action: adminAction.RemoveUser) => {

        return this.adminService.removeUser(action.payload).pipe(
          map((response) => new adminAction.RemoveUserSuccess(response)),
          catchError((error: any) => of(new adminAction.RemoveUserFail(error)))
        );
      })
    )
  );

  removeUserSuccess$ = createEffect(() =>
    this.actions$.pipe(
      ofType(adminAction.REMOVE_USER_SUCCESS),
      switchMap((action: adminAction.RemoveUserSuccess) => [
        new fromRoot.Go({ path: ['/users'] }),
      ])
    )
  );

  updateCurrentAdminUser$ = createEffect(() =>
    this.actions$.pipe(
      ofType(adminAction.UPDATE_ADMIN_USER),
      map((action: adminAction.UpdateAdminUser) => {
        return new adminAction.UpdateAdminUserSuccess(action.payload);
      })));


  createBarnteam$ = createEffect(() =>
    this.actions$.pipe(
      ofType(adminAction.CREATE_BARNTEAM),
      switchMap((action: adminAction.CreateBarnteam) => {

        return this.adminService.createBarnteam(action.teamName, action.unitIDs).pipe(
          map((response) => new adminAction.CreateBarnteamSuccess(response)),
          catchError((error: any) => of(new adminAction.CreateBarnteamFail(error)))
        );
      })
    )
  );

  removeBarnteam$ = createEffect(() =>
    this.actions$.pipe(
      ofType(adminAction.REMOVE_BARNTEAM),
      switchMap((action: adminAction.RemoveBarnteam) => {

        return this.adminService.removeBarnteam(action.payload).pipe(
          map((response) => new adminAction.RemoveBarnteamSuccess(response)),
          catchError((error: any) => of(new adminAction.RemoveBarnteamFail(error)))
        );
      })
    )
  );

  removeBarnteamSuccess$ = createEffect(() =>
    this.actions$.pipe(
      ofType(adminAction.REMOVE_BARNTEAM_SUCCESS),
      switchMap((action: adminAction.RemoveBarnteamSuccess) => [
        new fromRoot.Go({ path: ['/barnteam'] }),
      ])
    )
  );

  updateCurrentAdminBarnteam$ = createEffect(() =>
    this.actions$.pipe(
      ofType(adminAction.UPDATE_ADMIN_BARNTEAM),
      map((action: adminAction.UpdateAdminBarnteam) => {
        return new adminAction.UpdateAdminBarnteamSuccess(action.payload);
      })));

  updateTeams$ = createEffect(() =>
    this.actions$.pipe(
      ofType(adminAction.UPDATE_TEAMS),
      map((action: adminAction.UpdateTeams) => {
        return new adminAction.UpdateTeamsSuccess(action.payload);
      })));

}