import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate } from '@angular/router';
import { Observable } from 'rxjs';
import * as fromState from '../state';
import { Store } from '@ngrx/store';
import { of } from 'rxjs';
import { ConversationCard } from '../models/ConversationCard';
import * as fromRoot from '../../app/state';

@Injectable({
  providedIn: 'root'
})
export class ConversationMaterialEditGuard implements CanActivate {
  constructor(private store: Store<fromState.State>) { }

  // check if there is a samtalsunderlag with the same id before send the user to the samtalsunderlag edit page
  canActivate(route: ActivatedRouteSnapshot): Observable<boolean> {
    var gradedOn = route.params.conversationMaterialId;
    return this.checkConversationCard(gradedOn);
  }

  checkConversationCard(gradedOn: string): Observable<boolean> {
    var found = false;
    this.store.select(fromState.getConversationCards).subscribe(data => {
      data.map((card: ConversationCard) => {
        if (card.gradedOn == gradedOn && card.status == 'Sparat') {
          this.store.dispatch(new fromState.UpdateCurrentConversationCard(card));
          found = true;
          return of(true);
        }
      })
    });
    if (!found) {
      this.store.dispatch(new fromRoot.Go({ path: ['conversation-material'] }));
      return of(true);
    }
    return of(found);
  }
}
