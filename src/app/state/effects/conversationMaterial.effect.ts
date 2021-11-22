import {Injectable} from '@angular/core';
import * as conversationMaterialAction from '../actions/conversationMaterial.action';

import {map, switchMap, catchError, mergeMap} from 'rxjs/operators';
import {of} from 'rxjs';
import {Actions, createEffect, ofType} from '@ngrx/effects';
import {GetSetService} from '../../services/get-set/get-set.service';
import * as fromRoot from '../../../app/state';



@Injectable()
export class ConversationMaterialEffect {
  constructor(private actions$: Actions,
              private getSetService: GetSetService) {
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
      
      new fromRoot.Go({path: ['/']}),
    ])
  )
);


}