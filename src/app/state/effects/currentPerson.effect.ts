import { Injectable } from '@angular/core';
import { Actions, createEffect, ofType } from '@ngrx/effects';
import { map } from 'rxjs/operators';
import * as currentPersonAction from '../actions/currentPerson.action';


@Injectable()
export class CurrentPersonEffect {
  constructor(private actions$: Actions) { }


  updateCurrentPerson$ = createEffect(() =>
    this.actions$.pipe(
      ofType(currentPersonAction.UPDATE_PERSON),
      map((action: currentPersonAction.UpdatePerson) => {
        return new currentPersonAction.UpdatePersonSuccess(action.payload);
      })));

  updateUsers$ = createEffect(() =>
    this.actions$.pipe(
      ofType(currentPersonAction.UPDATE_USERS),
      map((action: currentPersonAction.UpdateUsers) => {
        return new currentPersonAction.UpdateUsersSuccess(action.payload);
      })));

}

