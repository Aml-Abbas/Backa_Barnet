import { Component, OnInit } from '@angular/core';
import * as fromRoot from '../../state';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';

@Component({
  selector: 'app-edit-contact-guardian',
  templateUrl: './edit-contact-guardian.component.html',
  styleUrls: ['./edit-contact-guardian.component.scss']
})
export class EditContactGuardianComponent implements OnInit {
  contactName = '';
  contactTask = '';
  contactWorkPlace = '';
  supporterName = '';
  supporterTask = '';
  supporterWorkPlace = '';

  constructor(private store: Store<fromState.State>) { }

  ngOnInit(): void {
  }

  public save(): void {
    console.log("contactName: " +  this.contactName);
    console.log("contactTask: " +  this.contactTask);
    console.log("contactWorkPlace: " +  this.contactWorkPlace);
    console.log("supporterName: " +  this.supporterName);
    console.log("supporterTask: " +  this.supporterTask);
    console.log("supporterWorkPlace: " +  this.supporterWorkPlace);
    this.store.dispatch(new fromRoot.Go({ path: ['contact-guardian'] }));

  }


}
