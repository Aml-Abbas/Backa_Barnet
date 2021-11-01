import { Injectable } from '@angular/core';
import { CanActivate} from '@angular/router';
import { Observable } from 'rxjs';
import * as fromState from '../state';
import { Store } from '@ngrx/store';
import { tap } from 'rxjs/operators';
import * as fromRoot from '../../app/state';
import { of } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class CreateEventGuard implements CanActivate {
  constructor(private store: Store<fromState.State>) {}

  canActivate(): Observable<boolean> {
    var currentUser= this.store.select(fromState.getCurrentUser);
    currentUser.subscribe(data=>{
      console.log(String(data?.roleID));
      if(String(data?.roleID)!='2'){
        this.store.dispatch(new fromRoot.Back());
      }
    });
  
    return of(true);
  }  
  }
