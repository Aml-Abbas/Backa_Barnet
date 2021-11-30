
import {Injectable} from '@angular/core';
import * as estimateAction from '../actions/estimate.action';

import {map, switchMap, catchError, mergeMap} from 'rxjs/operators';
import {of} from 'rxjs';
import {Actions, createEffect, ofType} from '@ngrx/effects';
import {GetSetService} from '../../services/get-set/get-set.service';
import * as fromRoot from '../../../app/state';

@Injectable()
export class EstimateEffect {
  constructor(private actions$: Actions,
              private getSetService: GetSetService) {
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

createEstimateSuccess$ = createEffect(() =>
this.actions$.pipe(
  ofType(estimateAction.CREATE_ESTIMATE_SUCCESS),
  switchMap((action: estimateAction.CreateEstimateSuccess) =>[
    
    new fromRoot.Go({path: ['/contact']}),
  ])
)
);

}
