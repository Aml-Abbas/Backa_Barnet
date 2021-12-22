import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import { User } from 'src/app/models/User';
import { AdminService } from 'src/app/services/admin/admin.service';
import * as fromRoot from '../../../app/state';

@Component({
  selector: 'app-users',
  templateUrl: './users.component.html',
  styleUrls: ['./users.component.scss']
})
export class UsersComponent implements OnInit {

  pusers: Promise<User[]> = new Promise((resolve, reject) => { });
  users: User[] = [];
  searchUsers: User[] = [];

  filterStatus: boolean = false;

  constructor(private store: Store<fromState.State>,
    private adminService: AdminService) { }

  // get the current user from the storage
  // get the user list fom admin service
  ngOnInit(): void {
    this.pusers = this.adminService.getUsers();
    let users = this.users;

    this.pusers.then(function (response) {

      response.forEach((user: User) => {
        users.push(user);
      });
    });
    users.forEach(element => {
      this.users.push(element);
    });

  }

  // this function is called when the user writes something in the search input
  // the function searches for a match user in the user list and display it in the user list
  applyFilter(event: Event) {
    this.searchUsers = [];

    const filterValue = (event.target as HTMLInputElement).value.toLowerCase();
    if (filterValue != '') {
      this.filterStatus = true;
    }
    this.users.forEach(user => {
      var name = (user.firstName + ' ' + user.lastName).toLowerCase();
      if (user.email.toLowerCase().includes(filterValue) || name.includes(filterValue) || user.description.toLowerCase().includes(filterValue)) {
        this.searchUsers.push(user);
      }
    });
  }

  // this function is called when choosing a user from the list
  // update the users and then update the choosen user 
  // move to the user's detail page
  setCurrentAdminUser(user: User) {
    this.store.dispatch(new fromState.UpdateUsers(this.users));

    this.store.dispatch(new fromState.UpdateAdminUser(user));
    this.store.dispatch(new fromRoot.Go({ path: ['/users', user.userID] }));
  }

}
