
import {Injectable} from '@angular/core';
import {Actions, createEffect, ofType} from '@ngrx/effects';
import {catchError, map, switchMap} from 'rxjs/operators';
import * as currentUserAction from '../actions/currentUser.action';
import {SignInService} from '../../services/sign-in/sign-in.service';
import { of } from 'rxjs';

@Injectable()
export class CurrentUserEffect {

  constructor(private actions$: Actions,
    private signInService: SignInService) {}
  

  updateCurrentUser$ = createEffect(() =>
  this.actions$.pipe(
    ofType(currentUserAction.LOAD_CURRENT_USER),
    switchMap((action: currentUserAction.LoadCurrentUser)=>{

      return this.signInService.getCurrentUser(action.payload).pipe(
        map((response)=> new currentUserAction.LoadCurrentUserSuccess(response)),
        catchError((error: any)=> of(new currentUserAction.LoadCurrentUserFail(error)))
      );
    })
/*     map((action: currentUserAction.LoadCurrentUser) => {
      return new currentUserAction.LoadCurrentUserSuccess(action.payload);
    
    } */
    )
    );
    
/*   loadCurrentUser$ = createEffect(() =>
    this.actions$.pipe(
      ofType(userActions.LOAD_CURRENT_USER),
      switchMap((action: LoadCurrentUser) => {
        return this.userService.getUserByEmail(action.payload).pipe(
          map((user: User) => new userActions.LoadCurrentUserSuccess(user)),
          catchError((error: any) => of(new userActions.LoadCurrentUserFail(error)))
        );
      })
    )
  ); */

  /*
    loadCurrentUserSuccess$ = createEffect(() =>
        this.actions$.pipe(
          ofType(userActions.LOAD_CURRENT_USER_SUCCESS),
          seller-area((actions: userActions.LoadCurrentUserSuccess) => {
            localStorage.setItem('currentUserId', actions.payload.id.toString(10));
            localStorage.setItem('currentUserEmail', actions.payload.email);
          })
        ),
      {dispatch: false}
    );
  */
  /*
  loadCurrentUserSuccess$ = createEffect(() =>
    this.actions$.pipe(
      ofType(userActions.LOAD_CURRENT_USER_SUCCESS),
      switchMap((action: userActions.LoadCurrentUserSuccess) => {
        localStorage.setItem('currentUserId', action.payload.id.toString(10));
        localStorage.setItem('currentUserEmail', action.payload.email);
        return of(new userActions.LoadCurrentUserBakery(action.payload.id));
      })
    ),
  );

  loadCurrentUserSuccess2$ = createEffect(() =>
    this.actions$.pipe(
      ofType(userActions.LOAD_CURRENT_USER_SUCCESS),
      switchMap((action: userActions.LoadCurrentUserSuccess) => {
        return of(new userActions.LoadCurrentUserArea(action.payload.id));
      })
    ),
  ); */




    }
