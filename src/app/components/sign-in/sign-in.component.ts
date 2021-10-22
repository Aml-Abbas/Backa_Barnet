import { Component, OnInit } from '@angular/core';
import {Store} from '@ngrx/store';
import * as fromStore from 'src/app/state';
import {LoginInfo} from '../../models/LoginInfo.model';
import {Actions, ofType} from '@ngrx/effects';
import * as loginAction from '../../state/actions/login.action';
import { tap } from 'rxjs/operators';
import {FormControl, Validators} from '@angular/forms';
import { User } from 'src/app/models/User';


@Component({
  selector: 'app-sign-in',
  templateUrl: './sign-in.component.html',
  styleUrls: ['./sign-in.component.scss']
})
export class SignInComponent implements OnInit {
  hide = true;
  signinError='';
  email = 'adnan.karahmetovic@cgi.com';
  //email = 'aml.abbas@cgi.com';
  //email = 'tony.jonsson@cgi.com';

  enteredPassword = 'pw123';


  public loginInfo: LoginInfo = {email: '', password: ''};
  emailFormControl = new FormControl('', [
    Validators.required,
    Validators.email,
  ]);

  constructor(private store: Store<fromStore.State>,
    private actions$: Actions) {}

  ngOnInit(): void {

    this.actions$.pipe(
      ofType(loginAction.LOGIN_FAIL),
      tap(() => {
        this.signinError= 'Fel e-post eller lösenord!';
            })
    ).subscribe();

  }

  public signIn(): void{
    this.loginInfo = {email: this.email, password: this.enteredPassword};
    this.store.dispatch(new fromStore.Login(this.loginInfo));
    //this.store.dispatch(new fromStore.LoadCurrentUser(new User('1993','19930819', 'Abbas', 'Aml', '1','4','aml.abbas','skolan', 'barnkontakt')));
  }

}