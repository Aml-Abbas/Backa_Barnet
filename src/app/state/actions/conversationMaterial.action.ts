import { Action } from '@ngrx/store';


export const CREATE_COVERSATION_MATERIAL = '[Conversaton Material] Create Conversaton Material';
export const CREATE_COVERSATION_MATERIAL_SUCCESS = '[Conversaton Material] Create Conversaton Material Success';
export const CREATE_COVERSATION_MATERIAL_FAIL = '[Conversaton Material] Create Conversaton Material Fail';


export class CreateConversationMaterial implements Action {
    readonly type = CREATE_COVERSATION_MATERIAL;
    constructor(public payload: any) {}
  }
  
  export class CreateConversationMaterialSuccess implements Action {
    readonly type = CREATE_COVERSATION_MATERIAL_SUCCESS;
    constructor(public payload: any) {}
  }
  
  export class CreateConversationMaterialFail implements Action {
    readonly type = CREATE_COVERSATION_MATERIAL_FAIL;
    constructor(public payload: any) {}
  }
  
  export type ConversationMaterialAction = CreateConversationMaterial | CreateConversationMaterialSuccess | CreateConversationMaterialFail;