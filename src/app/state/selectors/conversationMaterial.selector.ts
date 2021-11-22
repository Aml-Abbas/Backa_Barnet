import {createSelector} from '@ngrx/store';
import * as fromFeature from '../reducers';
import * as fromConversationMaterail from '../reducers/conversationMaterial.reducer';


export const getConversationMaterialState = createSelector(
    fromFeature.getState,
    (state: fromFeature.State) => state.conversationMaterial
  );
  
  export const getConversationMaterialLoading = createSelector(
    getConversationMaterialState, fromConversationMaterail.getConversationMaterialLoading
      );

  export const getConversationMaterialLoaded = createSelector(
    getConversationMaterialState, fromConversationMaterail.getConversationMaterialLoaded
      );
  
  export const getConversationMaterial = createSelector(
    getConversationMaterialState, fromConversationMaterail.getConversationMaterial
      );

  export const getCurrentConversationCard = createSelector(
    getConversationMaterialState, fromConversationMaterail.getConversationCard
    );
    
    export const getConversationCards = createSelector(
      getConversationMaterialState, fromConversationMaterail.getConversationCards
      );
  