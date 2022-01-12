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

/* This service class is used to send all the http request which the admin can do */
export class AdminService {

  constructor(private http: HttpClient) { }

  // create the user but send the request for every unit that is assigned to the user.
  createUser(LastName: string, FirstName: string, Email: string, Organisation: string, RoleID: number, unitIDs: string[]) {
    unitIDs.forEach(unitID => {
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
        })
        .catch(function (error) {
          console.log(error);
        });

    });
    return of(true);
  }

  // delete all the units whih is associated to the user, to update the units in a later request
  removeUserUnits(LastName: string, FirstName: string, Organisation: string, RoleID: number, unitIDs: string[], UserID: string) {
    axios.post('https://func-ykbb.azurewebsites.net/api/user/edit/' + UserID + '?code=dLALQcGaa8CBvNC045V5Ss87N1AKWTt2inKKYyS5rEOSjJbTUYAugw==')
      .then(function (response) {
        console.log(response);
      })
      .catch(function (error) {
        console.log(error);
      });
    return of(true);
  }

  // change the user and send one request for every unit that is assigned to the user.
  // call the deleteUserUnits before updateng the user to delete alla the old assigned units.
  editUser(LastName: string, FirstName: string, Organisation: string, RoleID: number, unitIDs: string[], UserID: string) {
    axios.all([
      unitIDs.forEach(unitID => {
        axios.post('https://func-ykbb.azurewebsites.net/api/user/edit?code=Ycskc1dCm6umJWdESOOWzy6GcBVFXm1n7U1DHZwwijPUGaqjDPX87g==', {
          LastName: LastName,
          FirstName: FirstName,
          Organisation: Organisation,
          RoleID: RoleID,
          UnitID: unitID,
          UserID: UserID
        })
      })
    ])
      .then(axios.spread((obj1, obj2) => {
        return of(true);

      }));
    return of(false);
  }

  // delete user
  removeUser(userJson: any) {
    return this.http.post('https://func-ykbb.azurewebsites.net/api/user/remove?code=ruc6sEqCzEqavF3llZyD6GQ8Z4D4YsBXlVx9MkccTTznPSmjiqwS9A==', userJson);
  }

  // get a list of users
  async getUsers(): Promise<User[]> {
    var users: User[] = [];

    await axios.get('https://func-ykbb.azurewebsites.net/api/users?code=vAbAl/ZrtgJ4A57sj7VMWVpLFNQxpcEha9h8ne/uVTCF8bGaNMvJTw==')
      .then(function (response) {
        var units: Unit[] = [];

        response.data.forEach(user => {
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

          // check if the user is already in the list 
          if (!containsUser(users, userID)) {

            // push the user to list if it is not in the list
            units.push(new Unit(unitID, unitName));
            users.push(new User(userID, firstName, lastName, email, roleID, description,
              organisation, name, units));
            units = [];

          } else {
            // update the user's unit list if the user is already in the list
            users.forEach(element => {
              if (element.userID == userID) {
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

  // create a team but send the request for every unit that is assigned to the team.
  createBarnteam(teamName: string, unitIDs: string[]) {
    unitIDs.forEach(unitID => {
      axios.post('https://func-ykbb.azurewebsites.net/api/team/create?code=xjvaiKiao349qgf3p/EQoqSgbt6cjXQxBil587qbBWpaV3HpMzZx7Q==', {
        TeamName: teamName,
        UnitID: parseInt(unitID)
      })
        .then(function (response) {
          console.log(response);
        })
        .catch(function (error) {
          console.log(error);
        });

    });
    return of(true);
  }

  // delete the team
  removeBarnteam(BarnteamJson: any) {
    return this.http.post('https://func-ykbb.azurewebsites.net/api/team/remove?code=vYW5WKhcMuT8Pjq4amDBuyJNpuaiHaTEgN8YdamLeH0jjo93AnAYxw==', BarnteamJson);
  }

  // get a list of teams
  async getBarnteams(): Promise<Barnteam[]> {
    var barnteams: Barnteam[] = [];

    await axios.get('https://func-ykbb.azurewebsites.net/api/teams?code=MT2SNUMJlN6/5UAgMDLpCKIj7W/rbDRAzoG9n36PMiMn8/Mzv4j3Lg==')
      .then(function (response) {
        var units: Unit[] = [];

        response.data.forEach(barnteam => {
          let teamID: string = barnteam?.teamID ?? '';
          let teamName: string = barnteam?.teamName ?? '';
          let createdOn: string = barnteam?.createdOn ?? '';

          let unitID: string = barnteam?.unitID ?? '';
          let unitName: string = barnteam?.unitName ?? '';

          // check if the team is alredy in the list 

          if (!containsBarnteam(barnteams, teamID)) {
            // push the team to list if it is not in the list
            units.push(new Unit(unitID, unitName));
            barnteams.push(new Barnteam(teamID, teamName, createdOn, units));
            units = [];
          } else {
            // update the team's unit list if the team is already in the list
            barnteams.forEach(element => {
              if (element.teamID == teamID) {
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

  // get the available units to be choosen when creating a new team
  getUnits(): Observable<Unit[]> {
    return this.http.get<Unit[]>('https://func-ykbb.azurewebsites.net/api/units?code=dxXy9WjiX7GNKIIrYZEv0GL7h0tXLX3KKsqZhey1z8Ec1Uf6rz22ZQ==');
  }

    // get the available units to be choosen when creating a new barnkontakt
    getUnitsBarnKontakt(): Observable<Unit[]> {
      return this.http.get<Unit[]>('https://func-ykbb.azurewebsites.net/api/unitsBarnkontakt?code=cr8kiY53XIznOe27e4aBLju0lhbyaIT29qxWJ4naaoiSupEYnDO1ww==');
    }
  
  // get the users list for a specific team
  async getUnitUsers(teamid: string): Promise<User[]> {
    var users: User[] = [];

    await axios.get('https://func-ykbb.azurewebsites.net/api/users/' + teamid + '?code=rwLlFo20K5fSeJ0Bab4oZXY6nga7V8eIVZbldaEO9jVIxHjLb4urVg==')
      .then(function (response) {
        response.data.forEach(user => {
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

          if (!containsUser(users, userID)) {
            users.push(new User(userID, firstName, lastName, email, roleID, description,
              organisation, name, []));
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

// to check if the user is already in the list
function containsUser(users: User[], userID: string): boolean {
  var found = false;
  users.forEach(element => {
    if (element.userID == userID) {
      found = true;
    }
  });
  return found;
}

// to check if the team is already in the list
function containsBarnteam(barnteams: Barnteam[], teamID: string): boolean {
  var found = false;
  barnteams.forEach(element => {
    if (element.teamID == teamID) {
      found = true;
    }
  });
  return found;
}