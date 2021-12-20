export class Estimate {
    questionID: string;
    personID: string;
    userID: string;
    grade: string;
    comment: string;

    gradedOn: string;
    changedOn: string;

    status: string;
    description:string; 
    questionLevelID: string;
    userName: string;
    userRole: string;

    constructor(questionID: string, personID: string, userID: string, 
        grade: string, comment: string,
        gradedOn: string, changedOn: string, status: string,
        description: string, questionLevelID: string, userName: string,
        userRole: string) {

      this.questionID = questionID;
      this.personID = personID;
      this.userID = userID;

      this.grade = grade;
      this.comment= comment;

      this.gradedOn= gradedOn;
      this.changedOn= changedOn;
      this.status= status;

      this.description= description;
      this.questionLevelID= questionLevelID;
      this.userName= userName;
      this.userRole= userRole;

    }
  }