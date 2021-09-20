import { Component, OnInit } from '@angular/core';
import {ActivatedRoute, Router} from '@angular/router';

@Component({
  selector: 'app-sign-in',
  templateUrl: './sign-in.component.html',
  styleUrls: ['./sign-in.component.scss']
})
export class SignInComponent implements OnInit {
  hide = true;
  email = '';
  enteredPassword = '';
  router: Router;


  constructor(router: Router, private aRoute: ActivatedRoute) { 
    this.router = router;

  }

  ngOnInit(): void {
  }

  public login(): void {
    console.log("email: " +  this.email);
    console.log("Lösenord: " +  this.enteredPassword);

    if(true){
      this.router.navigate(
        ['../contact'],
        {replaceUrl: true, relativeTo: this.aRoute});
    }
  }

}
