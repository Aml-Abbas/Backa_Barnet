import { Component, OnInit } from '@angular/core';
import {ActivatedRoute, Router} from '@angular/router';
import { Person } from 'src/app/models/Person';
import { PersonsService } from 'src/app/services/persons/persons.service';
import { SignInService } from 'src/app/services/sign-in/sign-in.service';
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
  email = 'adnan.karahmetovic@cgi.com';
  enteredPassword = '*r3hHXj&YC5M@R@J';
  router: Router;
  signinError = '';
  persons_list: Person[]= [];
  public loginInfo: LoginInfo = {email: '', password: ''};

  constructor(router: Router, 
    private store: Store<fromStore.State>) { 
    this.router = router;
  }

  ngOnInit(): void {
  }

  public signIn(): void{
    this.loginInfo = {email: this.email, password: this.enteredPassword};
    this.store.dispatch(new fromStore.Login(this.loginInfo));
  }

}
