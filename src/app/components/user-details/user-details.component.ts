import { Component, OnInit } from '@angular/core';
import { Card } from 'src/app/models/Card';
import { Observable } from 'rxjs';
import * as fromState from '../../state';
import { Store } from '@ngrx/store';
import * as fromRoot from '../../../app/state';

@Component({
  selector: 'app-user-details',
  templateUrl: './user-details.component.html',
  styleUrls: ['./user-details.component.scss']
})
export class UserDetailsComponent implements OnInit {

  constructor(private store: Store<fromState.State>) { }

  ngOnInit(): void {
  }

  moveToEdit(){
    this.store.dispatch(new fromRoot.Go({ path: ['/edit-user', 1] }));

  }

}
