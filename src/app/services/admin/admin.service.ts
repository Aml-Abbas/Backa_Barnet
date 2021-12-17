import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { User } from 'src/app/models/User';
import axios from 'axios';
import { Unit } from 'src/app/models/Unit';
import { Barnteam } from 'src/app/models/Barnteam';


@Injectable({
  providedIn: 'root'
})
export class AdminService {

  constructor(private http: HttpClient) { }

  createUser(LastName: string, FirstName: string, Email: string, Organisation: string, RoleID: number,  unitIDs: string[]) {
    unitIDs.forEach(unitID=>{
      axios.post('https://func-ykbb.azurewebsites.net/api/user/create?code=h6mNFr9PwcAYrkfqVh4XZCGhdCx6qGjxDHdoatd4XQmmRraZJFqqFQ==', {
        LastName: LastName,
        FirstName: FirstName,
        Email: Email,
        Organisation: Organisation,
        RoleID: RoleID,
        UnitID: unitID,
      })
      .then(function (response) {
        console.log(response);
        console.log('sending: '+ unitID);

      })
      .catch(function (error) {
        console.log(error);
      });
  
    });
    return of(true);
    
    //return this.http.post('https://func-ykbb.azurewebsites.net/api/user/create?code=h6mNFr9PwcAYrkfqVh4XZCGhdCx6qGjxDHdoatd4XQmmRraZJFqqFQ==', userJson);
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
      var units: Unit[]= [];
  
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
            units.push(new Unit(unitID, unitName));
            users.push(new User(userID, lastName, firstName, email, roleID, description,
              organisation, name, units));
            units= [];
            }else{
              users.forEach(element => {
                if(element.userID== userID){
                  element.units.push(new Unit(unitID, unitName));
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


  createBarnteam(teamName: string, unitIDs: string[]) {
    unitIDs.forEach(unitID=>{
      axios.post('https://func-ykbb.azurewebsites.net/api/team/create?code=xjvaiKiao349qgf3p/EQoqSgbt6cjXQxBil587qbBWpaV3HpMzZx7Q==', {
        TeamName: teamName,
        UnitID: parseInt(unitID)
      })
      .then(function (response) {
        console.log(response);
        console.log('sending: '+teamName+' '+ unitID);

      })
      .catch(function (error) {
        console.log(error);
      });
  
    });
    return of(true);
   // return this.http.post('https://func-ykbb.azurewebsites.net/api/team/create?code=xjvaiKiao349qgf3p/EQoqSgbt6cjXQxBil587qbBWpaV3HpMzZx7Q==', BarnteamJson);
  }

  removeBarnteam(BarnteamJson: any) {
    return this.http.post('https://func-ykbb.azurewebsites.net/api/team/remove?code=vYW5WKhcMuT8Pjq4amDBuyJNpuaiHaTEgN8YdamLeH0jjo93AnAYxw==', BarnteamJson);
  }

  async getBarnteams(): Promise<Barnteam[]> {
    var barnteams: Barnteam[]= [];

    await axios.get('https://func-ykbb.azurewebsites.net/api/teams?code=MT2SNUMJlN6/5UAgMDLpCKIj7W/rbDRAzoG9n36PMiMn8/Mzv4j3Lg==')
    .then(function (response) {
      var units: Unit[]= [];
  
        response.data.forEach(barnteam=>{
          let teamID: string = barnteam?.teamID ?? '';
          let teamName: string = barnteam?.teamName ?? '';
          let createdOn: string = barnteam?.createdOn ?? '';

          let unitID: string = barnteam?.unitID ?? '';
          let unitName: string = barnteam?.unitName ?? '';

          if(!containsBarnteam(barnteams, teamID)){
            units.push(new Unit(unitID, unitName));
            barnteams.push(new Barnteam(teamID, teamName, createdOn, units));
            units= [];
            }else{
              barnteams.forEach(element => {
                if(element.teamID== teamID){
                  element.units.push(new Unit(unitID, unitName));
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
      return barnteams;
  }

  getUnits(): Observable<Unit[]> {
    return this.http.get<Unit[]>('https://func-ykbb.azurewebsites.net/api/units?code=dxXy9WjiX7GNKIIrYZEv0GL7h0tXLX3KKsqZhey1z8Ec1Uf6rz22ZQ==');
  }

  getUnitUsers(teamid: string): Observable<any[]> {
    return this.http.get<any[]>('https://func-ykbb.azurewebsites.net/api/users/'+teamid+'?code=rwLlFo20K5fSeJ0Bab4oZXY6nga7V8eIVZbldaEO9jVIxHjLb4urVg==');
  }

}
function containsUser(users: User[], userID: string): boolean {
  var found= false;
  users.forEach(element=>{
    if(element.userID== userID){
      found= true;
    }
  });
  return found;
}

function containsBarnteam(barnteams: Barnteam[], teamID: string): boolean {
  var found= false;
  barnteams.forEach(element=>{
    if(element.teamID== teamID){
      found= true;
    }
  });
  return found;
}