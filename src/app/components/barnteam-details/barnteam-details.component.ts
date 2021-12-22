import { Component, OnInit } from '@angular/core';
import { Card } from 'src/app/models/Card';
import { Observable } from 'rxjs';
import * as fromState from '../../state';
import { Store } from '@ngrx/store';
import { User } from 'src/app/models/User';
import { Barnteam } from 'src/app/models/Barnteam';
import { AdminService } from '../../services/admin/admin.service';
import { MatDialog } from '@angular/material/dialog';
import { DialogComponent } from '../dialog/dialog.component';

@Component({
  selector: 'app-barnteam-details',
  templateUrl: './barnteam-details.component.html',
  styleUrls: ['./barnteam-details.component.scss']
})
export class BarnteamDetailsComponent implements OnInit {
  memberList$ = new Observable<any[] | null>();
  team$ = new Observable<Barnteam | null>();
  barnteamID: string;

  pusers: Promise<User[]> = new Promise((resolve, reject) => { });
  users: User[] = [];

  constructor(private store: Store<fromState.State>,
    private adminService: AdminService,
    public dialog: MatDialog) { }

  ngOnInit(): void {
    this.team$ = this.store.select(fromState.getCurrentAdminBarnteam);
    this.team$.subscribe(data => {
      this.barnteamID = data?.teamID ?? '';
      this.pusers = this.adminService.getUnitUsers(this.barnteamID);
    });

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

  // This function is called when clicking in the delete  button to delete the current user
  // Show a confirm window and after delete confirmation call the delete action which delete the user
  // send teamId as json object with the delete action to be used in the request
  delete() {
    const dialogRef = this.dialog.open(DialogComponent, {
      data: {
        title: 'Ta bort barnteam',
        text: 'Är du säker att du vill ta bort barnteamet?',
      }
    });

    dialogRef.afterClosed().subscribe(result => {
      if (result) {
        var user = {
          TeamID: this.barnteamID,
        }
        this.store.dispatch(new fromState.RemoveBarnteam(user));

      }
    });


  }
}
