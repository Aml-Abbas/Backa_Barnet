import { Injectable } from '@angular/core';
import { CanActivate } from '@angular/router';
import * as fromState from '../state';
import { Store } from '@ngrx/store';
import { tap } from 'rxjs/operators';
import * as fromRoot from '../../app/state';
import { Observable } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {

  constructor(private store: Store<fromState.State>) {}

canActivate(): Observable<boolean> {
  return this.store.select(fromState.getLoggedIn).pipe(
    tap((loggedIn) => {
      if (!loggedIn) {
        this.store.dispatch(new fromRoot.Go({ path: ['sign-in'] }));
      }
    })
  );

}
}
