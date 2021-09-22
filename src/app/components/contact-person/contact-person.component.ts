import { Component, OnInit } from '@angular/core';
import { Person } from 'src/app/models/Person';
import { PersonsService } from 'src/app/services/persons/persons.service';

@Component({
  selector: 'app-contact-person',
  templateUrl: './contact-person.component.html',
  styleUrls: ['./contact-person.component.scss']
})
export class ContactPersonComponent implements OnInit {

  current_person= JSON.parse(localStorage.currentPerson || '[]');
  firstName= (this.current_person.firstName || '');
  lastName= (this.current_person.lastName || '');

  namn = this.firstName+" "+ this.lastName;
  personNumber = this.current_person.personNr;
  address = this.current_person.address;
  currentAddress = '';
  postNumber = '';
  currentPostNumber = '';

  constructor(private personsService: PersonsService) { }

  ngOnInit(): void {
    this.personsService.current_person$.subscribe(current_person=> this.current_person=current_person);
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
