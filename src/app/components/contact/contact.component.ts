import { Component, OnInit } from '@angular/core';
import { Person } from 'src/app/models/Person';
import { Observable } from 'rxjs';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import {MatTableDataSource} from '@angular/material/table';

export interface PersonTableElement {
  personNbr: string;
  name: string;
  changeDate: string
}

@Component({
  selector: 'app-contact',
  templateUrl: './contact.component.html',
  styleUrls: ['./contact.component.scss']
})
export class ContactComponent implements OnInit {
  persons$: Observable<Person[]> = new Observable<Person[]>();
  private persons:PersonTableElement[]= [];
  displayedColumns: string[] = ['personNbr', 'name','changeDate'];
  dataSource = new MatTableDataSource(this.persons);

  constructor(private store: Store<fromState.State>) { }

  ngOnInit(): void {
    this.persons$ = this.store.select(fromState.getPersons);
    this.persons$.subscribe(data => {
      data.map((person:Person)=>{
      let personNbr= person.personNr.slice(2, 12);
      let name= person.firstName+' '+ person.lastName;
      let changeDate= person.changeDate.slice(0, 10);
      let personTableElement= {personNbr, name, changeDate}; 
      this.persons.push(personTableElement);
      })
  });
  }

  setCurrentPerson(person: Person) {
    this.store.dispatch(new fromState.UpdatePerson(person));
  }

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }

}
