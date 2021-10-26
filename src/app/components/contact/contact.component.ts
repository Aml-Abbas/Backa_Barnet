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
  displayedColumns: string[] = ['personNbr', 'firstName','changedOn', 'status'];
  dataSource = new MatTableDataSource(this.persons);

  constructor(private store: Store<fromState.State>) { }

  ngOnInit(): void {
    this.persons$ = this.store.select(fromState.getPersons);
   
    this.persons$.subscribe(data => {
      data.map((person:Person)=>{
        let personNbr= person.personNbr.slice(0, 12);
        let lastName= person.lastName;
        let firstName= person.firstName;

        let guardian1= person.guardian1;
        let guardianPersonNbr1= person.guardianPersonNbr1;
        let guardian2= person.guardian2;
        let guardianPersonNbr2= person.guardianPersonNbr2;

        let changedBy = person.changedBy;
        let changedOn = person.changedOn.slice(0, 10);
        let status= person.status;

        
        this.persons.push({personNbr, lastName, firstName,
          guardian1, guardianPersonNbr1, guardian2, guardianPersonNbr2, 
          changedBy, changedOn, status});
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
