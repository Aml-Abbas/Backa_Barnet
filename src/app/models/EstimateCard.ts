
export class EstimateCard {

    personID: string;
    userID: string;

    grades: any[];

    gradedOn: string;
    changedOn: string;
    status: string;

    userName: string;

    constructor(personID: string, userID: string, 
        grades: any[],
        gradedOn: string, changedOn: string, status: string,
        userName: string) {

      this.personID = personID;
      this.userID = userID;

      this.grades= grades;
      
      this.gradedOn= gradedOn;
      this.changedOn= changedOn;

      this.status= status;

      this.userName= userName;

    }
  }