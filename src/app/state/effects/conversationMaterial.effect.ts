import {Injectable} from '@angular/core';
import * as conversationMaterialAction from '../actions/conversationMaterial.action';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import {map, switchMap, catchError, mergeMap} from 'rxjs/operators';
import {of} from 'rxjs';
import {Actions, createEffect, ofType} from '@ngrx/effects';
import {GetSetService} from '../../services/get-set/get-set.service';
import * as fromRoot from '../../../app/state';



@Injectable()
export class ConversationMaterialEffect {
  constructor(private actions$: Actions,
              private getSetService: GetSetService,
              private store: Store<fromState.State>) {
  }


  createConversationMaterial$ = createEffect(() =>
  this.actions$.pipe(
    ofType(conversationMaterialAction.CREATE_COVERSATION_MATERIAL),
    switchMap((action: conversationMaterialAction.CreateConversationMaterial) => {

    return this.getSetService.createConversationMaterial(action.payload).pipe(
      map((response) => new conversationMaterialAction.CreateConversationMaterialSuccess(response)),
      catchError((error: any) => of(new conversationMaterialAction.CreateConversationMaterialFail(error)))
    );
    })
  )
);

createConversationMaterialSuccess$ = createEffect(() =>
  this.actions$.pipe(
    ofType(conversationMaterialAction.CREATE_COVERSATION_MATERIAL_SUCCESS),
    switchMap((action: conversationMaterialAction.CreateConversationMaterialSuccess) =>[

/*     this.store.select(fromState.getCurrentPerson).subscribe(data=>{
      this.store.dispatch(new fromState.LoadConversationMaterial(data?.personID ?? ''));
    }),
 */      new fromRoot.Go({path: ['/conversation-material']}),
])
  )
);

/* conversationMaterial$ = createEffect(() =>
  this.actions$.pipe(
    ofType(conversationMaterialAction.LOAD_COVERSATION_MATERIAL),
    switchMap((action: conversationMaterialAction.LoadConversationMaterial) => {

    return this.getSetService.getConversationMaterial(action.payload).pipe(
      map((response) => new conversationMaterialAction.LoadConversationMaterialSuccess(response)),
      catchError((error: any) => of(new conversationMaterialAction.LoadConversationMaterialFail(error)))
    );
    })
  )
); */


updateCurrentConversationCard$ = createEffect(() =>
this.actions$.pipe(
  ofType(conversationMaterialAction.UPDATE_CURRENT_CONVERSATION_CARD),
  map((action: conversationMaterialAction.UpdateCurrentConversationCard) => {
    return new conversationMaterialAction.UpdateCurrentConversationCardSuccess(action.payload);
  })));

  updateConversationCards$ = createEffect(() =>
  this.actions$.pipe(
    ofType(conversationMaterialAction.UPDATE_CONVERSATION_CARDS),
    map((action: conversationMaterialAction.UpdateConversationCards) => {
      return new conversationMaterialAction.UpdateConversationCardsSuccess(action.payload);
    })));


  updateConversationCard$ = createEffect(() =>
  this.actions$.pipe(
    ofType(conversationMaterialAction.UPDATE_CONVERSATION_CARD),
    switchMap((action: conversationMaterialAction.UpdateConversationCard) => {

    return this.getSetService.updateConversationMaterial(action.payload).pipe(
      map((response) => new conversationMaterialAction.UpdateConversationCardSuccess(response)),
      catchError((error: any) => of(new conversationMaterialAction.UpdateCurrentConversationCardFail(error)))
    );
    })
  )
);

updateConversationCardSuccess$ = createEffect(() =>
  this.actions$.pipe(
    ofType(conversationMaterialAction.UPDATE_CONVERSATION_CARD_SUCCESS),
    switchMap((action: conversationMaterialAction.UpdateConversationCardSuccess) =>[
      new fromRoot.Go({path: ['/conversation-material']}),
    ])
  )
);

}