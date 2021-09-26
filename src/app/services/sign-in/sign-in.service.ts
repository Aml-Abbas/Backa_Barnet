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

    return this.http.get<Person[]>('https://func-ykbb.azurewebsites.net/api/person/' + info.email + '/' + info.password + '?code=SkXpI51pgjWl6UVNjxKjKNUr3o2gmPdlOZ4EFMFwn0LR0KlyDlYu3w==')/* .subscribe(
      (data)=>{

        let int_ref: Person[] = [];

        if (data instanceof Array) {
          data.map(function(v, i) {
          
          let int_person: Person = new Person(
                                      v.personID,
                                      v.personNr,
                                      v.firstName,
                                      v.lastName,
                                      v.address,
                                      v.city,
                                      v.personRoleID,
                                      v.personTypeID,
                                      v.createBy,
                                      v.createDate,
                                      v.changeBy,
                                      v.changeDate
                                      );    


          int_ref.push(int_person);
        })
      }
      console.log(int_ref);
      console.log('int_ref');

      this.persons_list = int_ref;
      console.log(this.persons_list);
      console.log('persons_list');

      return this.persons_list;

    });

      console.log(this.persons_list);
      console.log('persons_list');

      return this.persons_list; */
  }


}
