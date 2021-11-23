import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate } from '@angular/router';
import { Observable } from 'rxjs';
import * as fromState from '../state';
import { Store } from '@ngrx/store';
import * as fromRoot from '../../app/state';
import { of } from 'rxjs';
import { ConversationCard } from 'src/app/models/ConversationCard';

@Injectable({
  providedIn: 'root'
})
export class ConversationMaterialDetailsGuard implements CanActivate {
  constructor(private store: Store<fromState.State>) {}

  canActivate(route: ActivatedRouteSnapshot):  Observable<boolean>{
    var id= route.params.conversationMaterialId;
    console.log(id);

    return this.checkConversationCard(id);
  }
  
  checkConversationCard(id: string): Observable<boolean>{
    var found= false;
    this.store.select(fromState.getConversationCards).subscribe(data=>{
      data.map((card: ConversationCard)=>{
      if(card.id== id){
        this.store.dispatch(new fromState.UpdateCurrentConversationCard(card));
        found= true;
        console.log('found the id');
        console.log(card.id);

        }
      })
    });
    if(!found){
      this.store.dispatch(new fromRoot.Go({ path: ['conversation-materail'] }));
    } 
    console.log('returning ');
    console.log(found);

    return of(found);
  }
}
