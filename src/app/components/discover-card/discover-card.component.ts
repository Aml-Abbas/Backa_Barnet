import { Component, OnInit } from '@angular/core';
import {MatTableDataSource} from '@angular/material/table';


export interface PeriodicElement {
  id: number;
  type: string;
  status: string
}

const ELEMENT_DATA: PeriodicElement[] = [
  {id: 1, type: 'Polisen 1', status:'inskickat'},
  {id: 2, type: 'Skolan',status:'inskickat'},
  {id: 3, type: 'Socialtjänsten' ,status:'inskickat'},
  {id: 4, type: 'Polisen 2',status:'inskickat'},
  {id: 1, type: 'Polisen 1',status:'inskickat'},
  {id: 2, type: 'Skolan',status:'sparat'},
  {id: 3, type: 'Socialtjänsten',status:'inskickat'},
  {id: 4, type: 'Polisen 2',status:'inskickat'},
  {id: 1, type: 'Polisen 1',status:'sparat'},
  {id: 2, type: 'Skolan',status:'sparat'},
  {id: 3, type: 'Socialtjänsten',status:'sparat'},
  {id: 4, type: 'Polisen 2',status:'inskickat'},
  {id: 1, type: 'Polisen 1',status:'sparat'},
  {id: 2, type: 'Skolan',status:'inskickat'},
  {id: 3, type: 'Socialtjänsten',status:'sparat'},
  {id: 4, type: 'Polisen 2',status:'sparat'},
];

@Component({
  selector: 'app-discover-card',
  templateUrl: './discover-card.component.html',
  styleUrls: ['./discover-card.component.scss']
})
export class DiscoverCardComponent implements OnInit {
  displayedColumns: string[] = ['id', 'type','status'];
  dataSource = new MatTableDataSource(ELEMENT_DATA);

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }


  constructor() { }

  ngOnInit(): void {
  }

}
