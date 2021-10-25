
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
    )
    );
    

    }
