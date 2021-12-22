import { Action } from '@ngrx/store';
import { Card } from '../../models/Card';


export const UPDATE_CARD = '[Current Card] Update Card';
export const UPDATE_CARD_SUCCESS = '[Current Card] Update Card Success';
export const UPDATE_CARD_FAIL = '[Current Card] Update Card Fail';

export const UPDATE_CARDS = '[Current Cards] Update Cards';
export const UPDATE_CARDS_SUCCESS = '[Current Cards] Update Cards Success';
export const UPDATE_CARDS_FAIL = '[Current Cards] Update Cards Fail';

export class UpdateCard implements Action {
  readonly type = UPDATE_CARD;

  constructor(public payload: Card | null) { }
}

export class UpdateCardSuccess implements Action {
  readonly type = UPDATE_CARD_SUCCESS;

  constructor(public payload: Card | null) { }
}

export class UpdateCardFail implements Action {
  readonly type = UPDATE_CARD_FAIL;

  constructor(public payload: any) { }

}


export class UpdateCards implements Action {
  readonly type = UPDATE_CARDS;

  constructor(public payload: Card[]) { }
}

export class UpdateCardsSuccess implements Action {
  readonly type = UPDATE_CARDS_SUCCESS;

  constructor(public payload: Card[]) { }
}

export class UpdateCardsFail implements Action {
  readonly type = UPDATE_CARDS_FAIL;

  constructor(public payload: any) { }

}

export type CurrentCardAction =
  | UpdateCard | UpdateCardSuccess | UpdateCardFail
  | UpdateCards | UpdateCardsSuccess | UpdateCardsFail;