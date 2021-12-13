import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { User } from 'src/app/models/User';
import axios from 'axios';


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

  async getUsers(): Promise<User[]> {
    var users: User[]= [];

    await axios.get('https://func-ykbb.azurewebsites.net/api/users?code=vAbAl/ZrtgJ4A57sj7VMWVpLFNQxpcEha9h8ne/uVTCF8bGaNMvJTw==')
    .then(function (response) {
      var units: string[]= [];
  
        response.data.forEach(user=>{
          let userID: string = user?.userID ?? '';
          let lastName: string = user?.lastName ?? '';
          let firstName: string = user?.firstName ?? '';
          let email: string = user?.email ?? '';
          let roleID: string = user?.roleID ?? '';
          let description: string = user?.description ?? '';
          let organisation: string = user?.organisaton ?? '';
          let name: string = user?.name ?? '';
          let unitID: string = user?.unitID ?? '';
          let unitName: string = user?.unitName ?? '';

          if(!containsUser(users, userID)){
            units.push(unitName);
            users.push(new User(userID, lastName, firstName, email, roleID, description,
              organisation, name, unitID, units));
            units= [];
            }else{
              users.forEach(element => {
                if(element.userID== userID){
                  element.unitName.push(unitName);
                }      
              });
          }
        })
  })
    .catch(function (error) {
      console.log(error);
    })
    .then(function () {
    });
      return users;
  
  }

}
function containsUser(users: User[], userID: string): boolean {
  var found= false;
  users.forEach(element=>{
    if(element.unitID== userID){
      found= true;
    }
  });
  return found;
}

