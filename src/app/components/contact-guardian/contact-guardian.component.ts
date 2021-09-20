import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-contact-guardian',
  templateUrl: './contact-guardian.component.html',
  styleUrls: ['./contact-guardian.component.scss']
})
export class ContactGuardianComponent implements OnInit {
  contactName = '';
  contactTask = '';
  contactWorkPlace = '';
  supporterName = '';
  supporterTask = '';
  supporterWorkPlace = '';

  constructor() { }

  ngOnInit(): void {
  }

  public save(): void {
    console.log("contactName: " +  this.contactName);
    console.log("contactTask: " +  this.contactTask);
    console.log("contactWorkPlace: " +  this.contactWorkPlace);
    console.log("supporterName: " +  this.supporterName);
    console.log("supporterTask: " +  this.supporterTask);
    console.log("supporterWorkPlace: " +  this.supporterWorkPlace);
  }

}
