export class CompassDataEstimate {
  gradedOn: string;

  userName: string;

  grades: any[];

  constructor(gradedOn: string, userName: string,
    grades: string[]) {

    this.gradedOn = gradedOn;
    this.userName = userName;

    this.grades = grades;
  }
}