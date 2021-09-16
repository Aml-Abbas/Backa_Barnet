import { Component, OnInit } from '@angular/core';
import {MatTableDataSource} from '@angular/material/table';

export interface PeriodicElement {
  name: string;
  changed: string;
  type: string;
  person_number: number;
}

const ELEMENT_DATA: PeriodicElement[] = [
  {name: 'Aml', changed: 'Hydrogen', type: 'Hydrogen', person_number: 123},
  {name: 'Kalle', changed: 'Helium', type: 'Hydrogen', person_number: 123},
  {name: 'Peter', changed: 'Lithium', type: 'Hydrogen', person_number: 123},
  {name: 'Lina', changed: 'Beryllium', type: 'Hydrogen', person_number: 123},
  {name: 'Maia', changed: 'Boron', type: 'Hydrogen', person_number: 123},
  {name: 'Nada', changed: 'Carbon', type: 'Hydrogen', person_number: 123},
  {name: 'Gustav', changed: 'Nitrogen', type: 'Hydrogen', person_number: 123},
  {name: 'Liam', changed: 'Oxygen', type: 'Hydrogen', person_number: 123},
  {name: 'Linin', changed: 'Fluorine', type: 'Hydrogen', person_number: 123},
  {name: 'Sandra', changed: 'Beryllium', type: 'Hydrogen', person_number: 123},
  {name: 'Anna', changed: 'Boron', type: 'Hydrogen', person_number: 123},
  {name: 'Elin', changed: 'Carbon', type: 'Hydrogen', person_number: 123},
  {name: 'Karl', changed: 'Nitrogen', type: 'Hydrogen', person_number: 123},
  {name: 'Hanna', changed: 'Oxygen', type: 'Hydrogen', person_number: 123},
  {name: 'Liam', changed: 'Fluorine', type: 'Hydrogen', person_number: 123},
  {name: 'Angelika', changed: 'Neon', type: 'Hydrogen', person_number: 123},
];


@Component({
  selector: 'app-contact',
  templateUrl: './contact.component.html',
  styleUrls: ['./contact.component.scss']
})
export class ContactComponent implements OnInit {
  displayedColumns: string[] = ['person_number', 'name', 'changed', 'type'];
  dataSource = new MatTableDataSource(ELEMENT_DATA);

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();

  }

  constructor() { }

  ngOnInit(): void {
  }


}
