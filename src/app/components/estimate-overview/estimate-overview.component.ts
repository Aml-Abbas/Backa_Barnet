import { Component, OnInit } from '@angular/core';
import { EstimateCard } from 'src/app/models/EstimateCard';
import { Observable } from 'rxjs';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import { GetSetService } from '../../services/get-set/get-set.service';
import { Person } from 'src/app/models/Person';


@Component({
  selector: 'app-estimate-overview',
  templateUrl: './estimate-overview.component.html',
  styleUrls: ['./estimate-overview.component.scss']
})
export class EstimateOverviewComponent implements OnInit {
  searchEstimate: EstimateCard[] = [];

  pcards: Promise<EstimateCard[]> = new Promise((resolve, reject) => { });
  savedEstimatecards: EstimateCard[] = [];
  current_person$ = new Observable<Person | null>();
  filterStatus: boolean = false;

  constructor(private store: Store<fromState.State>,
    private getSetService: GetSetService) { }

  ngOnInit(): void {
    this.current_person$ = this.store.select(fromState.getCurrentPerson);
    this.current_person$.subscribe(data => {
      this.pcards = this.getSetService.getEstimate(data?.personID ?? '');
    });

    let savedEstimatecards = this.savedEstimatecards;

    this.pcards.then(function (response) {
      response.forEach((card: EstimateCard) => {
        if (card.status == 'Sparat') {
          savedEstimatecards.push(card);
        }
      });
    });

    savedEstimatecards.forEach(element => {
      this.savedEstimatecards = [];
      this.savedEstimatecards.push(element);
    });

  }

  // this function is called when the user writes something in the search input
  // the function searches for a match estimate in the estimate list and display it in the estimate list
  applyFilter(event: Event) {
    this.searchEstimate = [];
    const filterValue = (event.target as HTMLInputElement).value.toLowerCase();
    if (filterValue != '') {
      this.filterStatus = true;
    }
    this.savedEstimatecards.forEach(estimate => {
      if (estimate.userName.toLowerCase().includes(filterValue) || estimate.status.toLowerCase().includes(filterValue) ||
        estimate.gradedOn.toLowerCase().includes(filterValue)) {
        this.searchEstimate.push(estimate);
      }
    });
  }

  // this function is called when clicking the sammanställa button
  // calls LockEstimateCards action to change the status of the estimates
  compile() {
     /*  var skattning = {
        PersonID: element.personID,
        UserID: element.userID,
        GradedOn: element.gradedOn,
      } */
      this.store.dispatch(new fromState.LockEstimateCards(this.savedEstimatecards));
  }

}
