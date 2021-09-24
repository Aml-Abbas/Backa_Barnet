import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, BehaviorSubject } from 'rxjs';
import {ActivatedRoute, Router} from '@angular/router';
import { Person } from 'src/app/models/Person';
import { LoginInfo } from '../../models/LoginInfo.model';


@Injectable({
  providedIn: 'root'
})
export class SignInService {
  signedIn = false;
  router: Router;
  persons_list: Person[]= [];


  constructor(router: Router, 
    private aRoute: ActivatedRoute,
    private http:HttpClient) {

    this.router = router;

     }

  signIn(info: LoginInfo): Observable<Person []>{

    this.http.get('https://func-ykbb.azurewebsites.net/api/person/'+info.email+'/'+info.password+'?code=SkXpI51pgjWl6UVNjxKjKNUr3o2gmPdlOZ4EFMFwn0LR0KlyDlYu3w==').subscribe(
      (data)=>{

        let int_ref = this.persons_list;

        if (data instanceof Array) {
          data.map(function(v, i) {
          
          let int_person = new Person(
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
                                      )    

          int_ref.push(int_person);
        })
      }
      });
      return new BehaviorSubject(this.persons_list).asObservable();
    }

  signOut() {

    this.router.navigate(
      ['../sign-in'],
      {replaceUrl: true, relativeTo: this.aRoute});
  }


}
