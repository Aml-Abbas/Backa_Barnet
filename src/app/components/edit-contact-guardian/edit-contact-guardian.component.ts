import { Component, OnInit } from '@angular/core';
import * as fromRoot from '../../state';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import { Observable } from 'rxjs';
import { Person } from 'src/app/models/Person';

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

  constructor(private store: Store<fromState.State>) { }

  ngOnInit(): void {
    this.current_person$ = this.store.select(fromState.getCurrentPerson);
  }

  public save(): void {
    this.store.dispatch(new fromRoot.Go({ path: ['contact-guardian'] }));
  }


}
