import { Action } from '@ngrx/store';
import { ConversationCard } from 'src/app/models/ConversationCard';
import { ConversationMaterial } from 'src/app/models/ConversationMaterial';

export const LOAD_COVERSATION_MATERIAL = '[Conversation Material] Load Conversation Material';
export const LOAD_COVERSATION_MATERIAL_SUCCESS = '[Conversation Material] Load Conversation Material Success';
export const LOAD_COVERSATION_MATERIAL_FAIL = '[Conversation Material] Load Conversation Material Fail';

export const CREATE_COVERSATION_MATERIAL = '[Conversation Material] Create Conversation Material';
export const CREATE_COVERSATION_MATERIAL_SUCCESS = '[Conversation Material] Create Conversation Material Success';
export const CREATE_COVERSATION_MATERIAL_FAIL = '[Conversation Material] Create Conversation Material Fail';

export const UPDATE_CURRENT_CONVERSATION_CARD = '[Current Conversation Material] Update Current Conversation Material';
export const UPDATE_CURRENT_CONVERSATION_CARD_SUCCESS = '[Current Conversation Material] Update Current Conversation Material Success';
export const UPDATE_CURRENT_CONVERSATION_CARD_FAIL = '[Current Conversation Material] Update Current Conversation Material Fail';

export const UPDATE_CONVERSATION_CARDS = '[Conversation Material] Update Conversation Cards';
export const UPDATE_CONVERSATION_CARDS_SUCCESS = '[Conversation Material] Update Conversation Cards Success';
export const UPDATE_CONVERSATION_CARDS_FAIL = '[Conversation Material] Update Conversation Cards Fail';

export const UPDATE_CONVERSATION_CARD = '[Conversation Material] Update Conversation Card';
export const UPDATE_CONVERSATION_CARD_SUCCESS = '[Conversation Material] Update Conversation Card Success';
export const UPDATE_CONVERSATION_CARD_FAIL = '[Conversation Material] Update Conversation Card Fail';

export class CreateConversationMaterial implements Action {
  readonly type = CREATE_COVERSATION_MATERIAL;
  constructor(public payload: any) { }
}

export class CreateConversationMaterialSuccess implements Action {
  readonly type = CREATE_COVERSATION_MATERIAL_SUCCESS;
  constructor(public payload: any) { }
}

export class CreateConversationMaterialFail implements Action {
  readonly type = CREATE_COVERSATION_MATERIAL_FAIL;
  constructor(public payload: any) { }
}


export class LoadConversationMaterial implements Action {
  readonly type = LOAD_COVERSATION_MATERIAL;
  constructor(public payload: string) {
  }
}

export class LoadConversationMaterialSuccess implements Action {
  readonly type = LOAD_COVERSATION_MATERIAL_SUCCESS;
  constructor(public payload: ConversationMaterial[]) { }
}

export class LoadConversationMaterialFail implements Action {
  readonly type = LOAD_COVERSATION_MATERIAL_FAIL;
  constructor(public payload: any) { }
}


export class UpdateCurrentConversationCard implements Action {
  readonly type = UPDATE_CURRENT_CONVERSATION_CARD;

  constructor(public payload: ConversationCard | null) { }
}

export class UpdateCurrentConversationCardSuccess implements Action {
  readonly type = UPDATE_CURRENT_CONVERSATION_CARD_SUCCESS;

  constructor(public payload: ConversationCard | null) { }
}

export class UpdateCurrentConversationCardFail implements Action {
  readonly type = UPDATE_CURRENT_CONVERSATION_CARD_FAIL;

  constructor(public payload: any) { }

}

export class UpdateConversationCards implements Action {
  readonly type = UPDATE_CONVERSATION_CARDS;

  constructor(public payload: ConversationCard[]) { }
}

export class UpdateConversationCardsSuccess implements Action {
  readonly type = UPDATE_CONVERSATION_CARDS_SUCCESS;

  constructor(public payload: ConversationCard[]) { }
}

export class UpdateConversationCardsFail implements Action {
  readonly type = UPDATE_CONVERSATION_CARDS_FAIL;

  constructor(public payload: any) { }

}

export class UpdateConversationCard implements Action {
  readonly type = UPDATE_CONVERSATION_CARD;

  constructor(public payload: any) { }
}

export class UpdateConversationCardSuccess implements Action {
  readonly type = UPDATE_CONVERSATION_CARD_SUCCESS;

  constructor(public payload: any) { }
}

export class UpdateConversationCardFail implements Action {
  readonly type = UPDATE_CONVERSATION_CARD_FAIL;

  constructor(public payload: any) { }

}


export type ConversationMaterialAction = CreateConversationMaterial | CreateConversationMaterialSuccess | CreateConversationMaterialFail |
  LoadConversationMaterial | LoadConversationMaterialSuccess | LoadConversationMaterialFail |
  UpdateCurrentConversationCard | UpdateCurrentConversationCardSuccess | UpdateCurrentConversationCardFail |
  UpdateConversationCards | UpdateConversationCardsSuccess | UpdateConversationCardsFail |
  UpdateConversationCard | UpdateConversationCardSuccess | UpdateConversationCardFail;