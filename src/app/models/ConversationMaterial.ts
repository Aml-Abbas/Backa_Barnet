export class ConversationMaterial {
  questionID: string;
  personID: string

  grade: string;
  comment: string;
  gradeType: string;

  gradedOn: string;
  status: string;
  userName: string;
  userRole: string;

  constructor(questionID: string, personID: string,
    grade: string, comment: string,
    gradeType: string,
    gradedOn: string, status: string,
    userName: string, userRole: string) {

    this.questionID = questionID;
    this.personID = personID;

    this.grade = grade;
    this.comment = comment;
    this.gradeType = gradeType;

    this.gradedOn = gradedOn;
    this.status = status;
    this.userName = userName;
    this.userRole = userRole;

  }
}