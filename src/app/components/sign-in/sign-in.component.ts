import { Component, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import * as fromStore from 'src/app/state';
import { LoginInfo } from '../../models/LoginInfo.model';
import { Actions, ofType } from '@ngrx/effects';
import * as loginAction from '../../state/actions/login.action';
import { tap } from 'rxjs/operators';
import { FormControl, Validators } from '@angular/forms';


@Component({
  selector: 'app-sign-in',
  templateUrl: './sign-in.component.html',
  styleUrls: ['./sign-in.component.scss']
})
export class SignInComponent implements OnInit {
  hide = true;
  signinError = '';
  email: string;
  enteredPassword: string;

  public loginInfo: LoginInfo = { email: '', password: '' };
  emailFormControl = new FormControl('', [
    Validators.required,
    Validators.email,
  ]);

  constructor(private store: Store<fromStore.State>,
    private actions$: Actions) { }

  ngOnInit(): void {

    // Listen to the LOGIN_FAIL action and display a fail msg
    this.actions$.pipe(
      ofType(loginAction.LOGIN_FAIL),
      tap(() => {
        this.signinError = 'Fel e-post eller lösenord';
      })
    ).subscribe();

  }

  // This function is called when clicking on log in button
  // call the log in action to request login to the site
  public signIn(): void {
    if (this.emailFormControl.status != 'INVALID') {
      this.loginInfo = { email: this.email, password: this.enteredPassword };
      this.store.dispatch(new fromStore.Login(this.loginInfo));
    }
  }

}