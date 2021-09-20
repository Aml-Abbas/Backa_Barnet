import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-contact-person',
  templateUrl: './contact-person.component.html',
  styleUrls: ['./contact-person.component.scss']
})
export class ContactPersonComponent implements OnInit {
  namn = '';
  personNumber = '';
  address = '';
  currentAddress = '';
  postNumber = '';
  currentPostNumber = '';

  constructor() { }

  ngOnInit(): void {
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
