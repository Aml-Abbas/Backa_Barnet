import {ConversationMaterial} from '../../models/ConversationMaterial';
import {ConversationCard} from '../../models/ConversationCard';
import * as conversationMaterial from '../actions/conversationMaterial.action';

export interface ConversationMaterialSatet {
conversationMaterialLoading: boolean;
conversationMaterialLoaded: boolean;
conversationMaterial: ConversationMaterial[];
currentConversationcard: ConversationCard| null;
currentConversationcards: ConversationCard[];

}

export const initialState: ConversationMaterialSatet = {
    conversationMaterialLoading: false,
    conversationMaterialLoaded: false,
    conversationMaterial: [],
    currentConversationcard: null,
    currentConversationcards: [],
};

export function reducer(
  state = initialState,
  action: conversationMaterial.ConversationMaterialAction
): ConversationMaterialSatet {
  switch (action.type) {
    case conversationMaterial.LOAD_COVERSATION_MATERIAL: {
      return {
        ...state,
        conversationMaterialLoaded: false,
        conversationMaterialLoading: true
      };
    }
    case conversationMaterial.LOAD_COVERSATION_MATERIAL_SUCCESS: {
      return {
        ...state,
        conversationMaterialLoaded: true,
        conversationMaterialLoading: false,
        conversationMaterial: action.payload
      };
    }
    case conversationMaterial.LOAD_COVERSATION_MATERIAL_FAIL: {
      return {
        ...state,
        conversationMaterialLoaded: false,
        conversationMaterialLoading: false,
        conversationMaterial: [],
      };
    }
    case conversationMaterial.UPDATE_CURRENT_CONVERSATION_CARD:{
      return {
        ...state,
      };
    }
    case conversationMaterial.UPDATE_CURRENT_CONVERSATION_CARD_SUCCESS: {
      return {
        ...state,
        currentConversationcard: action.payload,
      };
    }
    case conversationMaterial.UPDATE_CONVERSATION_CARDS:{
      return {
        ...state,
      };
    }
    case conversationMaterial.UPDATE_CONVERSATION_CARDS_SUCCESS: {
      return {
        ...state,
        currentConversationcards: action.payload,
      };
    }
    default:
      return state;
  }
}

export const getConversationMaterial = (state: ConversationMaterialSatet) => state.conversationMaterial;
export const getConversationMaterialLoaded = (state: ConversationMaterialSatet) => state.conversationMaterialLoaded;
export const getConversationMaterialLoading = (state: ConversationMaterialSatet) => state.conversationMaterialLoading;
export const getConversationCard = (state: ConversationMaterialSatet) => state.currentConversationcard;
export const getConversationCards = (state: ConversationMaterialSatet) => state.currentConversationcards;
