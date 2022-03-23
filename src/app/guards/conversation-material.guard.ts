import { Injectable } from '@angular/core';
import { ActivatedRoute, CanActivate } from '@angular/router';
import { Observable } from 'rxjs';
import * as fromState from '../state';
import { Store } from '@ngrx/store';
import * as fromRoot from '../../app/state';
import { of } from 'rxjs';
import { UserRightService } from '../services/rights/user-right.service';
import { UserRight } from '../models/UserRight';

@Injectable({
  providedIn: 'root'
})
export class ConversationMaterialGuard implements CanActivate {
  constructor(private store: Store<fromState.State>,
    private userRight: UserRightService) { }

  // check the user's rights, only admin and barnkontakt can enter this page
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

    if(userid =='2' || userid == '4'){
      found = true;
      console.log('found');
     }

     this.store.select(fromState.getUserPermission).subscribe(data => {
      data.map((userRight:UserRight) => {
      console.log('userRight.questionTypeID '+userRight.questionTypeID);

       if(userRight.questionTypeID =='1'){
        found = true;
        console.log('found');
       }
     })
   });

    return of(found);
  }

}
