import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { Person } from 'src/app/models/Person';


@Injectable({
  providedIn: 'root'
})
export class PersonsService {

  private persons_list= new BehaviorSubject<Person[]>([]);
  current_persons_list$= this.persons_list.asObservable();


  constructor() { }

  setPersonList(persons: Person[]){
    console.log("in the persons service 1: "+ persons);

    this.persons_list.next(persons);
    console.log("in the persons service 2: "+ this.persons_list);
  }
}
