import { Component, OnInit } from '@angular/core';
import {Store} from '@ngrx/store';
import * as fromStore from 'src/app/state';
import {LoginInfo} from '../../models/LoginInfo.model';


@Component({
  selector: 'app-sign-in',
  templateUrl: './sign-in.component.html',
  styleUrls: ['./sign-in.component.scss']
})
export class SignInComponent implements OnInit {
  hide = true;
  signinError='';
  email = 'adnan.karahmetovic@cgi.com';
  enteredPassword = '*r3hHXj&YC5M@R@J';
  public loginInfo: LoginInfo = {email: '', password: ''};

  constructor(private store: Store<fromStore.State>) { 
  }

  ngOnInit(): void {
  }

  public signIn(): void{
    this.loginInfo = {email: this.email, password: this.enteredPassword};
    this.store.dispatch(new fromStore.Login(this.loginInfo));
  }

}
