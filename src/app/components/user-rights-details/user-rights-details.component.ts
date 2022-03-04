import { Component, OnInit } from '@angular/core';
import * as fromState from '../../state';
import { Store } from '@ngrx/store';
import * as fromRoot from '../../../app/state';
import { Observable } from 'rxjs';
import { UserRight } from 'src/app/models/UserRight';
import { MatDialog } from '@angular/material/dialog';
import { DialogComponent } from '../dialog/dialog.component';


@Component({
  selector: 'app-user-rights-details',
  templateUrl: './user-rights-details.component.html',
  styleUrls: ['./user-rights-details.component.scss']
})
export class UserRightsDetailsComponent implements OnInit {
  userRight$ = new Observable<UserRight | null>();

  currentUserID:string='';
  userID:string='';
  personID:string='';
  type:string='';

  constructor(private store: Store<fromState.State>,
    public dialog: MatDialog) { }

  ngOnInit(): void {
    this.userRight$ = this.store.select(fromState.getUserRight);
    this.userRight$.subscribe(data => {
     this.currentUserID= data?.currentUserID ??'';
     this.userID= data?.userID ??'';
     this.personID= data?.personID ??'';
     this.type= data?.questionTypeID ??'';

    });
  }

  delete() {
    const dialogRef = this.dialog.open(DialogComponent, {
      data: {
        title: 'Ta bort användarens rättighet',
        text: 'Är du säker på att du vill ta bort rättigheten?',
      }
    });

    dialogRef.afterClosed().subscribe(result => {
      if (result) {
        var userRight = {
          CurrentUserID: this.currentUserID,
          UserID: this.userID,
          PersonID: this.personID,
          Type: this.type,
  
        }
        this.store.dispatch(new fromState.RemoveUserRigh(userRight));

      }
    });


  }

}
