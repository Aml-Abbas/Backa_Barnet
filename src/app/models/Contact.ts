export class Contact {
    contactPersonNbr: string;
    lastName: string;
    firstName: string;
    phoneNbr: string;
    employer: string;

  
    constructor(contactPersonNbr: string, lastName: string, 
        firstName: string, phoneNbr: string, employer: string) {
            
      this.contactPersonNbr = contactPersonNbr;
      this.firstName = firstName;
      this.lastName = lastName;
      this.phoneNbr= phoneNbr;
      this.employer= employer;

    }
  }