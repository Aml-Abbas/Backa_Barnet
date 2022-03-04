
export class UserRight {
  currentUserID: string;
  userID: string;
  userLastName: string;
  userFirstName: string;
  questionTypeID: string;
  personID: string;
  lastName: string;
  firstName: string;

  constructor(currentUserID: string, userID: string, userLastName: string,
    userFirstName: string, questionTypeID: string, personID: string,
    lastName: string, firstName: string) {

    this.currentUserID = currentUserID;
    this.userID = userID;
    this.userLastName = userLastName;

    this.userFirstName = userFirstName;
    this.questionTypeID = questionTypeID;

    this.personID = personID;
    this.lastName = lastName;
    this.firstName = firstName;

  }
}