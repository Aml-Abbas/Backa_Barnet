import {Injectable} from '@angular/core';
import {Actions, createEffect, ofType} from '@ngrx/effects';
import {map} from 'rxjs/operators';
import * as currentCardAction from '../actions/currentCard.action';


@Injectable()
export class CurrentCardEffect {
  constructor(private actions$: Actions) {}


  updateCurrentPerson$ = createEffect(() =>
  this.actions$.pipe(
    ofType(currentCardAction.UPDATE_CARD),
    map((action: currentCardAction.UpdateCard) => {
      return new currentCardAction.UpdateCardSuccess(action.payload);
    })));

  }
