import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';



@Injectable({
  providedIn: 'root'
})
export class SignInServiceService {

  constructor(private http:HttpClient) { }

  signIn(){
    return this.http.get('https://func-ykbb.azurewebsites.net/api/person/adnan.karahmetovic@cgi.com/*r3hHXj&YC5M@R@J?code=SkXpI51pgjWl6UVNjxKjKNUr3o2gmPdlOZ4EFMFwn0LR0KlyDlYu3w==');
  }
}
