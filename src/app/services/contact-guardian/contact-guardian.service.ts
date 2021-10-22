import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Contact } from 'src/app/models/Contact';

@Injectable({
  providedIn: 'root'
})
export class ContactGuardianService {

  constructor(private http: HttpClient) { }

  getContacts(personNbr: string): Observable<Contact[]> {
    return this.http.get<Contact[]>('https://func-ykbb.azurewebsites.net/api/contact/' + '201001019999' + '?code=tc2OJy49azMOIqZUVev09yLarIt8kQfg7gr6GGs3uG3daqLORwHPhg==');
  }
}
