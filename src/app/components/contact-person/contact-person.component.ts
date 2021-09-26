import { Component, OnInit } from '@angular/core';
import { Person } from 'src/app/models/Person';
import { Observable } from 'rxjs';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';


@Component({
  selector: 'app-contact-person',
  templateUrl: './contact-person.component.html',
  styleUrls: ['./contact-person.component.scss']
})
export class ContactPersonComponent implements OnInit {

  current_person$= new Observable<Person | null>();

  namn = '';
  personNumber = '';
  address = '';
  currentAddress = '';
  postNumber = '';
  currentPostNumber = '';

  constructor(private store: Store<fromState.State>) { }

  ngOnInit(): void {
    this.current_person$ = this.store.select(fromState.getCurrentPerson);
  }

  public save(): void {
    console.log("namn: " +  this.namn);
    console.log("personNumber: " +  this.personNumber);
    console.log("address: " +  this.address);
    console.log("currentAddress: " +  this.currentAddress);
    console.log("postNumber: " +  this.postNumber);
    console.log("currentPostNumber: " +  this.currentPostNumber);
  }
}
