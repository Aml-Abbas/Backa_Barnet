import { Component, OnInit } from '@angular/core';
import { Person } from 'src/app/models/Person';
import { Observable } from 'rxjs';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';

@Component({
  selector: 'app-contact-guardian',
  templateUrl: './contact-guardian.component.html',
  styleUrls: ['./contact-guardian.component.scss']
})
export class ContactGuardianComponent implements OnInit {
  current_person$= new Observable<Person | null>();

  constructor(private store: Store<fromState.State>) { }

  ngOnInit(): void {
    this.current_person$ = this.store.select(fromState.getCurrentPerson);
    
  }


}
