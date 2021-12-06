import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate } from '@angular/router';
import { Observable } from 'rxjs';
import * as fromState from '../state';
import { Store } from '@ngrx/store';
import * as fromRoot from '../../app/state';
import { of } from 'rxjs';
import { Card } from 'src/app/models/Card';
import { GetSetService } from 'src/app/services/get-set/get-set.service';
import { User } from '../models/User';

@Injectable({
  providedIn: 'root'
})
export class UserDetailsGuard implements CanActivate {
  constructor(private store: Store<fromState.State>,
    private getSetService: GetSetService) {}

  canActivate(route: ActivatedRouteSnapshot):  Observable<boolean>{
    var userID= route.params.userid;
    console.log(userID);
    return this.checkUser(userID);
  }
  
  checkUser(id: string): Observable<boolean>{
    var found= false;
    console.log('will check');

    var users = this.store.select(fromState.getCurrentUsers);
    users.subscribe(data=>{
      data.map((user: User)=>{
      if(user.userID== id){
        console.log(user.userID);

        this.store.dispatch(new fromState.UpdateAdminUser(user));
        found= true;
        console.log(found);
        }
      })
    });
    if(!found){
    this.store.dispatch(new fromRoot.Go({ path: ['users'] }));
    }
    return of(found);
  }
}
