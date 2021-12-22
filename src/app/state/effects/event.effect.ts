import { Injectable } from '@angular/core';
import * as eventAction from '../actions/event.action';
import { map, switchMap, catchError } from 'rxjs/operators';
import { of } from 'rxjs';
import { Actions, createEffect, ofType } from '@ngrx/effects';
import * as fromRoot from '../../../app/state';
import { EventService } from 'src/app/services/event/event.service';

@Injectable()
export class EventEffect {
  constructor(private actions$: Actions,
    private eventService: EventService) {
  }

  createEvent$ = createEffect(() =>
    this.actions$.pipe(
      ofType(eventAction.CREATE_EVENT),
      switchMap((action: eventAction.CreateEvent) => {

        return this.eventService.createEvent(action.payload).pipe(
          map((response) => new eventAction.CreateEventSuccess(response)),
          catchError((error: any) => of(new eventAction.CreateEventFail(error)))
        );
      })
    )
  );

  createEventSuccess$ = createEffect(() =>
    this.actions$.pipe(
      ofType(eventAction.CREATE_EVENT_SUCCESS),
      switchMap((action: eventAction.CreateEventSuccess) => [

        new fromRoot.Go({ path: ['/event'] }),
      ])
    )
  );


  createAction$ = createEffect(() =>
    this.actions$.pipe(
      ofType(eventAction.CREATE_ACTION),
      switchMap((action: eventAction.CreateAction) => {

        return this.eventService.createAction(action.payload).pipe(
          map((response) => new eventAction.CreateActionSuccess(response)),
          catchError((error: any) => of(new eventAction.CreateActionFail(error)))
        );
      })
    )
  );

  createActionSuccess$ = createEffect(() =>
    this.actions$.pipe(
      ofType(eventAction.CREATE_ACTION_SUCCESS),
      switchMap((action: eventAction.CreateActionSuccess) => [

        new fromRoot.Go({ path: ['/event'] }),
      ])
    )
  );

  updateEvent$ = createEffect(() =>
    this.actions$.pipe(
      ofType(eventAction.UPDATE_EVENT),
      switchMap((action: eventAction.UpdateEvent) => {

        return this.eventService.editAction(action.payload).pipe(
          map((response) => new eventAction.UpdateEventSuccess(response)),
          catchError((error: any) => of(new eventAction.UpdateEventFail(error)))
        );
      })
    )
  );

}