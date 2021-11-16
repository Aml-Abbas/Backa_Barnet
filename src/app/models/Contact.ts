export class Contact {
    contactPersonNbr: string;
    lastName: string;
    firstName: string;
    name: string;

    phoneNbr: string;
    employer: string;

  
    constructor(contactPersonNbr: string, lastName: string, 
        firstName: string, name: string, phoneNbr: string, employer: string) {
            
      this.contactPersonNbr = contactPersonNbr;
      this.firstName = firstName;
      this.lastName = lastName;
      this.name = name;

      this.phoneNbr= phoneNbr;
      this.employer= employer;

    }
  }