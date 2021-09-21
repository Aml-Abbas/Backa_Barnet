export class Person {
    personID: string;
    personNr: string;
    lastName: string;
    firstName: string;
    address: string;
    city: string;
    personRoleID: string;
    personTypeID: string;
    createBy: string;
    createDate: string;
    changeBy: string;
    changeDate: string;

  
    constructor(personID: string, personNr: string, 
        firstName: string, lastName: string,
        address: string, city: string,
        personRoleID: string, personTypeID: string,
        createBy: string, createDate: string, 
        changeBy: string, changeDate: string) {
            
      this.personNr = personNr;
      this.firstName = firstName;
      this.lastName = lastName;
      this.changeDate = changeDate;
      this.personID= personID;

      this.address= address;
      this.city= city;
      this.personRoleID= personRoleID;
      this.personTypeID= personTypeID;
      this.createBy= createBy;
      this.createDate= createDate;
      this.changeBy= changeBy;
    }
  }