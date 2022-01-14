import { Component, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import * as fromStore from 'src/app/state';
import { FormBuilder, FormGroup, Validators, FormControl } from '@angular/forms';
import { Observable } from 'rxjs';
import { Unit } from 'src/app/models/Unit';
import { GetSetService } from '../../services/get-set/get-set.service';
import { User } from 'src/app/models/User';
import * as fromState from '../../state';
import { ComponentCanDeactivate } from 'src/app/interfaces/component-can-deactivate';
import { MatDialog } from '@angular/material/dialog';
import { DialogComponent } from '../dialog/dialog.component';
import { Actions, ofType } from '@ngrx/effects';
import * as adminAction from '../../state/actions/admin.action';
import { tap } from 'rxjs/operators';

@Component({
  selector: 'app-edit-user',
  templateUrl: './edit-user.component.html',
  styleUrls: ['./edit-user.component.scss']
})
export class EditUserComponent implements OnInit, ComponentCanDeactivate {
  canDeactivate(): boolean {
    return !this.isDirty;
  }

  isDirty = false;
  selectedRole = '0';
  selectedOrganisation = '0';

  unitNbr = 0;
  added_units: string[] = [];
  punits: Promise<Unit[]> = new Promise((resolve, reject) => { });
  unitsList: Unit[] = [];

  units = new FormControl();
  unitNameList: string[] = [];

  saveError = '';
  firstNameError = '';
  lastNameError = '';
  unitError = '';
  organisationError = '';

  user$ = new Observable<User | null>();
  user: User;

  constructor(private store: Store<fromStore.State>,
    private getSetService: GetSetService,
    public dialog: MatDialog,
    private actions$: Actions) { }

  ngOnInit(): void {

    // get the units without "Annat", "Ingen enhet" unit
    this.punits = this.getSetService.getUnitsWithoutAnnat();
    let unitsList = this.unitsList;
    this.punits.then(function (response) {
      response.forEach((unit: Unit) => {
        unitsList.push(unit);
      });
    });
    unitsList.forEach(element => {
      this.unitsList.push(element);
    });

    this.user$ = this.store.select(fromState.getCurrentAdminUser);
    this.user$.subscribe(data => {
      var userID = data?.userID ?? '';
      var lastName = data?.lastName ?? '';
      var firstName = data?.firstName ?? '';
      var email = data?.email ?? '';
      var roleID = data?.roleID ?? '';
      var description = data?.description ?? '';
      var organisaton = data?.organisaton ?? '';
      var name = data?.name ?? '';
      var units = data?.units ?? [];
      this.user = new User(userID, firstName, lastName, email, roleID, description,
        organisaton, name, units);

      units.forEach(unit => {
        this.unitNameList.push(unit.unitName);
      });
      this.units = new FormControl(this.unitNameList);
    });

    // Listen to the UPDATE_USER_SUCCESS action and display a confirmation window to confirm the user about changes
    // send the user to the users page to showthe new user in the users list
    this.actions$.pipe(
      ofType(adminAction.UPDATE_USER_SUCCESS),
      tap(() => {
        const dialogRef = this.dialog.open(DialogComponent, {
          data: {
            title: 'Ändra användare',
            text: 'Du har lyckats ändra användaren.',
          }
        });

        dialogRef.afterClosed().subscribe(result => {
          if (result) {

            this.store.dispatch(new fromStore.Go({ path: ['/users'] }));
          }
        });
      })
    ).subscribe();

  }

  // save the changes on the user
  save() {
    this.saveError = '';
    this.firstNameError = '';
    this.lastNameError = '';
    this.unitError = '';
    this.organisationError = '';

    // check for error before send he request
    if (this.user.firstName.trim().length < 2) {
      this.firstNameError = 'Förnamn ska vara mist två bokstäver.';
      this.saveError = 'Du har missat att fylla i saker';
    } if (this.user.lastName.trim().length < 2) {
      this.lastNameError = 'Efternamn ska vara mist två bokstäver.';
      this.saveError = 'Du har missat att fylla i saker';
    } if (this.user.organisaton.trim().length < 2) {
      this.organisationError = 'Organisationen ska vara minst två bokstäver.';
      this.saveError = 'Du har missat att fylla i saker';
    } if (this.user.roleID != '1' && this.user.roleID != '4') {
      if (this.units.value == null) {
        this.unitError = 'Du måste välja minst en enhet.';
        this.saveError = 'Du har missat att fylla i saker';
      }
    }
    if (this.saveError == '') {
      // no error, send the CreateUser action to create the user
      this.isDirty = false;
      var unitIDs: string[] = [];
      var LastName = this.user.lastName.trim() ?? '0';
      var FirstName = this.user.firstName.trim() ?? '0';
      var Organisation = this.user.organisaton.trim() ?? '0';
      var RoleID = parseInt(this.user.roleID) ?? 0;
      var UserID = this.user.userID;

      if (this.user.roleID == '1' || this.user.roleID == '4') {
        // upptäckare or admin don't have units so send 0 in the units list
        unitIDs.push('0');
      } else {
        // save all unitID in the unitIDs to send to the request
        this.units.value.forEach(unitName => {
          this.unitsList.forEach(unit => {
            if (unit.unitName == unitName) {
              unitIDs.push(unit.unitID);
            }
          });
        });
      }
      this.store.dispatch(new fromState.RemoveUserUnits(LastName, FirstName, Organisation, RoleID, unitIDs, UserID));
    }
  }

  // This function is called when clicking in the delete button to delete the current user
  // Show a confirm window and after delete confirmation call the delete action which delete the user
  // send teamId as json object with the delete action to be used in the request
  delete() {
    const dialogRef = this.dialog.open(DialogComponent, {
      data: {
        title: 'Ta bort användare',
        text: 'Är du säker på att du vill ta bort användaren?',
      }
    });

    dialogRef.afterClosed().subscribe(result => {
      if (result) {
        var user = {
          UserID: this.user.userID,
        }
        this.isDirty = false;
        this.store.dispatch(new fromState.RemoveUser(user));
      }
    });

  }

}
