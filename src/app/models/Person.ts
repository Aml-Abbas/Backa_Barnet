export class Person {
    personNbr: string;
    lastName: string;
    firstName: string;
    changedBy: string;
    changedOn: string;
    status: string;

  
    constructor(personNbr: string, lastName: string, 
        firstName: string, changedBy: string,
        changedOn: string, status: string) {
            
      this.personNbr = personNbr;
      this.firstName = firstName;
      this.lastName = lastName;
      this.status= status;
      this.changedBy= changedBy;
      this.changedOn= changedOn;

    }
  }