export class Action {
    title: string;
    date: string;
    description: string[];

    responsible: string;
    role:string;
    id: string;
    status:string;

    constructor(title: string, date: string, 
        description: string[],
        responsible: string, role: string, id: string,
        status: string) {

      this.title = title;

      this.date = date;
      this.description = description;

      this.responsible= responsible;
      this.role= role;
      this.id= id;
      this.status = status;
    }

  }
  
  