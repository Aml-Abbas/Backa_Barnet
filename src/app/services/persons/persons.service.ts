import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { Person } from 'src/app/models/Person';


@Injectable({
  providedIn: 'root'
})
export class PersonsService {

  private persons_list= new BehaviorSubject<Person[]>([]);
  private storedNames = JSON.parse(localStorage.getItem("personsList") || '[]');

  
  current_persons_list$= this.persons_list.asObservable();

  constructor() {
    this.persons_list.next(this.storedNames);

   }

  setPersonList(persons: Person[]){
    this.persons_list.next(persons);
  }
}
