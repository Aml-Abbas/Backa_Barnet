import {Injectable} from '@angular/core';
import * as adminAction from '../actions/admin.action';
import {map, switchMap, catchError, mergeMap} from 'rxjs/operators';
import {of} from 'rxjs';
import {Actions, createEffect, ofType} from '@ngrx/effects';
import * as fromRoot from '../../../app/state';
import { AdminService } from 'src/app/services/admin/admin.service';

@Injectable()
export class AdminEffect {
  constructor(private actions$: Actions,
              private adminService: AdminService) {
  }

createUser$ = createEffect(() =>
this.actions$.pipe(
  ofType(adminAction.CREATE_USER),
  switchMap((action: adminAction.CreateUser) => {

  return this.adminService.createUser(action.payload).pipe(
    map((response) => new adminAction.CreateUserSuccess(response)),
    catchError((error: any) => of(new adminAction.CreateUserFail(error)))
  );
  })
)
);

createUserSuccess$ = createEffect(() =>
this.actions$.pipe(
  ofType(adminAction.CREATE_USER_SUCCESS),
  switchMap((action: adminAction.CreateUserSuccess) =>[
    new fromRoot.Go({path: ['/users']}),
  ])
)
);

updateUser$ = createEffect(() =>
this.actions$.pipe(
  ofType(adminAction.UPDATE_USER),
  switchMap((action: adminAction.UpdateUser) => {

  return this.adminService.editUser(action.payload).pipe(
    map((response) => new adminAction.UpdateUserSuccess(response)),
    catchError((error: any) => of(new adminAction.UpdateUserFail(error)))
  );
  })
)
);

updateUserSuccess$ = createEffect(() =>
this.actions$.pipe(
  ofType(adminAction.UPDATE_USER_SUCCESS),
  switchMap((action: adminAction.UpdateUserSuccess) =>[
    new fromRoot.Go({path: ['/users']}),
  ])
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
  ofType(adminAction.CREATE_USER_SUCCESS),
  switchMap((action: adminAction.RemoveUserSuccess) =>[
    new fromRoot.Go({path: ['/users']}),
  ])
)
);

}