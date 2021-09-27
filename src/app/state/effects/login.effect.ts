import {Injectable} from '@angular/core';
import * as loginAction from '../actions/login.action';
import {map, switchMap, catchError, mergeMap} from 'rxjs/operators';
import {of} from 'rxjs';
import {Actions, createEffect, ofType} from '@ngrx/effects';
import {SignInService} from '../../services/sign-in/sign-in.service';
import * as fromRoot from '../../../app/state';
import { Observable } from 'rxjs';
import * as currentPersonAction from '../actions/currentPerson.action';


@Injectable()
export class LoginEffect {
  constructor(private actions$: Actions,
              private signInService: SignInService) {
  }

login$ = createEffect(() =>
  this.actions$.pipe(
    ofType(loginAction.LOGIN),
    switchMap((action: loginAction.Login) => {

    return this.signInService.signIn(action.payload).pipe(
      map((response) => new loginAction.LoginSuccess(response)),
      catchError((error: any) => of(new loginAction.LoginFail(error)))
    );

    })
  )
);


  loginSuccess$ = createEffect(() =>
    this.actions$.pipe(
      ofType(loginAction.LOGIN_SUCCESS),
      switchMap((action: loginAction.LoginSuccess) => [
        new fromRoot.Go({path: ['/contact']})
      ]),
    )
  );

  logout$ = createEffect(() =>
      this.actions$.pipe(
        ofType(loginAction.LOGOUT),
        switchMap((action: loginAction.Logout) => {
          return of(new loginAction.LogoutSuccess())
        }),
      )
  );

  loginFail$ = createEffect(() =>
      this.actions$.pipe(
        ofType(loginAction.LOGIN_FAIL),
        map((action: loginAction.LoginFail) => {
        /*   this.snackBar.open('Fel e-post eller lösenord!', 'Ok', {
            duration: 2000
          });
         */}),
      ),
    {dispatch: false}
  );

/*   logoutSuccess$ = createEffect(() =>
  this.actions$.pipe(
    ofType(loginAction.LOGOUT_SUCCESS),
    mergeMap((action: loginAction.LogoutSuccess) => {
      new currentPersonAction.UpdatePerson(null);
      return of(new fromRoot.Go({path: ['/sign-in'], extras: {replaceUrl: true}}));
    })
  )
); */

   logoutSuccess$ = createEffect(() =>
    this.actions$.pipe(
      ofType(loginAction.LOGOUT_SUCCESS),
      mergeMap((action: loginAction.LogoutSuccess) => {
        return of(new fromRoot.Go({path: ['/sign-in'], extras: {replaceUrl: true}}));
      })
    )
  );

}