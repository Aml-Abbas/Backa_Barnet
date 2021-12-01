export class CompassDataConversation {
    gradedOn: string;

    userName: string;

    grades: number[];

    constructor(gradedOn: string, userName: string, grades: number[]) {

      this.gradedOn = gradedOn;
      this.userName = userName;
      
      this.grades= grades;
    }
  }