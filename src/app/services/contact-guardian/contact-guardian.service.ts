import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Contact } from 'src/app/models/Contact';
import { DiscoverCard } from 'src/app/models/DiscoverCard';
import { Unit } from 'src/app/models/Unit';

@Injectable({
  providedIn: 'root'
})
export class ContactGuardianService {

  constructor(private http: HttpClient) { }

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