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


}
