
import {Injectable} from '@angular/core';
import {Actions, createEffect, ofType} from '@ngrx/effects';
import {catchError, map, switchMap} from 'rxjs/operators';
import * as personsAction from '../actions/persons.action';
import {GetSetService} from '../../services/get-set/get-set.service';
import { of } from 'rxjs';

@Injectable()
export class PersonsEffect {

  constructor(private actions$: Actions,
    private getSetService: GetSetService) {}
  

  updatePersons$ = createEffect(() =>
  this.actions$.pipe(
    ofType(personsAction.LOAD_PERSONS),
    switchMap((action: personsAction.LoadPersons)=>{

      return this.getSetService.getPersons(action.payload).pipe(
        map((response)=> new personsAction.LoadPersonsSuccess(response)),
        catchError((error: any)=> of(new personsAction.LoadPersonsFail(error)))
      );
    })
    )
    );
    

    }
