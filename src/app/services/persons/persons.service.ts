import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { Person } from 'src/app/models/Person';


@Injectable({
  providedIn: 'root'
})
export class PersonsService {

  private persons_list= new BehaviorSubject<Person[]>([]);
  private storedNames = JSON.parse(localStorage.getItem("personsList") || '[]');

  private current_person= new BehaviorSubject<Person>(new Person('','','','','','','','','','','',''));
  private storedPerson = JSON.parse(localStorage.getItem("currentPerson") || '[]');

  
  current_persons_list$= this.persons_list.asObservable();
  current_person$= this.current_person.asObservable();

  constructor() {
    this.persons_list.next(this.storedNames);
    this.current_person.next(this.storedPerson);
   }

  setPersonList(persons: Person[]){
    this.persons_list.next(persons);
  }

   setPerson(person: Person){
    this.current_person.next(person);
  } 
}
