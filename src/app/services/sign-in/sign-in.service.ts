import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import {ActivatedRoute, Router} from '@angular/router';


@Injectable({
  providedIn: 'root'
})
export class SignInService {
  signedIn = false;
  router: Router;

  constructor(router: Router, 
    private aRoute: ActivatedRoute,
    private http:HttpClient) {

    this.router = router;

     }

  signIn(email: string, password: string): Observable<any>{

    this.signedIn = true;
    localStorage.setItem('signedIn', 'true');
     return this.http.get('https://func-ykbb.azurewebsites.net/api/person/'+email+'/'+password+'?code=SkXpI51pgjWl6UVNjxKjKNUr3o2gmPdlOZ4EFMFwn0LR0KlyDlYu3w==');
  }

  signOut() {
    localStorage.clear();
    this.signedIn = false;
    localStorage.removeItem("currentPerson");
    localStorage.removeItem("signedIn");

    this.router.navigate(
      ['../sign-in'],
      {replaceUrl: true, relativeTo: this.aRoute});
  }

  isSignedIn() {
    return this.signedIn;
  }

}
