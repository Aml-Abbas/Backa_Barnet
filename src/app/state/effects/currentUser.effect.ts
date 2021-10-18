
import {Injectable} from '@angular/core';
import {Actions, createEffect, ofType} from '@ngrx/effects';
import {map} from 'rxjs/operators';
import * as currentUserAction from '../actions/currentUser.action';

@Injectable()
export class CurrentUserEffect {

  constructor(private actions$: Actions) {}
  
/* 
  updateCurrentPerson$ = createEffect(() =>
  this.actions$.pipe(
    ofType(currentPersonAction.UPDATE_PERSON),
    map((action: currentPersonAction.UpdatePerson) => {
      return new currentPersonAction.UpdatePersonSuccess(action.payload);
    }))); */
    
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
