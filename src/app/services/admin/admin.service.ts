import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, of } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class AdminService {

  constructor(private http: HttpClient) { }

  createUser(userJson: any) {
    return this.http.post('https://func-ykbb.azurewebsites.net/api/user/create?code=h6mNFr9PwcAYrkfqVh4XZCGhdCx6qGjxDHdoatd4XQmmRraZJFqqFQ==', userJson);
  }
  editUser(userJson: any) {
    return this.http.post('https://func-ykbb.azurewebsites.net/api/user/edit?code=Ycskc1dCm6umJWdESOOWzy6GcBVFXm1n7U1DHZwwijPUGaqjDPX87g==', userJson);
  }
  removeUser(userJson: any) {
    return this.http.post('https://func-ykbb.azurewebsites.net/api/user/remove?code=ruc6sEqCzEqavF3llZyD6GQ8Z4D4YsBXlVx9MkccTTznPSmjiqwS9A==', userJson);
  }

}
