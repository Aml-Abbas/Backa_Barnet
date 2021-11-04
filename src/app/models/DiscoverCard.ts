export class DiscoverCard {
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

    unit: string;
    situation: string;

    questionID: string;
    grade: string;
    comment: string;

  
    constructor(gradedOn: string, userName: string, 
        userOrg: string, userTitle: string,
        personName: string, personNbr: string,
        guardian1: string, guardianPersonNbr1: string,
        guardian2: string, guardianPersonNbr2: string,
        unit: string, situation: string,
        questionID: string, grade: string, comment: string) {
            
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

      this.unit= unit;
      this.situation= situation;

      this.questionID= questionID;
      this.grade= grade;
      this.comment= comment;

    }
  }