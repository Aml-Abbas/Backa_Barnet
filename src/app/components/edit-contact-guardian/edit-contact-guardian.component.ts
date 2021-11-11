import { Component, OnInit } from '@angular/core';
import * as fromRoot from '../../state';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import { Observable } from 'rxjs';
import { Person } from 'src/app/models/Person';
import { Contact } from 'src/app/models/Contact';
import { GetSetService } from 'src/app/services/get-set/get-set.service';

@Component({
  selector: 'app-edit-contact-guardian',
  templateUrl: './edit-contact-guardian.component.html',
  styleUrls: ['./edit-contact-guardian.component.scss']
})
export class EditContactGuardianComponent implements OnInit {
  current_person$= new Observable<Person | null>();
  contacts$: Observable<Contact[]>=  new Observable<Contact[]>();
  contacts: Contact[]= [new Contact('', '','','',''),
                        new Contact('', '','','','')];
  contactName='H';
  supporterName='N';

  contactTask='';
  supporterTask='';

  contactWorkPlace='';
  supporterWorkPlace='';
  userRoleId: string;

  constructor(private store: Store<fromState.State>,
    private getSetService: GetSetService) { }

  ngOnInit(): void {
    this.current_person$ = this.store.select(fromState.getCurrentPerson);
    this.current_person$.subscribe(data=>{
      this.contacts$= this.getSetService.getContacts(String(data?.personNbr));
    });
    var index=0;

    this.contacts$.subscribe(data => {
        data.map((contact:Contact)=>{
          let contactPersonNbr= contact.contactPersonNbr;
          let lastName= contact.lastName;
          let firstName= contact.firstName;
  
          let phoneNbr = contact.phoneNbr;
          let employer = contact.employer;  
          
          this.contacts[index]= new Contact(contactPersonNbr, lastName, firstName,
            phoneNbr, employer);
          index++;
          })
    
        });
          
        this.store.select(fromState.getCurrentUser).subscribe(data=>{
          this.userRoleId= String(data?.roleID);
    
        });
    
        this.contactName= this.contacts[0].firstName + this.contacts[0].lastName;
        this.supporterName= this.contacts[1].firstName+ this.contacts[1].lastName;

        this.contactTask= this.contacts[0].phoneNbr;
        this.supporterTask= this.contacts[1].phoneNbr;

        this.contactWorkPlace= this.contacts[0].employer;
        this.supporterWorkPlace= this.contacts[1].employer;
  }

  public save(): void {
    console.log(this.contacts);
    if(this.userRoleId=='4'){

    }else{

    }
    this.store.dispatch(new fromRoot.Go({ path: ['contact-guardian'] }));
  }


}
