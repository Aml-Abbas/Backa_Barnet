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
export class EditGuardianGuard implements CanActivate {

constructor(private store: Store<fromState.State>) {}

canActivate(): Observable<boolean> {
  this.store.select(fromState.getCurrentUserRoleID).pipe(
    tap((roleID)=>{
      if(roleID =='2'){
        this.store.dispatch(new fromRoot.Go({ path: ['edit-contact-guardian'] }));
      }
    })
  );
  this.store.dispatch(new fromRoot.Go({ path: ['contact-guardian'] }));
  return of(true);
}  
}
