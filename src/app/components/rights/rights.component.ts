import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import { User } from 'src/app/models/User';
import { UserRightService } from 'src/app/services/rights/user-right.service';
import { UserRight } from 'src/app/models/UserRight';


@Component({
  selector: 'app-rights',
  templateUrl: './rights.component.html',
  styleUrls: ['./rights.component.scss']
})

export class RightsComponent implements OnInit {
  usersRights$: Observable<UserRight[]> = new Observable<UserRight[]>();
  current_user$: Observable<User | null> = new Observable<User | null>();
  currentUserID: string="";


  usersRights: UserRight[] = [];
  searchUsersRights: UserRight[] = [];

  filterStatus: boolean = false;

  constructor(private store: Store<fromState.State>,
    private userRight: UserRightService) { }

  ngOnInit(): void {
    this.current_user$ = this.store.select(fromState.getCurrentUser);
    this.current_user$.subscribe(data => {
      this.currentUserID = data?.userID ?? '';
    });

     this.usersRights$ = this.userRight.getUserRight(this.currentUserID);
     this.usersRights$.subscribe(data => {
      data.map((userRight:UserRight) => {
        this.usersRights.push(userRight);
      })
    });

  }


  applyFilter(event: Event) {
     this.searchUsersRights = [];

    const filterValue = (event.target as HTMLInputElement).value.toLowerCase();
    if (filterValue != '') {
      this.filterStatus = true;
    }
    this.usersRights.forEach(userRight => {
      var userName = (userRight.userFirstName + ' ' + userRight.userLastName).toLowerCase();
      var name = (userRight.firstName + ' ' + userRight.lastName).toLowerCase();
      var skattning= 'skattning';
      var samtalsunderlag= 'samtalsunderlag';

      if (userName.toLowerCase().includes(filterValue) || name.includes(filterValue) || skattning.includes(filterValue)|| samtalsunderlag.includes(filterValue)) {
        this.searchUsersRights.push(userRight);
      }
    });
  }

  setCurrentUserRight(userRight:UserRight) {
    this.store.dispatch(new fromState.UpdateUserRights(this.usersRights));

    this.store.dispatch(new fromState.UpdateUserRight(userRight));
    this.store.dispatch(new fromState.Go({ path: ['/rights', userRight.userID, userRight.personID, userRight.questionTypeID] })); 
  }
}
