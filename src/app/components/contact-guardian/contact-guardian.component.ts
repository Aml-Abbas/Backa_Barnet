import { Component, OnInit } from '@angular/core';
import { Person } from 'src/app/models/Person';
import { Observable } from 'rxjs';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import { GetSetService } from 'src/app/services/get-set/get-set.service';
import { Contact } from 'src/app/models/Contact';

@Component({
  selector: 'app-contact-guardian',
  templateUrl: './contact-guardian.component.html',
  styleUrls: ['./contact-guardian.component.scss']
})
export class ContactGuardianComponent implements OnInit {
  current_person$= new Observable<Person | null>();

  barnKontakt$= new Observable<Contact[] | null>();

 /*  contacts$: Observable<Contact[]>=  new Observable<Contact[]>();
  contacts: Contact[]= [new Contact('','','','', '', ''),
                        new Contact('','','','','','')]; */
  userRoleId: string;

  constructor(private store: Store<fromState.State>,
              private getSetService: GetSetService) { }

  ngOnInit(): void {
    this.current_person$ = this.store.select(fromState.getCurrentPerson);
    this.current_person$.subscribe(data =>{
      console.log(String(data?.personID));
      this.barnKontakt$ = this.getSetService.getBarnKontakt(String(data?.personID));

     });
    this.store.select(fromState.getCurrentUser).subscribe(data=>{
      this.userRoleId= String(data?.roleID);
    });

      //this.contacts$= this.getSetService.getContacts(String(data?.personNbr));
/*       var index=0;
      this.contacts$.subscribe(data=>{
        data.map((contact: Contact)=>{
        var contactPersonNbr= contact.contactPersonNbr;
        var lastName= contact.lastName;
        var firstName= contact.firstName;
        var name='';
        if(lastName!='' && firstName!=''){
          name= contact.firstName + ' '+ contact.firstName; 
        }
        var phoneNbr= contact.phoneNbr;
        var employer= contact.employer;
    
        this.contacts[index]= new Contact(contactPersonNbr, lastName, firstName, name,
                                           phoneNbr, employer);
        index++;
        })
      }); */
  }


}
