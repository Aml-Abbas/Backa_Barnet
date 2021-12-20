
export class EstimateCard {

    personID: string;
    userID: string;

    grades: any[];
    average: number[];

    gradedOn: string;
    changedOn: string;
    status: string;

    userName: string;
    userRole: string;

    constructor(personID: string, userID: string, 
        grades: any[], average: number[],
        gradedOn: string, changedOn: string, status: string,
        userName: string, userRole: string) {

      this.personID = personID;
      this.userID = userID;

      this.grades= grades;
      this.average= average;

      this.gradedOn= gradedOn;
      this.changedOn= changedOn;

      this.status= status;

      this.userName= userName;
      this.userRole= userRole;

    }
  }