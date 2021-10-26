export class Card {
    id: string;
    gradedOn: string;
    userName: string;
    userOrg: string;
    userTitle: string;

    personName: string;
    personNbr: string;
    contactName: string;
    contactPersonNbr: string;
    //contactName2: string;
    //contactPersonNbr2: string;

    healthTeam: string;
    situation: string;

    questions: string [];
    grades: string[];
    comments: string[];

  
    constructor(id: string, gradedOn: string, userName: string, 
        userOrg: string, userTitle: string,
        personName: string, personNbr: string,
        contactName: string, contactPersonNbr: string,
        healthTeam: string, situation: string,
        questions: string[], grades: string[], comments: string[]) {

      this.id = id;

      this.gradedOn = gradedOn;
      this.userName = userName;
      this.userOrg = userOrg;
      this.userTitle= userTitle;

      this.personName= personName;
      this.personNbr= personNbr;
      this.contactName= contactName;
      this.contactPersonNbr= contactPersonNbr;

      this.healthTeam= healthTeam;
      this.situation= situation;

      this.questions= questions;
      this.grades= grades;
      this.comments= comments;

    }
  }