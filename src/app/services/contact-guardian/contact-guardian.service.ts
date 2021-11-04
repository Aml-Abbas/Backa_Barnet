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
    this.http.post('https://func-ykbb.azurewebsites.net/api/card/create?code=Cvux9kZKdDPlaG0IA5taD4gsFzO6ajU9TMlh5OzAparDg6fCOEw6Gg==', discoverCardJson)
    .toPromise().then(data=>{
      console.log(data);
    });;
  }

}
/* 
{
CommentActions: "0"
CommentAnsvartagande: "0"
CommentFritid: "0"
CommentMarBra: "0"
CommentOmsorg: "0"
CommentRespekteras: "0"
CommentTillhorighet: "0"
CommentTrygghet: "0"
CommentUtvecklas: "0"
GradeActions: 1
GradeAnsvartagande: 2
GradeFritid: 3
GradeMarBra: 3
GradeOmsorg: 3
GradeRespekteras: 2
GradeSamtycke1: 1
GradeSamtycke2: 1
GradeTillhorighet: 2
GradeTrygghet: 3
GradeUpprattats1: 1
GradeUpprattats2: 1
GradeUtvecklas: 1
GuardianName1: "Hasan Nadir"
GuardianName2: "Lubna Sara"
GuardianNbr1: "199308197777"
GuardianNbr2: "199308199999"
PersonFirstName: "Aml"
PersonLastName: "Lama"
PersonNbr: "199308198888"
Situation: "Skolan "
Status: 1
Unit: "Källan förskola"
UserID: 1
} */