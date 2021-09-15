import { Component, OnInit } from '@angular/core';
import {MatTableDataSource} from '@angular/material/table';

export interface PeriodicElement {
  name: string;
  changed: string;
  Type: string;
}

const ELEMENT_DATA: PeriodicElement[] = [
  {name: '1', changed: 'Hydrogen', Type: 'Hydrogen'},
  {name: '2', changed: 'Helium', Type: 'Hydrogen'},
  {name: '3', changed: 'Lithium', Type: 'Hydrogen'},
  {name: '4', changed: 'Beryllium', Type: 'Hydrogen'},
  {name: '5', changed: 'Boron', Type: 'Hydrogen'},
  {name: '6', changed: 'Carbon', Type: 'Hydrogen'},
  {name: '7', changed: 'Nitrogen', Type: 'Hydrogen'},
  {name: '8', changed: 'Oxygen', Type: 'Hydrogen'},
  {name: '9', changed: 'Fluorine', Type: 'Hydrogen'},
  {name: '4', changed: 'Beryllium', Type: 'Hydrogen'},
  {name: '5', changed: 'Boron', Type: 'Hydrogen'},
  {name: '6', changed: 'Carbon', Type: 'Hydrogen'},
  {name: '7', changed: 'Nitrogen', Type: 'Hydrogen'},
  {name: '8', changed: 'Oxygen', Type: 'Hydrogen'},
  {name: '9', changed: 'Fluorine', Type: 'Hydrogen'},
  {name: '10', changed: 'Neon', Type: 'Hydrogen'},
];


@Component({
  selector: 'app-contact',
  templateUrl: './contact.component.html',
  styleUrls: ['./contact.component.scss']
})
export class ContactComponent implements OnInit {
  displayedColumns: string[] = ['position', 'name', 'weight'];
  dataSource = new MatTableDataSource(ELEMENT_DATA);

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();

  }

  constructor() { }

  ngOnInit(): void {
  }


}
