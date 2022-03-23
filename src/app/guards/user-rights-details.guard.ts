import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate } from '@angular/router';
import { Observable } from 'rxjs';
import * as fromState from '../state';
import { Store } from '@ngrx/store';
import { tap } from 'rxjs/operators';
import * as fromRoot from '../../app/state';
import { of } from 'rxjs';
import { UserRight } from '../models/UserRight';


@Injectable({
  providedIn: 'root'
})
export class UserRightsDetailsGuard implements CanActivate {
  constructor(private store: Store<fromState.State>) { }

  // check the user's rights, only admin and barnkontakt can enter this page
  canActivate(route: ActivatedRouteSnapshot): Observable<boolean> {
    var userid = route.params.userId;
    var personid = route.params.personId;
    var type = route.params.type;

    var found = false;
    this.store.select(fromState.getUserRights).subscribe(data => {
      data.map((userRight:UserRight) => {
        if (userRight.userID == userid && userRight.personID == personid && userRight.questionTypeID == type ) {
          this.store.dispatch(new fromState.UpdateUserRight(userRight));
          found = true;
        }
      })
    });
    if (!found) {
      this.store.dispatch(new fromRoot.Go({ path: ['rights'] }));
    }
    return of(found);

  }
}
