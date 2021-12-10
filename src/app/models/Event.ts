export class Event {
    actionID: string;
    actionDescription: string;
    eventID: string;
    eventDescription: string;

    personID: string;

    responsible: string;
    profession: string;

    status: string;
    createdOn: string;

    constructor(actionID: string, actionDescription: string,
        eventID: string, eventDescription: string, 
        personID: string, responsible: string, profession: string,
        status: string, createdOn: string) {

      this.actionID = actionID;
      this.actionDescription = actionDescription;

      this.eventID = eventID;
      this.eventDescription = eventDescription;

      this.personID= personID;
      this.responsible= responsible;
      this.profession= profession;

      this.status = status;
      this.createdOn = createdOn;
    }
  }