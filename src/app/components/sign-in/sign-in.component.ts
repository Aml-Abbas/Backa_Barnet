import { Component, OnInit } from '@angular/core';
import {ActivatedRoute, Router} from '@angular/router';
import { SignInServiceService } from 'src/app/services/sign-in-service/sign-in-service.service';


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


  constructor(router: Router, 
    private aRoute: ActivatedRoute,
    private signInService: SignInServiceService) { 
    this.router = router;

  }

  ngOnInit(): void {
  }

  public signIn(): void {
    console.log("email: " +  this.email);
    console.log("Lösenord: " +  this.enteredPassword);

    this.signInService.signIn(this.email, this.enteredPassword).subscribe(
      (data)=>{
      console.warn("get api data", data);
      if(true){
        this.router.navigate(
          ['../contact'],
          {replaceUrl: true, relativeTo: this.aRoute});
      }
    },
    (error) => {
      this.signinError= 'Fel email eller lösenord';
    }
    )
  }

}
