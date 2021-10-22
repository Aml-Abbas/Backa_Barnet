import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Person } from 'src/app/models/Person';
import { LoginInfo } from '../../models/LoginInfo.model';


@Injectable({
  providedIn: 'root'
})
export class SignInService {


  constructor(private http: HttpClient) { }

  signIn(info: LoginInfo): Observable<Person[]> {

    return this.http.get<Person[]>('https://func-ykbb.azurewebsites.net/api/login/' + info.email + '/' + info.password + '?code=UjWHWQAU5ymIdDfDGA3r9TPmbqjMsaiOSr812fke5kMDmD/uiouwxQ==');
  }
}