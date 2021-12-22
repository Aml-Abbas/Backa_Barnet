import { Injectable } from '@angular/core';
import { Actions, createEffect, ofType, OnInitEffects } from '@ngrx/effects';
import { Action, Store } from '@ngrx/store';
import { State } from '../reducers';
import * as HydrationAction from '../actions/hydration.action';
import { distinctUntilChanged, map, switchMap, tap } from 'rxjs/operators';

@Injectable()
export class HydrationEffect implements OnInitEffects {

  constructor(private action$: Actions, private store: Store<State>) {
  }

  hydrate$ = createEffect(() =>
    this.action$.pipe(
      ofType(HydrationAction.hydrate),
      map(() => {
        const storageValue = localStorage.getItem('state');
        if (storageValue) {
          try {
            const state = JSON.parse(storageValue);
            return HydrationAction.hydrateSuccess({ state });
          } catch {
            localStorage.removeItem('state');
          }
        }
        return HydrationAction.hydrateFailure();
      })
    )
  );

  serialize$ = createEffect(
    () =>
      this.action$.pipe(
        ofType(HydrationAction.hydrateSuccess, HydrationAction.hydrateFailure),
        switchMap(() => this.store),
        distinctUntilChanged(),
        tap((state) => localStorage.setItem('state', JSON.stringify(state)))
      ),
    { dispatch: false }
  );

  updateStorage = createEffect(() =>
    this.action$.pipe(
      ofType(HydrationAction.UPDATE_STORAGE),
      map((action: HydrationAction.UpdateStorage) => {
        console.log(`key@updateStore: ${action.key}`);
        console.log(`value@updateStore: ${action.value}`);
        let stateFromStorage = localStorage.getItem('state');
        if (stateFromStorage != null) {
          let jsonState = JSON.parse(stateFromStorage);
          console.log(`jsonState: ${JSON.stringify(jsonState.seller.currentUser.currentUser.availableDates)
            }`);
        }
      })
    ),
    { dispatch: false }
  );

  updateStorageAvailableDates = createEffect(() =>
    this.action$.pipe(
      ofType(HydrationAction.UPDATE_STORAGE_AVAILABLE_DATES),
      map((action: HydrationAction.UpdateStorageAvailableDates) => {
        localStorage.setItem('state', 'non');
      })
    ),
    { dispatch: false }
  );


  ngrxOnInitEffects(): Action {
    return HydrationAction.hydrate();
  }


}
