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
export class SignInGuard implements CanActivate {
  constructor(private store: Store<fromState.State>) {}

  canActivate(): Observable<boolean>{
    const storageValue = localStorage.getItem('state');
    if(storageValue){
      this.store.dispatch(new fromRoot.Back());
    }
    return of(true);
  }
  
}