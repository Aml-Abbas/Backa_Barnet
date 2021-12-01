import {Estimate} from '../../models/Estimate';
import * as estimate from '../actions/estimate.action';
import {EstimateCard} from '../../models/EstimateCard';

export interface EstimateSatet {
estimateLoading: boolean;
estimateLoaded: boolean;
estimates: Estimate[];
estimateCards: EstimateCard[];

}

export const initialState: EstimateSatet = {
    estimateLoading: false,
    estimateLoaded: false,
    estimates: [],
    estimateCards: []
};

export function reducer(
  state = initialState,
  action: estimate.EstimateAction
): EstimateSatet {
  switch (action.type) {
    case estimate.LOAD_ESTIMATE: {
      return {
        ...state,
        estimateLoaded: false,
        estimateLoading: true
      };
    }
    case estimate.LOAD_ESTIMATE_SUCCESS: {
      return {
        ...state,
        estimateLoaded: true,
        estimateLoading: false,
        estimates: action.payload
      };
    }
    case estimate.LOAD_ESTIMATE_FAIL: {
      return {
        ...state,
        estimateLoaded: false,
        estimateLoading: false,
        estimates: [],
      };
    }
    case estimate.LOAD_ESTIMATE_CARDS_SUCCESS: {
      return {
        ...state,
        estimateCards: action.payload,
      };
    }
    default:
      return state;
  }
}

export const getEstimates = (state: EstimateSatet) => state.estimates;
export const getEstimatesLoaded = (state: EstimateSatet) => state.estimateLoaded;
export const getEstimatesLoading = (state: EstimateSatet) => state.estimateLoading;
export const getEstimateCards = (state: EstimateSatet) => state.estimateCards;
