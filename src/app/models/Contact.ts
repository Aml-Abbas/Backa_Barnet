export class Contact {
    userID: string;
    lastName: string;
    firstName: string;

    email: string;

    roleID: string;
    description: string;
    organisaton: string;

    name: string;

    constructor(userID: string, lastName: string, 
        firstName: string,  email: string, 
        roleID: string, description: string, organisaton: string, name: string,) {
            
      this.userID = userID;
      this.firstName = firstName;
      this.lastName = lastName;
      this.name = name;

      this.email= email;
      this.roleID= roleID;

      this.organisaton= organisaton;
      this.description= description;

    }
  }