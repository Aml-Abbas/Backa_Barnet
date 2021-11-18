export class ConversationMaterial {
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


    person_scores: string [];
    person_comments: string[];
    guardian1_scores: string [];
    guardian1_comments: string[];
    guardian2_scores: string [];
    guardian2_comments: string[];

    constructor(id: string, gradedOn: string, userName: string, 
        userOrg: string, userTitle: string,
        personName: string, personNbr: string,
        guardian1: string, guardianPersonNbr1: string,
        guardian2: string, guardianPersonNbr2: string,

        person_scores: string[], person_comments: string[],
        guardian1_scores: string[], guardian1_comments: string[], 
        guardian2_scores: string[], guardian2_comments: string[]) {

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

      this.person_scores = person_scores;
      this.person_comments = person_comments;
      this.guardian1_scores = guardian1_scores;
      this.guardian1_comments = guardian1_comments;
      this.guardian2_scores = guardian2_scores;
      this.guardian2_comments = guardian2_comments;

    }
  }