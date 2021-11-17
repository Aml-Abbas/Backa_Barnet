export class Card {
    id: string;
    gradedOn: string;
    userName: string;
    userOrg: string;
    userTitle: string;

    personName: string;
    personNbr: string;

    guardian1: string;
    guardianPersonNbr1: string;
    guardian2: string;
    guardianPersonNbr2: string;

    healthTeam: string;
    situation: string;

    questions: string [];
    grades: string[];
    comments: string[];
    status: string;
    personID: string;

    constructor(id: string, gradedOn: string, userName: string, 
        userOrg: string, userTitle: string,
        personName: string, personNbr: string,
        guardian1: string, guardianPersonNbr1: string,
        guardian2: string, guardianPersonNbr2: string,
        healthTeam: string, situation: string,
        questions: string[], grades: string[], 
        comments: string[], status: string, personID: string) {

      this.id = id;

      this.gradedOn = gradedOn;
      this.userName = userName;
      this.userOrg = userOrg;
      this.userTitle= userTitle;

      this.personName= personName;
      this.personNbr= personNbr;

      this.guardian1 = guardian1;
      this.guardianPersonNbr1 = guardianPersonNbr1;
      this.guardian2 = guardian2;
      this.guardianPersonNbr2 = guardianPersonNbr2;

      this.healthTeam= healthTeam;
      this.situation= situation;

      this.questions= questions;
      this.grades= grades;
      this.comments= comments;
      this.status= status;

      this.personID= personID;
    }
  }