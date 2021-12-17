import { Unit } from 'src/app/models/Unit';

export class Barnteam {
    teamID: string;
    teamName: string;
    createdOn: string;
    units: Unit[];

    constructor(teamID: string, teamName: string, createdOn: string,
      units: Unit[]) {
            
      this.teamID = teamID;
      this.teamName = teamName;
      this.createdOn = createdOn;

      this.units= units;
    }
  }