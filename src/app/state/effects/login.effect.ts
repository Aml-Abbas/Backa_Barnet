import {Injectable} from '@angular/core';
import {Store} from '@ngrx/store';
import * as loginAction from '../actions/login.action';
import {map, switchMap, catchError, mergeMap} from 'rxjs/operators';
import {of} from 'rxjs';
import {LoginState} from '../reducers/login.reducer';
import {MatSnackBar} from '@angular/material/snack-bar';
import {Actions, createEffect, ofType} from '@ngrx/effects';
import {SignInService} from '../../services/sign-in/sign-in.service';
import * as fromRoot from '../../../app/state';


@Injectable()
export class LoginEffect {
  constructor(private actions$: Actions,
              private store: Store<LoginState>,
              private snackBar: MatSnackBar) {
  }


  login$ = createEffect(() =>
    this.actions$.ofType(loginAction.LOGIN).pipe(
      switchMap((action: loginAction.Login) => {
        return SignInService.signIn(action.payload).pipe(
          map((response) => new loginActions.LoginSuccess(response)),
          catchError((error) => of(new loginAction.LoginFail(error)))
      )}
    )
  ));


  loginSuccess$ = createEffect(() =>
    this.actions$.pipe(
      ofType(loginAction.LOGIN_SUCCESS),
      switchMap((action: loginAction.LoginSuccess) => [
        // console.log(`paylod@LoginSuccess: ${actions.payload.email}`);
        //new userActions.BuyerLoadCurrentUser(action.payload.email),
        new fromRoot.Go({path: ['/contact']})
      ]),
    )
  );

  logout$ = createEffect(() =>
      this.actions$.pipe(
        ofType(loginAction.LOGOUT),
        map((action: loginAction.Logout) => {
          
        })
      ),
    {dispatch: false}
  );

  loginFail$ = createEffect(() =>
      this.actions$.pipe(
        ofType(loginAction.LOGIN_FAIL),
        map((action: loginAction.LoginFail) => {
          this.snackBar.open('Fel e-post eller lösenord!', 'Ok', {
            duration: 2000
          });
        }),
      ),
    {dispatch: false}
  );


  logoutSuccess$ = createEffect(() =>
    this.actions$.pipe(
      ofType(loginAction.LOGOUT_SUCCESS),
      mergeMap((action: loginAction.LogoutSuccess) => {
        return of(new fromRoot.Go({path: ['/sign-in'], extras: {replaceUrl: true}}));
      })
    )
  );

}