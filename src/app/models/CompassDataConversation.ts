export class CompassDataConversation {
    gradedOn: string;

    userName: string;

    grades: number[];
    guardian1_grades: number [];
    guardian2_grades: number [];

    constructor(gradedOn: string, userName: string, 
      grades: number[], guardian1_grades: number[], guardian2_grades: number[]) {

      this.gradedOn = gradedOn;
      this.userName = userName;
      
      this.grades= grades;
      this.guardian1_grades= guardian1_grades;
      this.guardian2_grades= guardian2_grades;

    }
  }