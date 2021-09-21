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
  email = '';
  enteredPassword = '';
  router: Router;


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

    this.signInService.signIn().subscribe((data)=>{
      console.warn("get api data", data);
      // console.warn("personNr", data['personNr']);

    })

    if(true){
      this.router.navigate(
        ['../contact'],
        {replaceUrl: true, relativeTo: this.aRoute});
    }
  }

}
