
import {Injectable} from '@angular/core';
import {Actions, createEffect, ofType} from '@ngrx/effects';
import {catchError, map, switchMap} from 'rxjs/operators';
import * as personsAction from '../actions/persons.action';
import {GetSetService} from '../../services/get-set/get-set.service';
import { of } from 'rxjs';
import * as fromRoot from '../../../app/state';

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
    
    updateStatus$ = createEffect(() =>
    this.actions$.pipe(
      ofType(personsAction.UPDATE_STATUS),
      switchMap((action: personsAction.UpdateStatus)=>{
  
        return this.getSetService.setStatus(action.payload).pipe(
          map((response)=> new personsAction.UpdateStatusSuccess(response)),
          catchError((error: any)=> of(new personsAction.UpdateStatusFail(error)))
        );
      })
      )
      );
  
/*       updateStatusSuccess$ = createEffect(() =>
      this.actions$.pipe(
        ofType(personsAction.UPDATE_STATUS_SUCCESS),
        switchMap((action: personsAction.UpdateStatusSuccess)=>[
          new fromRoot.Go({path: ['/contact']}),
        ])
        )
        ); */
  
    }
