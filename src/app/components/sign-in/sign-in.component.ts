import { Component, OnInit } from '@angular/core';
import {ActivatedRoute, Router} from '@angular/router';
import { SignInService } from 'src/app/services/sign-in/sign-in.service';
import { Person } from 'src/app/models/person';
import { BehaviorSubject } from 'rxjs';


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
  persons: Person[]= []
  private persons_list= new BehaviorSubject<Person[]>(this.persons);
  current_persons_list= this.persons_list.asObservable();

  constructor(router: Router, 
    private aRoute: ActivatedRoute,
    private signInService: SignInService) { 
    this.router = router;

  }

  ngOnInit(): void {
  }

  public signIn(): void {

    this.signInService.signIn(this.email, this.enteredPassword).subscribe(
      (data)=>{
        console.warn(data);
        this.persons= data;
        console.warn(this.persons_list);
      
          this.router.navigate(
          ['../contact'],
          {replaceUrl: true, relativeTo: this.aRoute});

      }, (error)=>{
        this.signinError= 'Fel email eller lösenord';
      }
    );

    /*     if(this.in_signedin){
          this.router.navigate(
          ['../contact'],
          {replaceUrl: true, relativeTo: this.aRoute});
    }else{
      this.signinError= 'Fel email eller lösenord';
    } */
  }

}
