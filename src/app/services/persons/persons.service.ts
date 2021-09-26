import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { Person } from 'src/app/models/Person';


@Injectable({
  providedIn: 'root'
})
export class PersonsService {

  private current_person= new BehaviorSubject<Person>(new Person('','','','','','','','','','','',''));
  private storedPerson = JSON.parse(localStorage.getItem("currentPerson") || '[]');

  
  current_person$= this.current_person.asObservable();

  constructor() {
    this.current_person.next(this.storedPerson);
   }

   setPerson(person: Person){
    this.current_person.next(person);
  } 
}
