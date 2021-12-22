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
  current_person$ = new Observable<Person | null>();

  barnKontakt$ = new Observable<Contact[] | null>();

  userRoleId: string;

  constructor(private store: Store<fromState.State>,
    private getSetService: GetSetService) { }

  // get the contact of the choosen child and diaplay it on the page
  // Stödsamordnare-> To be implemented in the next phase
  // html and css code for "Stödsamordnare" in place, just uncomment it and write the javascript code for it
  ngOnInit(): void {
    this.current_person$ = this.store.select(fromState.getCurrentPerson);
    this.current_person$.subscribe(data => {
      this.barnKontakt$ = this.getSetService.getBarnKontakt(String(data?.personID));
    });
    this.store.select(fromState.getCurrentUser).subscribe(data => {
      this.userRoleId = String(data?.roleID);
    });

  }


}
