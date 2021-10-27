import {createSelector} from '@ngrx/store';
import * as fromFeature from '../reducers';
import * as fromCurrentCard from '../reducers/currentCard.reducer';

export const getCurrentCardState = createSelector(
  fromFeature.getState,
  (state: fromFeature.State) => state.currentCard
);

export const getCurrentCardLoading = createSelector(
  getCurrentCardState,
  fromCurrentCard.getCurrentCardLoading
);


export const getCurrentCardLoaded = createSelector(
    getCurrentCardState,
  fromCurrentCard.getCurrentCardLoaded
);


export const getCurrentCard = createSelector(
    getCurrentCardState,
  fromCurrentCard.getCurrentCard
);

export const getCurrentCardsLoading = createSelector(
  getCurrentCardState,
  fromCurrentCard.getCurrentCardsLoading
);


export const getCurrentCardsLoaded = createSelector(
    getCurrentCardState,
  fromCurrentCard.getCurrentCardsLoaded
);


export const getCurrentCards = createSelector(
    getCurrentCardState,
  fromCurrentCard.getCurrentCards
);

