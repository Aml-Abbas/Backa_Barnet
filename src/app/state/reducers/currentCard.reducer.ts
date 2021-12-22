import * as currentCard from '../actions/currentCard.action';
import { Card } from '../../models/Card';


export interface CurrentCardState {
  currentCardLoading: boolean;
  currentcardLoaded: boolean;
  currentCard: Card | null;
  currentCardsLoading: boolean;
  currentcardsLoaded: boolean;
  currentCards: Card[];

}

export const initialState: CurrentCardState = {
  currentCardLoading: false,
  currentcardLoaded: false,
  currentCard: null,
  currentCardsLoading: false,
  currentcardsLoaded: false,
  currentCards: [],

};

export function reducer(
  state = initialState,
  action: currentCard.CurrentCardAction
): CurrentCardState {
  switch (action.type) {
    case currentCard.UPDATE_CARD: {
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
    case currentCard.UPDATE_CARDS: {
      return {
        ...state,
        currentcardsLoaded: false,
        currentCardsLoading: true
      };
    }
    case currentCard.UPDATE_CARDS_SUCCESS: {
      return {
        ...state,
        currentCards: action.payload,
        currentcardsLoaded: true,
        currentCardsLoading: false
      };
    }

    default:
      return state;
  }
}

export const getCurrentCard = (state: CurrentCardState) => state.currentCard;
export const getCurrentCardLoaded = (state: CurrentCardState) => state.currentcardLoaded;
export const getCurrentCardLoading = (state: CurrentCardState) => state.currentCardLoading;

export const getCurrentCards = (state: CurrentCardState) => state.currentCards;
export const getCurrentCardsLoaded = (state: CurrentCardState) => state.currentcardsLoaded;
export const getCurrentCardsLoading = (state: CurrentCardState) => state.currentCardsLoading;
