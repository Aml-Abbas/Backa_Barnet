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

  public signIn(): void {

    this.signInService.signIn(this.email, this.enteredPassword).subscribe(
      (data)=>{


        let int_ref = this.persons_list;

        data.map( function(v, i) {
          
          // int_ref.push(new Person(v.name, ))

          let int_person = new Person(
                                      v.personID,
                                      v.personNr,
                                      v.lastName,
                                      v.firstName,
                                      v.address,
                                      v.city,
                                      v.personRoleID,
                                      v.personTypeID,
                                      v.createBy,
                                      v.createDate,
                                      v.changeBy,
                                      v.changeDate
                                      )    

          int_ref.push(int_person);

        })

          this.personsService.setPersonList(this.persons_list);
          this.router.navigate(
          ['../contact'],
          {replaceUrl: true, relativeTo: this.aRoute});

      }, (error)=>{
        this.signinError= 'Fel email eller lösenord';
      }
    );

  }

}
