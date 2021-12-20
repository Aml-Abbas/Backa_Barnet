export class ConversationCard {
    id: string;
    personID: string

    questionsID: string[];
    person_scores: string [];
    person_comments: string[];
    guardian1_scores: string [];
    guardian1_comments: string[];
    guardian2_scores: string [];
    guardian2_comments: string[];

    gradedOn: string;
    status: string;
    userName: string;
    userRole: string;

    constructor(id: string, personID: string, 
        questionsID: string[],
        person_scores: string[], person_comments: string[],
        guardian1_scores: string[], guardian1_comments: string[], 
        guardian2_scores: string[], guardian2_comments: string[],
        gradedOn: string, status: string,
        userName: string, userRole: string) {

      this.id = id;
      this.personID = personID;
      this.questionsID = questionsID;

      this.person_scores = person_scores;
      this.person_comments = person_comments;
      this.guardian1_scores = guardian1_scores;
      this.guardian1_comments = guardian1_comments;
      this.guardian2_scores = guardian2_scores;
      this.guardian2_comments = guardian2_comments;

      this.gradedOn = gradedOn;
      this.status = status;
      this.userName= userName;
      this.userRole= userRole;

    }
  }