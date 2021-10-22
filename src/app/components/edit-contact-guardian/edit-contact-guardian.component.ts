import { Component, OnInit } from '@angular/core';
import * as fromRoot from '../../state';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import { Observable } from 'rxjs';
import { Person } from 'src/app/models/Person';
import { Contact } from 'src/app/models/Contact';
import { ContactGuardianService } from 'src/app/services/contact-guardian/contact-guardian.service';

@Component({
  selector: 'app-edit-contact-guardian',
  templateUrl: './edit-contact-guardian.component.html',
  styleUrls: ['./edit-contact-guardian.component.scss']
})
export class EditContactGuardianComponent implements OnInit {
  current_person$= new Observable<Person | null>();

  contactName = '';
  contactTask = '';
  contactWorkPlace = '';
  supporterName = '';
  supporterTask = '';
  supporterWorkPlace = '';

  contacts$: Observable<Contact[]>=  new Observable<Contact[]>();
  contacts: Contact[];
  
  constructor(private store: Store<fromState.State>,
    private contactGuardianService: ContactGuardianService) { }

  ngOnInit(): void {
    this.current_person$ = this.store.select(fromState.getCurrentPerson);
    this.contacts$= this.contactGuardianService.getContacts('');

    this.contactName = '';
    this.contactTask = '';
    this.contactWorkPlace = '';
    this.supporterName = '';
    this.supporterTask = '';
    this.supporterWorkPlace = '';

      this.contacts$.subscribe(data => {
        data.map((contact:Contact)=>{
          let contactPersonNbr= contact.contactPersonNbr;
          let lastName= contact.lastName;
          let firstName= contact.firstName;
  
          let phoneNbr = contact.phoneNbr;
          let employer = contact.employer;  
          
          this.contacts.push({contactPersonNbr, lastName, firstName, phoneNbr, employer});
         })
          });

  }

  public save(): void {
    this.store.dispatch(new fromRoot.Go({ path: ['contact-guardian'] }));
  }


}
