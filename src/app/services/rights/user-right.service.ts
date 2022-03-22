import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import axios from 'axios';
import { Observable, of } from 'rxjs';
import { UserRight } from 'src/app/models/UserRight';

@Injectable({
  providedIn: 'root'
})
export class UserRightService {

  constructor(private http: HttpClient) { }
  

      // create the user right
    CreateUserRight(CurrentUserID: number, UserID: number, PersonID: number, Type: number) {
      axios.post('https://func-ykbb.azurewebsites.net/api/user/create/right?code=3xLs3RGgHORQl9wZmN1mxF7YyHelcYQYkYa2W3nr2HDzHP7DHXfJHA==',{
        CurrentUserID: CurrentUserID,
        UserID: UserID,
        PersonID: PersonID,
        Type: Type,
      })
        .then(function (response) {
          console.log(response);
        })
        .catch(function (error) {
          console.log(error);
        });
      return of(true);
    }

    // get the user rights that user has created
    getUserRight(CurrentUserID: string): Observable<UserRight[]> {    
        return this.http.get<UserRight[]>('https://func-ykbb.azurewebsites.net/api/user/right/'+ CurrentUserID +'?code=iqHOiyjoGLMAm8QRaUUkrwag0/BlTnPOiFPJ1iaVa79n9byw/G90Pg==');
    }

    removeUserRight(UserRightJson: any) {
      return this.http.post('https://func-ykbb.azurewebsites.net/api/user/remove/right?code=2WzL026RTeE5hmvTXompkTV5gspaCXeTiUYoaczNNTKTIM0hdtW62A==', UserRightJson);
    }
  
    getRight(UserID: number, PersonID: number): Observable<UserRight[]> {    
      return this.http.get<UserRight[]>('https://func-ykbb.azurewebsites.net/api/user/right/'+UserID+'/'+PersonID+'?code=RXLMfunurDRoOxGZ6Fke8qfZg00dJ7b1jpDG8xad16KlhTfO2aWqcg==');
  }

}
