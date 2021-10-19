import { Component, OnInit } from '@angular/core';
import {MatTableDataSource} from '@angular/material/table';

export interface PeriodicElement {
  status: string,
  name: string,
  date: string,
}

const ELEMENT_DATA: PeriodicElement[] = [
  {name: 'Kalle', status:'sparat', date:'2021-08-19'},
  {name: 'Peter', status:'inte sparad', date:''},
  {name: 'Deaa', status:'sparat', date:'2021-08-19'},
  {name: 'Malak', status:'sparat', date:'2021-08-19'},
  {name: 'Lars', status:'sparat', date:'2021-08-19'},
  {name: 'Ludviq', status:'sparat', date:'2021-08-19'},
  {name: 'Anetta', status:'inte sparad', date:''},
];

@Component({
  selector: 'app-estimate-overview',
  templateUrl: './estimate-overview.component.html',
  styleUrls: ['./estimate-overview.component.scss']
})
export class EstimateOverviewComponent implements OnInit {
  displayedColumns: string[] = ['name','status', 'date'];
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
