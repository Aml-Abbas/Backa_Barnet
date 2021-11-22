import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, RouterStateSnapshot, UrlTree } from '@angular/router';
import { Observable } from 'rxjs';
import * as fromState from '../state';
import { Store } from '@ngrx/store';
import { tap } from 'rxjs/operators';
import * as fromRoot from '../../app/state';
import { of } from 'rxjs';
import { ConversationCard } from '../models/ConversationCard';

@Injectable({
  providedIn: 'root'
})
export class ConversationMaterialEditGuard implements CanActivate {
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
      if(card.id== id && card.status== 'Sparat'){
        this.store.dispatch(new fromState.UpdateCurrentConversationCard(card));
        found= true;
        }
      })
    });
    if(!found){
    this.store.dispatch(new fromRoot.Go({ path: ['conversation-materail'] }));
    } 

    return of(found);
  }
}
