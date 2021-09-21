import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';



@Injectable({
  providedIn: 'root'
})
export class SignInServiceService {

  constructor(private http:HttpClient) { }

  signIn(email: string, password: string): Observable<any>{

    return this.http.get('https://func-ykbb.azurewebsites.net/api/person/'+email+'/'+password+'?code=SkXpI51pgjWl6UVNjxKjKNUr3o2gmPdlOZ4EFMFwn0LR0KlyDlYu3w==');
  }
}
