import { Unit } from 'src/app/models/Unit';

export class Barnteam {
    userID: string;
    lastName: string;
    firstName: string;
    email: string;
    roleID: string;
    description: string;
    organisaton: string;
    name: string;
    units: Unit[];

    constructor(userID: string, firstName: string, lastName: string,
        email: string, roleID: string, description: string,
        organisaton: string, name: string, units: Unit[]) {
            
      this.userID = userID;
      this.firstName = firstName;
      this.lastName = lastName;

      this.roleID= roleID;
      this.description= description;

      this.email= email;
      this.organisaton= organisaton;
      this.name= name;
      this.units= units;
    }
  }