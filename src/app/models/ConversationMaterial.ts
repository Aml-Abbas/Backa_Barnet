export class ConversationMaterial {
    questionID: string;
    personID: string

    grade: string;
    comment: string;
    // grade1: string ;
    // comment1: string;
    // grade2: string;
    // comment2: string;
    gradeType: string;

    gradedOn: string;
    status: string;

    constructor(questionID: string, personID: string, 
      grade: string, comment: string,
      /* grade1: string, comment1: string, 
      grade2: string, comment2: string, */
      gradeType: string,
      gradedOn: string, status: string) {

      this.questionID = questionID;
      this.personID = personID;

      this.grade = grade;
      this.comment = comment;
/*       this.grade1 = grade1;
      this.comment1 = comment1;
      this.grade2 = grade2;
      this.comment2 = comment2;
 */
      this.gradeType = gradeType;

      this.gradedOn = gradedOn;
      this.status = status;

    }
  }