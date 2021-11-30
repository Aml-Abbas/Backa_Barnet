export class Estimate {
    questionID: string;
    personID: string;
    userID: string;
    grade: string;
    comment: string;

    gradedOn: string;
    changedOn: string;

    status: string;

    constructor(questionID: string, personID: string, userID: string, 
        grade: string, comment: string, changedOn: string,
        gradedOn: string, status: string) {

      this.questionID = questionID;
      this.personID = personID;
      this.userID = userID;
      this.grade = grade;
      this.comment= comment;

      this.gradedOn= gradedOn;
      this.changedOn= changedOn;

      this.status= status;

      this.personID= personID;
    }
  }