import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { BehaviorSubject } from 'rxjs';
import { Person } from 'src/app/models/person';
import { map, catchError } from 'rxjs/operators';



@Injectable({
  providedIn: 'root'
})
export class SignInService {
/*   persons: Person[]= [];
  private persons_list= new BehaviorSubject<Person[]>(this.persons);
  current_persons_list= this.persons_list.asObservable();
 */

  constructor(private http:HttpClient) { }

  signIn(email: string, password: string): Observable<any>{

     return this.http.get('https://func-ykbb.azurewebsites.net/api/person/'+email+'/'+password+'?code=SkXpI51pgjWl6UVNjxKjKNUr3o2gmPdlOZ4EFMFwn0LR0KlyDlYu3w==');

/*     this.http.get('https://func-ykbb.azurewebsites.net/api/person/'+email+'/'+password+'?code=SkXpI51pgjWl6UVNjxKjKNUr3o2gmPdlOZ4EFMFwn0LR0KlyDlYu3w==').
    pipe(
      map((data: any) => {

      },
      (error:any) => {
        return false;
      })
   )
    
    this.persons_list= new BehaviorSubject<Person[]>(this.persons);
    this.current_persons_list= this.persons_list.asObservable();

    return true; */
  }
}
