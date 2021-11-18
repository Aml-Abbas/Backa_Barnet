import { Component, OnInit } from '@angular/core';
import { Person } from 'src/app/models/Person';
import { Observable } from 'rxjs';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import { User } from 'src/app/models/User';

@Component({
  selector: 'app-contact',
  templateUrl: './contact.component.html',
  styleUrls: ['./contact.component.scss']
})
export class ContactComponent implements OnInit {
  persons$: Observable<Person[]> = new Observable<Person[]>();
  current_user$: Observable<User| null> = new Observable<User| null>();
  clickedRows = new Set<Person>();
  persons: Person[]=[];
  searchPersons: Person[]= [];

  constructor(private store: Store<fromState.State>) { }

  ngOnInit(): void {
    this.current_user$ = this.store.select(fromState.getCurrentUser);
    this.current_user$.subscribe(data => {
      let userID: string = data?.userID ?? '';
      this.store.dispatch(new fromState.LoadPersons(userID));
    });

    this.persons$ = this.store.select(fromState.getPersons);

    this.persons$.subscribe(data => {
      this.persons=[];

       data.map((person:Person)=>{
        let personNbr= person.personNbr;
        let lastName= person.lastName;
        let firstName= person.firstName;

        let name= person.firstName+' '+ person.lastName;
        let guardian1= person.guardian1;
        let guardianPersonNbr1= person.guardianPersonNbr1;
        let guardian2= person.guardian2;
        let guardianPersonNbr2= person.guardianPersonNbr2;

        let changedBy = person.changedBy;
        let changedOn = person.changedOn;
        let status= person.status;
        let personID= person.personID;
        console.log(status);
        console.log(this.persons);

        if(status!= 'Anonymiserad'){
          this.persons.push({personNbr, lastName, firstName, name,
            guardian1, guardianPersonNbr1, guardian2, guardianPersonNbr2, 
            changedBy, changedOn, status, personID});  
        }
      }

    ) 
 });
}

  setCurrentPerson(person: Person) {
    this.store.dispatch(new fromState.UpdatePerson(person));
    this.clickedRows.clear();
    this.clickedRows.add(person);
  }

  applyFilter(event: Event) {
    this.searchPersons=[];
    
    const filterValue = (event.target as HTMLInputElement).value;
    console.log(this.searchPersons);
    this.persons.forEach(person=>{
      if(person.personNbr.includes(filterValue) || person.name.includes(filterValue)|| person.status.includes(filterValue)|| person.changedOn.includes(filterValue)){
        this.searchPersons.push(person);
      }
   });
  }

}
