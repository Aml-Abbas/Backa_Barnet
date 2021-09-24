import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';
import { SignInService } from '../services/sign-in/sign-in.service';
import * as fromState from '../state';
import { Store } from '@ngrx/store';
import { tap, filter, take, switchMap, catchError } from 'rxjs/operators';
import * as fromRoot from '../../app/state';
import { Observable } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {

  constructor(private signinService: SignInService,
    private router: Router,
    private store: Store<fromState.State>) {

}

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
