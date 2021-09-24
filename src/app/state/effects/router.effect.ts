import {Injectable} from '@angular/core';
import {Router} from '@angular/router';
import {Location} from '@angular/common';
import { Observable } from 'rxjs';
import {Actions, createEffect, Effect, ofType} from '@ngrx/effects';

import * as RouterAction from '../actions/router.action';
import {tap, map} from 'rxjs/operators';

@Injectable()
export class RouterEffect {
  constructor(
    private actions$: Actions,
    private router: Router,
    private location: Location
  ) {
  }

  @Effect({dispatch: false})
  navigate$ = this.actions$.pipe(
    ofType(RouterAction.GO),
    map((action: RouterAction.Go) => action.paylod),
    tap(({path, query: queryParams, extras}) => {
      this.router.navigate(path, {queryParams, ...extras});
    })
  );


  navigateBack$ = createEffect(() => this.actions$.pipe(
    ofType(RouterAction.BACK),
    tap(() => this.location.back())
    ),
    {dispatch: false}
  );


  navigateForward$ : Observable<Actions> = this.actions$.pipe(
    ofType(RouterAction.FORWARD),
    tap(() => {
      this.location.forward();
    })
  );

}
