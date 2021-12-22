import { Injectable } from '@angular/core';
import { CanActivate } from '@angular/router';
import { Observable } from 'rxjs';
import * as fromState from '../state';
import { Store } from '@ngrx/store';
import { tap } from 'rxjs/operators';
import * as fromRoot from '../../app/state';
import { of } from 'rxjs';

@Injectable({
  providedIn: 'root'
})

// not used now, too be used in the nex phase . When implementing the edit-guardian page
// only the admin and barnkontakt can enter this page
export class EditGuardianGuard implements CanActivate {

  constructor(private store: Store<fromState.State>) { }

  canActivate(): Observable<boolean> {
    var currentUser = this.store.select(fromState.getCurrentUser);
    currentUser.subscribe(data => {
      if (String(data?.roleID) != '2' && String(data?.roleID) != '4') {
        this.store.dispatch(new fromRoot.Back());
      }
    });

    return of(true);
  }
}
