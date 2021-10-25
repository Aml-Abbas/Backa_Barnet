export class DiscoverCard {
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

    questionID: string;
    grade: string;
    comment: string;

  
    constructor(gradedOn: string, userName: string, 
        userOrg: string, userTitle: string,
        personName: string, personNbr: string,
        contactName: string, contactPersonNbr: string,
        healthTeam: string, situation: string,
        questionID: string, grade: string, comment: string) {
            
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

      this.questionID= questionID;
      this.grade= grade;
      this.comment= comment;

    }
  }