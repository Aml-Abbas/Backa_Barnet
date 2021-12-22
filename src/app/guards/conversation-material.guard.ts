import { Injectable } from '@angular/core';
import { CanActivate } from '@angular/router';
import { Observable } from 'rxjs';
import * as fromState from '../state';
import { Store } from '@ngrx/store';
import * as fromRoot from '../../app/state';
import { of } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ConversationMaterialGuard implements CanActivate {
  constructor(private store: Store<fromState.State>) { }

  // check the user's rights, only admin and barnkontakt can enter this page
  canActivate(): Observable<boolean> {
    var currentUser = this.store.select(fromState.getCurrentUser);
    var current_person = this.store.select(fromState.getCurrentPerson);
    current_person.subscribe(data => {
      this.store.dispatch(new fromState.LoadConversationMaterial(data?.personID ?? ''));
    });

    currentUser.subscribe(data => {
      if (String(data?.roleID) != '2' && String(data?.roleID) != '4') {
        this.store.dispatch(new fromRoot.Back());
      }
    });

    return of(true);
  }
}
