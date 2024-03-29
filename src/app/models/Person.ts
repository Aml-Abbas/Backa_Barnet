export class Person {
  personNbr: string;
  lastName: string;
  firstName: string;
  name: string;

  guardian1: string;
  guardianPersonNbr1: string;
  guardian2: string;
  guardianPersonNbr2: string;

  changedBy: string;
  changedOn: string;
  status: string;
  personID: string;

  constructor(personNbr: string, lastName: string, firstName: string, name: string, guardian1: string, guardianPersonNbr1: string,
    guardian2: string, guardianPersonNbr2: string,
    changedBy: string, changedOn: string, status: string, personID: string) {

    this.personNbr = personNbr;
    this.firstName = firstName;
    this.lastName = lastName;

    this.name = name;

    this.guardian1 = guardian1;
    this.guardianPersonNbr1 = guardianPersonNbr1;
    this.guardian2 = guardian2;
    this.guardianPersonNbr2 = guardianPersonNbr2;

    this.status = status;
    this.changedBy = changedBy;
    this.changedOn = changedOn;
    this.personID = personID;

  }
}