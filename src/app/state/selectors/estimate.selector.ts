import { createSelector } from '@ngrx/store';
import * as fromFeature from '../reducers';
import * as fromEstimate from '../reducers/estimate.reducer';


export const getEstimateState = createSelector(
  fromFeature.getState,
  (state: fromFeature.State) => state.estimate
);

export const getEstimateLoading = createSelector(
  getEstimateState, fromEstimate.getEstimatesLoading
);

export const getEstimateLoaded = createSelector(
  getEstimateState, fromEstimate.getEstimatesLoaded
);

export const getEstimates = createSelector(
  getEstimateState, fromEstimate.getEstimates
);

export const getEstimateCards = createSelector(
  getEstimateState, fromEstimate.getEstimateCards
);
