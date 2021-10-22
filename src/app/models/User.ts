export class User {
    userID: string;
    lastName: string;
    firstName: string;
    email: string;
    roleID: string;
    description: string;

  
    constructor(userID: string, firstName: string, lastName: string,
        email: string, roleID: string, description: string) {
            
      this.userID = userID;
      this.firstName = firstName;
      this.lastName = lastName;

      this.roleID= roleID;
      this.description= description;

      this.email= email;
    }
  }