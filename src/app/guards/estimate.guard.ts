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

    this.store.select(fromState.getCurrentUser).subscribe(data => {
      userid= (data?.userID ?? '');
    });

    this.store.select(fromState.getCurrentPerson).subscribe(data => {
      personid=  (data?.personID ?? '');
    });

  return this.checkRights(userid, personid);
}

  checkRights(userid: string, personid: string): Observable<boolean> {
    var found = false;

    if(userid =='2' || userid == '4'|| userid == '3'){
      found = true;
      console.log('found');
    }

    this.store.select(fromState.getUserPermission).subscribe(data => {
      data.map((userRight:UserRight) => {
      console.log('userRight.questionTypeID '+userRight.questionTypeID);

       if(userRight.questionTypeID =='2'){
        found = true;
        console.log('found');
       }
     })
   });

   if(!found){
    this.store.dispatch(new fromRoot.Go({ path: ['contact'] }));

   }
    return of(found);
  }

}