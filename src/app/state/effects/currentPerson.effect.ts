import {Injectable} from '@angular/core';
import {Actions, createEffect, ofType} from '@ngrx/effects';
import {map} from 'rxjs/operators';
import * as currentPersonAction from '../actions/currentPerson.action';
import {GetSetService} from '../../services/get-set/get-set.service';


@Injectable()
export class CurrentPersonEffect {
  constructor(private actions$: Actions,
    private getSetService: GetSetService) {}


  updateCurrentPerson$ = createEffect(() =>
  this.actions$.pipe(
    ofType(currentPersonAction.UPDATE_PERSON),
    map((action: currentPersonAction.UpdatePerson) => {
      return new currentPersonAction.UpdatePersonSuccess(action.payload);
    })));
  
    updateCurrentAdminUser$ = createEffect(() =>
    this.actions$.pipe(
      ofType(currentPersonAction.UPDATE_ADMIN_USER),
      map((action: currentPersonAction.UpdateAdminUser) => {
        return new currentPersonAction.UpdateAdminUserSuccess(action.payload);
      })));
    
  
  }

