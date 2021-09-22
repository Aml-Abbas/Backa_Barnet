import { Component, OnInit } from '@angular/core';
import {MatTableDataSource} from '@angular/material/table';
import { Person } from 'src/app/models/Person';
import { PersonsService } from 'src/app/services/persons/persons.service';


@Component({
  selector: 'app-contact',
  templateUrl: './contact.component.html',
  styleUrls: ['./contact.component.scss']
})
export class ContactComponent implements OnInit {
  displayedColumns: string[] = ['personNr', 'firstName', 'changeDate', 'changeBy'];
  persons_list: Person[]= JSON.parse(localStorage.personsList || '[]');

  current_person= JSON.parse(localStorage.currentPerson || '[]');
  dataSource = new MatTableDataSource(this.persons_list);


  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }

  constructor(private personsService: PersonsService) { }

  ngOnInit(): void {
    this.personsService.current_persons_list$.subscribe(persons_list=> this.persons_list= persons_list);
    this.dataSource = new MatTableDataSource(this.persons_list);
    this.personsService.current_person$.subscribe(current_person=> this.current_person=current_person);

    }

    setCurrentPerson(personNbr: string){
      console.log('the personNbr is');
      console.log(personNbr);

      this.persons_list.forEach(element => {
        if(element.personNr== personNbr){
          this.personsService.setPerson(element);
          localStorage.setItem("currentPerson", JSON.stringify(element));
          console.log('will save the element');
          console.log(element);
        }
      });
    }

}
