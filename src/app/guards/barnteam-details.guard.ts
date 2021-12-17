import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate } from '@angular/router';
import { Observable } from 'rxjs';
import * as fromState from '../state';
import { Store } from '@ngrx/store';
import * as fromRoot from '../../app/state';
import { of } from 'rxjs';
import { Card } from 'src/app/models/Card';
import { GetSetService } from 'src/app/services/get-set/get-set.service';
import { Barnteam } from '../models/Barnteam';


@Injectable({
  providedIn: 'root'
})
export class BarnteamDetailsGuard implements CanActivate {
  constructor(private store: Store<fromState.State>,
    private getSetService: GetSetService) {}

  canActivate(route: ActivatedRouteSnapshot):  Observable<boolean>{
    var userID= route.params.userid;
    return this.checkUser(userID);
  }
  
  checkUser(id: string): Observable<boolean>{
    var found= false;

    var teams = this.store.select(fromState.getCurrentTeams);
    teams.subscribe(data=>{
      data.map((team: Barnteam)=>{
      if(team.teamID== id){
        this.store.dispatch(new fromState.UpdateAdminBarnteam(team));
        found= true;
        }
      })
    });
    if(!found){
    this.store.dispatch(new fromRoot.Go({ path: ['barnteam'] }));
    }
    return of(found);
  }
}
