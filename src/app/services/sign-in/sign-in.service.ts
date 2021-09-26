import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Person } from 'src/app/models/Person';
import { LoginInfo } from '../../models/LoginInfo.model';


@Injectable({
  providedIn: 'root'
})
export class SignInService {
  persons_list: Person[] = [];


  constructor(private http: HttpClient) { }

  signIn(info: LoginInfo): Observable<Person[]> {

    return this.http.get<Person[]>('https://func-ykbb.azurewebsites.net/api/person/' + info.email + '/' + info.password + '?code=SkXpI51pgjWl6UVNjxKjKNUr3o2gmPdlOZ4EFMFwn0LR0KlyDlYu3w==');
  }
}
