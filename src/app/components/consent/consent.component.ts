import { Component, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';



@Component({
  selector: 'app-consent',
  templateUrl: './consent.component.html',
  styleUrls: ['./consent.component.scss']
})


//This component is not implemented, to be implemented in the next development phase
//It is just the html and the css in place
export class ConsentComponent implements OnInit {
  userRoleId: string;


  constructor(private store: Store<fromState.State>) { }

  ngOnInit(): void {
    this.store.select(fromState.getCurrentUser).subscribe(data => {
      this.userRoleId = String(data?.roleID);

    });

  }

  save() {

  }
}
