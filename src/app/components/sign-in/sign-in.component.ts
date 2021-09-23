import { Component, OnInit } from '@angular/core';
import {ActivatedRoute, Router} from '@angular/router';
import { Person } from 'src/app/models/Person';
import { PersonsService } from 'src/app/services/persons/persons.service';
import { SignInService } from 'src/app/services/sign-in/sign-in.service';


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
  in_signedin:boolean= false;
  persons_list: Person[]= [];


  constructor(router: Router, 
    private aRoute: ActivatedRoute,
    private signInService: SignInService,
    private personsService: PersonsService) { 
    this.router = router;

  }

  ngOnInit(): void {
  }

  public signIn(): Person[] {
    return this.signInService.signIn(this.email, this.enteredPassword);
  }

}
