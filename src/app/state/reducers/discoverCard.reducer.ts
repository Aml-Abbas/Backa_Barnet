import {DiscoverCard} from '../../models/DiscoverCard';
import * as discoverCardAction from '../actions/discoverCard.action';
import {Card} from '../../models/Card';

export interface DiscoverCardState {
  discoverCardLoading: boolean;
  discoverCardLoaded: boolean;
  discoverCards: Card[];
}

export const initialState: DiscoverCardState = {
    discoverCardLoading: false,
    discoverCardLoaded: false,
    discoverCards: [],
};

export function reducer(
  state = initialState,
  action: discoverCardAction.DiscoverCardAction
): DiscoverCardState {
  switch (action.type) {
    case discoverCardAction.LOAD_DISCOVERCARD: {
      return {
        ...state,
        discoverCardLoaded: false,
        discoverCardLoading: true
      };
    }
    case discoverCardAction.LOAD_DISCOVERCARD_SUCCESS: {
      return {
        ...state,
        discoverCardLoaded: true,
        discoverCardLoading: false,
        discoverCards: action.payload
      };
    }
    case discoverCardAction.LOAD_DISCOVERCARD_FAIL: {
      return {
        ...state,
        discoverCardLoaded: false,
        discoverCardLoading: false,
        discoverCards: [],
      };
    }
    default:
      return state;
  }
}

export const getDiscoverCard = (state: DiscoverCardState) => state.discoverCards;
export const getDiscoverCardLoaded = (state: DiscoverCardState) => state.discoverCardLoaded;
export const getDiscoverCardLoading = (state: DiscoverCardState) => state.discoverCardLoading;
