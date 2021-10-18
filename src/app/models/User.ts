export class User {
    personID: string;
    personNr: string;
    lastName: string;
    firstName: string;
    personRoleID: string;
    personTypeID: string;
    email: string;
    organisation: string;
    title: string;

  
    constructor(personID: string, personNr: string, 
        firstName: string, lastName: string,
        personRoleID: string, personTypeID: string,
        email: string, organisation: string, 
        title: string) {
            
      this.personNr = personNr;
      this.firstName = firstName;
      this.lastName = lastName;
      this.personID= personID;

      this.personRoleID= personRoleID;
      this.personTypeID= personTypeID;

      this.email= email;
      this.organisation= organisation;
      this.title= title;
    }
  }