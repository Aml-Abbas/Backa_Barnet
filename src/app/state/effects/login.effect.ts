/* import {Injectable} from '@angular/core';
import {Store} from '@ngrx/store';
import * as loginAction from '../actions/login.action';
import {map, switchMap, catchError, mergeMap} from 'rxjs/operators';
import {of} from 'rxjs';
import {LoginState} from '../reducers/login.reducer';

import {Effect, Actions, createEffect, ofType} from '@ngrx/effects';

 */

/* @Injectable()
export class LoginEffect {
  constructor(private actions$: Actions,
              private authService: AuthService,
              private dialog: MatDialog,
              private store: Store<BuyerLoginState>,
              private snackBar: MatSnackBar) {
  }


  login$ = createEffect(() =>
    this.actions$.pipe(
      ofType(loginAction.LOGIN),
      switchMap((action: loginAction.Login) => {
        return this.authService.login(action.payload).pipe(
          map((response) => new loginActions.BuyerLoginSuccess(response)),
          catchError((error) => of(new loginAction.LoginFail(error)))
        );
      })
    )
  );

  loginSuccess$ = createEffect(() =>
    this.actions$.pipe(
      ofType(loginAction.LOGIN_SUCCESS),
      switchMap((action: loginAction.LoginSuccess) => [
        // console.log(`paylod@LoginSuccess: ${actions.payload.email}`);
        new userActions.BuyerLoadCurrentUser(action.payload.email),
        new fromRoot.Go({path: ['buyer/items']})
      ]),
      // seller-area((authResponse) => new userActions.LoadCurrentUser(authResponse)),
      // seller-area((authResponse) => new fromRoot.Go({ path: ['seller/items'] }))
    )
  );

  logout$ = createEffect(() =>
      this.actions$.pipe(
        ofType(loginAction.LOGOUT),
        map((action: loginAction.Logout) => {
          this.dialog.open(LogoutDialog, {
            data: {
              name: '',
              store: this.store,
              permissionLevel: PermissionLevel.BUYER
            }
          });
        })
      ),
    {dispatch: false}
  );

  loginFail$ = createEffect(() =>
      this.actions$.pipe(
        ofType(loginActions.LOGIN_FAIL),
        map((action: loginActions.LoginFail) => {
          this.snackBar.open('Fel e-post eller lösenord!', 'Ok', {
            duration: 2000
          });
        }),
      ),
    {dispatch: false}
  );


  logoutConfirm$ = createEffect(() =>
    this.actions$.pipe(
      ofType(loginAction.LOGOUT_SUCCESS),
      mergeMap((action: loginAction.LogoutSuccess) => {
        return of(new fromRoot.Go({path: ['/buyer/login'], extras: {replaceUrl: true}}));
      })
    )
  );

} */