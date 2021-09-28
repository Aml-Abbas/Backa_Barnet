import { Component, OnInit } from '@angular/core';
import { Person } from 'src/app/models/Person';
import { Observable } from 'rxjs';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import {MatTableDataSource} from '@angular/material/table';

@Component({
  selector: 'app-contact',
  templateUrl: './contact.component.html',
  styleUrls: ['./contact.component.scss']
})
export class ContactComponent implements OnInit {
  persons$: Observable<Person[]> = new Observable<Person[]>();
  private persons:Person[]= [];
  displayedColumns: string[] = ['personID', 'firstName','changeDate'];
  dataSource = new MatTableDataSource(this.persons);

  constructor(private store: Store<fromState.State>) { }

  ngOnInit(): void {
    this.persons$ = this.store.select(fromState.getPersons);
    this.persons$.subscribe(data => {
      data.map((person:Person)=>{
      this.persons.push(person);
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
