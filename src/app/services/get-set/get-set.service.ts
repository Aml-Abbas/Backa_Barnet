import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { Contact } from 'src/app/models/Contact';
import { DiscoverCard } from 'src/app/models/DiscoverCard';
import { Unit } from 'src/app/models/Unit';
import { Person } from 'src/app/models/Person';


@Injectable({
  providedIn: 'root'
})
export class GetSetService {
  persons$: Observable<Person[]> = new Observable<Person[]>();
  returned_persons:Person[]=[];

  constructor(private http: HttpClient) { }

  getPersons(userId: string): Observable<Person[]> {
/* 
    this.persons$= this.http.get<Person[]>('https://func-ykbb.azurewebsites.net/api/person/'+userId+'?code=SkXpI51pgjWl6UVNjxKjKNUr3o2gmPdlOZ4EFMFwn0LR0KlyDlYu3w==');
    this.persons$.subscribe(data => {    
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

        let currennt_person= new Person(personNbr, lastName, firstName, name,
          guardian1, guardianPersonNbr1, guardian2, guardianPersonNbr2, 
          changedBy, changedOn, status);

        this.returned_persons.push(currennt_person);  
          console.log('adding data');
          console.log(this.returned_persons);
      }

    )
 });
 return of(this.returned_persons); */
 return this.http.get<Person[]>('https://func-ykbb.azurewebsites.net/api/person/'+userId+'?code=SkXpI51pgjWl6UVNjxKjKNUr3o2gmPdlOZ4EFMFwn0LR0KlyDlYu3w==');
  }
  getContacts(personNbr: string): Observable<Contact[]> {
    return this.http.get<Contact[]>('https://func-ykbb.azurewebsites.net/api/contact/' + personNbr + '?code=tc2OJy49azMOIqZUVev09yLarIt8kQfg7gr6GGs3uG3daqLORwHPhg==');
  }

  getCards(userId: string): Observable<DiscoverCard[]> {
    console.log(userId);
    return this.http.get<DiscoverCard[]>('https://func-ykbb.azurewebsites.net/api/card/'+userId+'?code=bbdIBAbikn/AMydOBvxm69FyKFhRfS4fxUb55SaSz0TfK/cjnxiYEw==');
  }

  getUnits(): Observable<Unit[]> {
    return this.http.get<Unit[]>('https://func-ykbb.azurewebsites.net/api/unit?code=7od5M5/US4aBc4L61rBOQKHBv3CXO7sWhxxQtZXi43tDknxT2zuIzQ==');
  }

  createCard(discoverCardJson: any) {
    return this.http.post('https://func-ykbb.azurewebsites.net/api/card/create?code=Cvux9kZKdDPlaG0IA5taD4gsFzO6ajU9TMlh5OzAparDg6fCOEw6Gg==', discoverCardJson);
  }

}