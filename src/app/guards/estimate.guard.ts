import { Injectable } from '@angular/core';
import { CanActivate } from '@angular/router';
import { Observable } from 'rxjs';
import * as fromState from '../state';
import { Store } from '@ngrx/store';
import { tap } from 'rxjs/operators';
import * as fromRoot from '../../app/state';
import { of } from 'rxjs';
import { UserRight } from '../models/UserRight';
import { UserRightService } from '../services/rights/user-right.service';

@Injectable({
  providedIn: 'root'
})
export class EstimateGuard implements CanActivate {
  constructor(private store: Store<fromState.State>,
    private userRight: UserRightService) { }

  // check the user's rights, only admin, barnteam and barnkontakt can enter this page
  canActivate(): Observable<boolean> {
    var userid;
    var personid;

    var currentUser = this.store.select(fromState.getCurrentUser);
    currentUser.subscribe(data => {
      userid= (data?.userID ?? '');
    });

    var current_person = this.store.select(fromState.getCurrentPerson);
    current_person.subscribe(data => {
      personid=  (data?.personID ?? '');
    });

    if(userid =='2' || userid == '4'|| userid == '3'){
      return of(true);
     }
else{
  return this.checkRights(userid, personid);
}
}

  checkRights(userid: string, personid: string): Observable<boolean> {
    var found = false;
    var usersRights$ = this.userRight.getRight(parseInt(userid), parseInt(personid));
    console.log('userid '+userid);
    console.log('personid: '+personid);

    usersRights$.subscribe(data => {
     data.map((userRight:UserRight) => {
      console.log('userRight.questionTypeID '+userRight.questionTypeID);

       if(userRight.questionTypeID =='2'){
        found = true;
        console.log('found');
        return of(true);
       }
     })
   });

    if (!found) {
      this.store.dispatch(new fromRoot.Back());
      return of(true);
    }
    return of(found);
  }

}