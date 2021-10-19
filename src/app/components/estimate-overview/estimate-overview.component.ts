import { Component, OnInit } from '@angular/core';
import {MatTableDataSource} from '@angular/material/table';

export interface PeriodicElement {
  status: string,
  name: string,
}

const ELEMENT_DATA: PeriodicElement[] = [
  {name: 'Kalle', status:'sparat'},
  {name: 'Peter', status:'icke sparat'},
  {name: 'Deaa', status:'sparat'},
  {name: 'Malak', status:'sparat'},
  {name: 'Lars', status:'sparat'},
  {name: 'Ludviq', status:'sparat'},
  {name: 'Anetta', status:'icke sparat'},
];

@Component({
  selector: 'app-estimate-overview',
  templateUrl: './estimate-overview.component.html',
  styleUrls: ['./estimate-overview.component.scss']
})
export class EstimateOverviewComponent implements OnInit {
  displayedColumns: string[] = ['name','status'];
  dataSource = new MatTableDataSource(ELEMENT_DATA);

  constructor() { }

  ngOnInit(): void {
  }

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }

  compile(){
    //sammanställa alla skattningar
  }
}
