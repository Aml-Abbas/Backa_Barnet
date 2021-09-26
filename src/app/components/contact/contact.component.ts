import { Component, OnInit } from '@angular/core';
import { Person } from 'src/app/models/Person';
import {Observable} from 'rxjs';
import {Store} from '@ngrx/store';
import * as fromState from '../../state';
import {map} from 'rxjs/operators';


@Component({
  selector: 'app-contact',
  templateUrl: './contact.component.html',
  styleUrls: ['./contact.component.scss']
})
export class ContactComponent implements OnInit {
  persons$: Observable<Person[]> = new Observable<Person[]>();

  constructor(private store: Store<fromState.State>) { }

  ngOnInit(): void {
    this.persons$ = this.store.select(fromState.getPersons);
    }

    setCurrentPerson(personNbr: string){
      this.persons$.pipe(map(persons => persons.map(person => {
        if (person.personNr== personNbr) {
          console.log(personNbr);
          console.log(person.personNr);
        }
      })));
    }

}
