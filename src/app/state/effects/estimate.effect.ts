
import { Injectable } from '@angular/core';
import * as estimateAction from '../actions/estimate.action';
import { MatDialog } from '@angular/material/dialog';
import { map, switchMap, catchError } from 'rxjs/operators';
import { of } from 'rxjs';
import { Actions, createEffect, ofType } from '@ngrx/effects';
import { GetSetService } from '../../services/get-set/get-set.service';
import * as fromRoot from '../../../app/state';

@Injectable()
export class EstimateEffect {
  constructor(private actions$: Actions,
    private getSetService: GetSetService,
    public dialog: MatDialog) {
  }

  createEstimate$ = createEffect(() =>
    this.actions$.pipe(
      ofType(estimateAction.CREATE_ESTIMATE),
      switchMap((action: estimateAction.CreateEstimateCard) => {

        return this.getSetService.createEstimate(action.payload).pipe(
          map((response) => new estimateAction.CreateEstimateSuccess(response)),
          catchError((error: any) => of(new estimateAction.CreateEstimateFail(error)))
        );
      })
    )
  );

  LoadEstimateCards$ = createEffect(() =>
    this.actions$.pipe(
      ofType(estimateAction.LOAD_ESTIMATE_CARDS),
      map((action: estimateAction.LoadEstimateCards) => {
        return new estimateAction.LoadEstimateCardsSuccess(action.payload);
      })));



  lockEstimate$ = createEffect(() =>
    this.actions$.pipe(
      ofType(estimateAction.LOCK_ESTIMATE_CARDS),
      switchMap((action: estimateAction.LockEstimateCards) => {

        return this.getSetService.lockEstimate(action.payload).pipe(
          map((response) => new estimateAction.LockEstimateCardsSuccess(response)),
          catchError((error: any) => of(new estimateAction.LockEstimateCardsFail(error)))
        );
      })
    )
  );

  lockEstimateSuccess$ = createEffect(() =>
    this.actions$.pipe(
      ofType(estimateAction.LOCK_ESTIMATE_CARDS_SUCCESS),
      switchMap((action: estimateAction.LockEstimateCardsSuccess) => [
        new fromRoot.Go({ path: ['/estimate'] }),
      ])
    )
  );

}
