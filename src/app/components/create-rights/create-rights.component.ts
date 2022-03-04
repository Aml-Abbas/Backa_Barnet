import { Component, OnInit } from '@angular/core';
import { ComponentCanDeactivate } from 'src/app/interfaces/component-can-deactivate';
import { FormBuilder, FormGroup, Validators, FormControl } from '@angular/forms';
import { User } from 'src/app/models/User';
import { AdminService } from 'src/app/services/admin/admin.service';
import { Person } from 'src/app/models/Person';
import { Observable } from 'rxjs';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import { UserRightService } from 'src/app/services/rights/user-right.service';
import { Actions, ofType } from '@ngrx/effects';
import { MatDialog } from '@angular/material/dialog';
import * as userRightsAction from '../../state/actions/userRights.action';
import { tap } from 'rxjs/operators';
import { DialogComponent } from '../dialog/dialog.component';
import * as fromStore from 'src/app/state';


@Component({
  selector: 'app-create-rights',
  templateUrl: './create-rights.component.html',
  styleUrls: ['./create-rights.component.scss']
})
export class CreateRightsComponent implements OnInit, ComponentCanDeactivate{
  canDeactivate(): boolean {
      return !this.isDirty;
  }

  isDirty = false;
  createRightsFormGroup: FormGroup;
  
  pusers: Promise<User[]> = new Promise((resolve, reject) => { });
  users: User[] = [];

  persons$: Observable<Person[]> = new Observable<Person[]>();
  persons: Person[] = [];

  currentUserID = '';

  selectedUser = '';
  selectedChild = '';
  selectedType = 1;

  saveError = '';

  userError = '';
  childError = '';
  typeError = '';
  current_user$: Observable<User | null> = new Observable<User | null>();

  constructor(private adminService: AdminService,
    private store: Store<fromState.State>,
    private _formBuilder: FormBuilder,
    private userRight: UserRightService,
    private actions$: Actions,
    public dialog: MatDialog) { }

  ngOnInit(): void {
    this.createRightsFormGroup = this._formBuilder.group({
    });

    this.current_user$ = this.store.select(fromState.getCurrentUser);
    this.current_user$.subscribe(data => {
      this.currentUserID = data?.userID ?? '';
      this.store.dispatch(new fromState.LoadPersons(this.currentUserID));
    });

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

    this.persons$ = this.store.select(fromState.getPersons);
    this.persons$.subscribe(data => {
      this.persons = [];
      data.map((person: Person) => {
        let personNbr = person.personNbr;
        let lastName = person.lastName;
        let firstName = person.firstName;

        let name = person.firstName + ' ' + person.lastName;
        let guardian1 = person.guardian1;
        let guardianPersonNbr1 = person.guardianPersonNbr1;
        let guardian2 = person.guardian2;
        let guardianPersonNbr2 = person.guardianPersonNbr2;

        let changedBy = person.changedBy;
        let changedOn = person.changedOn;
        let status = person.status;
        let personID = person.personID;

        let current_per = new Person(personNbr, lastName, firstName, name,
          guardian1, guardianPersonNbr1, guardian2, guardianPersonNbr2,
          changedBy, changedOn, status, personID);

        if (status != 'Anonymiserad') {
          this.persons.push(current_per);
        }
      }

      )
    });

      this.actions$.pipe(
      ofType(userRightsAction.CREATE_USER_RIGHT_SUCCESS),
      tap(() => {
        const dialogRef = this.dialog.open(DialogComponent, {
          data: {
            title: 'Skapa rättighet',
            text: 'Du har lyckats skapa en ny rttighet.',
          }
        });

        dialogRef.afterClosed().subscribe(result => {
          if (result) {
            this.store.dispatch(new fromStore.Go({ path: ['/rights'] }));
          }
        });
      })
    ).subscribe();

  }

  
  createRights() {
    this.saveError = '';
    this.userError = '';
    this.childError = '';
    this.typeError = '';

    // check for errors before send the request
    if (this.selectedUser=='') {
      this.userError = 'Du behöver välja en användare';
      this.saveError = 'Du har missat att fylla i saker';
    } 
    if (this.selectedChild=='') {
      this.childError = 'Du behöver välja ett barn.';
      this.saveError = 'Du har missat att fylla i saker';
    }

    if (this.saveError == '') {
     console.log(this.selectedUser);
     console.log(this.selectedChild);
     console.log(this.selectedType);

     this.store.dispatch(new fromState.CreateUserRight(parseInt(this.currentUserID), parseInt(this.selectedUser), parseInt(this.selectedChild), this.selectedType));
    }

  }
}
