import { Component, OnInit } from '@angular/core';
import { Person } from 'src/app/models/Person';
import { Observable } from 'rxjs';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import {MatTableDataSource} from '@angular/material/table';
import * as fromStore from 'src/app/state';
import { User } from 'src/app/models/User';

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
  current_user$: Observable<User| null> = new Observable<User| null>();

  constructor(private store: Store<fromState.State>) { }

  ngOnInit(): void {
/*     this.current_user$ = this.store.select(fromState.getCurrentUser);
    this.current_user$.subscribe(data => {
      let userID: string = data?.userID ?? '';
      let lastName: string = data?.lastName ?? '';
      let firstName: string = data?.firstName ?? '';
      let email: string = data?.email ?? '';
      let roleID: string = data?.roleID ?? '';
      let description: string = data?.description ?? '';
    });

    this.store.dispatch(new fromState.LoadDiscoverCard(this.current_user.userID)); */

    this.persons$ = this.store.select(fromState.getPersons);
   
    this.persons$.subscribe(data => {
      data.map((person:Person)=>{
        let personNbr= person.personNbr;
        let lastName= person.lastName;
        let firstName= person.firstName;

        let guardian1= person.guardian1;
        let guardianPersonNbr1= person.guardianPersonNbr1;
        let guardian2= person.guardian2;
        let guardianPersonNbr2= person.guardianPersonNbr2;

        let changedBy = person.changedBy;
        let changedOn = person.changedOn;
        let status= person.status;

        if(status!='Anonymiserad'){
          this.persons.push({personNbr, lastName, firstName,
            guardian1, guardianPersonNbr1, guardian2, guardianPersonNbr2, 
            changedBy, changedOn, status});  
        }
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
