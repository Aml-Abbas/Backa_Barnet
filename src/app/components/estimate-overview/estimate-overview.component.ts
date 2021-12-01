import { Component, OnInit } from '@angular/core';
import {MatTableDataSource} from '@angular/material/table';
import { EstimateCard } from 'src/app/models/EstimateCard';
import { Observable } from 'rxjs';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';

export interface PeriodicElement {
  status: string,
  name: string,
  date: string,

  personID: string,
  userID : string,
}

@Component({
  selector: 'app-estimate-overview',
  templateUrl: './estimate-overview.component.html',
  styleUrls: ['./estimate-overview.component.scss']
})
export class EstimateOverviewComponent implements OnInit {
  displayedColumns: string[] = ['name','status', 'date'];
  estimates$: Observable<EstimateCard[]> = new Observable<EstimateCard[]>();
  estimates: PeriodicElement[] =[];
  dataSource = new MatTableDataSource(this.estimates);

  constructor(private store: Store<fromState.State>) { }

  ngOnInit(): void {
    this.estimates$= this.store.select(fromState.getEstimateCards);
    this.estimates$.subscribe(data=>{
      data.map((estimate: EstimateCard)=>{
        let name= estimate.userName;
        let status= estimate.status;
        let date= estimate.gradedOn;

        let personID= estimate.personID;
        let userID= estimate.userID;

          this.estimates.push({name, status, date, personID, userID});
        
      });
    });
  }

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }

  compile(){
    this.estimates.forEach(element=>{

      var skattning={
        PersonID: element.personID,
        UserID : element.userID,
        GradedOn: element.date,
      }

      this.store.dispatch(new fromState.LockEstimateCards(skattning));
    });
  }
}
