import {createSelector} from '@ngrx/store';
import * as fromFeature from '../reducers';
import * as fromDiscoverCard from '../reducers/discoverCard.reducer';


export const getDiscoverCardState = createSelector(
    fromFeature.getState,
    (state: fromFeature.State) => state.discoverCard
  );
  
  export const getDiscoverCardLoading = createSelector(
      getDiscoverCardState, fromDiscoverCard.getDiscoverCardLoading
      );

  export const DiscoverLoaded = createSelector(
      getDiscoverCardState, fromDiscoverCard.getDiscoverCardLoaded
      );
  
  export const getDiscoverCards = createSelector(
      getDiscoverCardState, fromDiscoverCard.getDiscoverCard
      );
