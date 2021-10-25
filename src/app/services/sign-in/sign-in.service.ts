import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Person } from 'src/app/models/Person';
import { LoginInfo } from '../../models/LoginInfo.model';
import { User } from 'src/app/models/User';


@Injectable({
  providedIn: 'root'
})
export class SignInService {


  constructor(private http: HttpClient) { }

  signIn(info: LoginInfo): Observable<Person[]> {
    return this.http.get<Person[]>('https://func-ykbb.azurewebsites.net/api/login/' + info.email + '/' + info.password + '?code=UjWHWQAU5ymIdDfDGA3r9TPmbqjMsaiOSr812fke5kMDmD/uiouwxQ==');
  }

  getCurrentUser(email: string):Observable<User>{
    
    return this.http.get<User>('https://func-ykbb.azurewebsites.net/api/user/' + email + '?code=nyrEAwV1dDkmib3rqP96Svgk9RLX2Qq/laSc2lortlfiv8Ra13LfiQ==');

  }
}