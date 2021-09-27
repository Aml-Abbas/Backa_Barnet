import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { Person } from 'src/app/models/Person';
import * as fromRoot from '../../state';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';


@Component({
  selector: 'app-edit-contact-person',
  templateUrl: './edit-contact-person.component.html',
  styleUrls: ['./edit-contact-person.component.scss']
})
export class EditContactPersonComponent implements OnInit {
  current_person$= new Observable<Person | null>();

  constructor(private store: Store<fromState.State>) { }

  ngOnInit(): void {
    this.current_person$ = this.store.select(fromState.getCurrentPerson);
  }

  public save(): void {
    this.store.dispatch(new fromRoot.Go({ path: ['contact-person'] }));
  }

}
