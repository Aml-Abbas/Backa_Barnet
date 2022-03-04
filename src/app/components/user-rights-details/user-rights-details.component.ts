import { Component, OnInit } from '@angular/core';
import * as fromState from '../../state';
import { Store } from '@ngrx/store';
import * as fromRoot from '../../../app/state';
import { Observable } from 'rxjs';
import { UserRight } from 'src/app/models/UserRight';


@Component({
  selector: 'app-user-rights-details',
  templateUrl: './user-rights-details.component.html',
  styleUrls: ['./user-rights-details.component.scss']
})
export class UserRightsDetailsComponent implements OnInit {
  userRight$ = new Observable<UserRight | null>();

  constructor(private store: Store<fromState.State>) { }

  ngOnInit(): void {
    this.userRight$ = this.store.select(fromState.getUserRight);
    
  }

}
