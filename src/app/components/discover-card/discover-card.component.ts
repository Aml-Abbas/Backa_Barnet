import { Component, OnInit } from '@angular/core';
import {MatTableDataSource} from '@angular/material/table';


export interface PeriodicElement {
  id: number;
  type: string;
}

const ELEMENT_DATA: PeriodicElement[] = [
  {id: 1, type: 'Polisen 1'},
  {id: 2, type: 'Skolan'},
  {id: 3, type: 'Socialtjänsten'},
  {id: 4, type: 'Polisen 2'},


];

@Component({
  selector: 'app-discover-card',
  templateUrl: './discover-card.component.html',
  styleUrls: ['./discover-card.component.scss']
})
export class DiscoverCardComponent implements OnInit {
  displayedColumns: string[] = ['id', 'type'];
  dataSource = new MatTableDataSource(ELEMENT_DATA);

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }


  constructor() { }

  ngOnInit(): void {
  }

}
