import {Injectable} from '@angular/core';
import * as discoverCardAction from '../actions/discoverCard.action';

import {map, switchMap, catchError, mergeMap} from 'rxjs/operators';
import {of} from 'rxjs';
import {Actions, createEffect, ofType} from '@ngrx/effects';
import {ContactGuardianService} from '../../services/contact-guardian/contact-guardian.service';
import * as fromRoot from '../../../app/state';

@Injectable()
export class DiscoverCardEffect {
  constructor(private actions$: Actions,
              private contactGuardian: ContactGuardianService) {
  }

discoverCard$ = createEffect(() =>
  this.actions$.pipe(
    ofType(discoverCardAction.LOAD_DISCOVERCARD),
    switchMap((action: discoverCardAction.LoadDiscoverCard) => {

    return this.contactGuardian.getCards(action.payload).pipe(
      map((response) => new discoverCardAction.LoadDiscoverCardSuccess(response)),
      catchError((error: any) => of(new discoverCardAction.LoadDiscoverCardFail(error)))
    );
    })
  )
);

}