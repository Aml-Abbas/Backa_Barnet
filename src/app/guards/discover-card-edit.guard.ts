import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, RouterStateSnapshot, UrlTree } from '@angular/router';
import { Observable } from 'rxjs';
import * as fromState from '../state';
import { Store } from '@ngrx/store';
import { tap } from 'rxjs/operators';
import * as fromRoot from '../../app/state';
import { of } from 'rxjs';
import { Card } from 'src/app/models/Card';

@Injectable({
  providedIn: 'root'
})
export class DiscoverCardEditGuard implements CanActivate {
  constructor(private store: Store<fromState.State>) {}


  canActivate(route: ActivatedRouteSnapshot):  Observable<boolean>{
    var id= route.params.discoverCardId;
    console.log(id);

    return this.checkDiscoverCard(id);
  }
  
  checkDiscoverCard(id: string): Observable<boolean>{
    var found= false;
    this.store.select(fromState.getCurrentCards).subscribe(data=>{
      data.map((card: Card)=>{
      if(card.id== id && card.status== 'Sparat'){
        this.store.dispatch(new fromState.UpdateCard(card));
        found= true;
        }
      })
    });
    if(!found){
    this.store.dispatch(new fromRoot.Go({ path: ['discover-card'] }));
    }

    return of(found);
  }
}
