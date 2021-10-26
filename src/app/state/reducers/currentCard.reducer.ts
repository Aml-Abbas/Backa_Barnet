import * as currentCard from '../actions/currentCard.action';
import {Card} from '../../models/Card';


export interface CurrentCardState {
    currentCardLoading: boolean;
    currentcardLoaded: boolean;
    currentCard: Card | null;
  }
  
  export const initialState: CurrentCardState = {
    currentCardLoading: false,
    currentcardLoaded: false,
    currentCard: null,
  };
  
  export function reducer(
    state = initialState,
    action: currentCard.CurrentCardAction
  ): CurrentCardState {
    switch (action.type) {
      case currentCard.UPDATE_CARD:{
        return {
          ...state,
          currentcardLoaded: false,
          currentCardLoading: true
        };
      }
      case currentCard.UPDATE_CARD_SUCCESS: {
        return {
          ...state,
          currentCard: action.payload,
          currentcardLoaded: true,
          currentCardLoading: false
        };
      }
      default:
        return state;
    }
  }
  
  export const getCurrentCard = (state: CurrentCardState) => state.currentCard;
  export const getCurrentCardLoaded = (state: CurrentCardState) => state.currentcardLoaded;
  export const getCurrentCardLoading = (state: CurrentCardState) => state.currentCardLoading;
