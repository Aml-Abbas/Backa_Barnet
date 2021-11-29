import { Component, OnInit } from '@angular/core';
import { Card } from 'src/app/models/Card';
import { Observable } from 'rxjs';
import * as fromState from '../../state';
import { Store } from '@ngrx/store';
import * as fromRoot from '../../../app/state';

@Component({
  selector: 'app-barnteam-details',
  templateUrl: './barnteam-details.component.html',
  styleUrls: ['./barnteam-details.component.scss']
})
export class BarnteamDetailsComponent implements OnInit {

  constructor(private store: Store<fromState.State>) { }

  ngOnInit(): void {
  }

  moveToEdit(){
    this.store.dispatch(new fromRoot.Go({ path: ['/edit-barnteam', 1] }));

  }
}
