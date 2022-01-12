import { Component, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import * as fromStore from 'src/app/state';
import { FormBuilder, FormGroup, Validators, FormControl } from '@angular/forms';
import { Unit } from 'src/app/models/Unit';
import { GetSetService } from '../../services/get-set/get-set.service';
import { ComponentCanDeactivate } from 'src/app/interfaces/component-can-deactivate';
import * as fromState from '../../state';
import { Actions, ofType } from '@ngrx/effects';
import * as adminAction from '../../state/actions/admin.action';
import { tap } from 'rxjs/operators';
import { DialogComponent } from '../../components/dialog/dialog.component';
import { MatDialog } from '@angular/material/dialog';
import { Observable } from 'rxjs';
import { AdminService } from '../../services/admin/admin.service';

@Component({
  selector: 'app-create-user',
  templateUrl: './create-user.component.html',
  styleUrls: ['./create-user.component.scss']
})

export class CreateUserComponent implements OnInit, ComponentCanDeactivate {
  canDeactivate(): boolean {
    return !this.isDirty;
  }

  isDirty = false;
  createUserFormGroup: FormGroup;
  email = new FormControl('', [Validators.required, Validators.email]);
  units = new FormControl();

  selectedRole = '1';

  added_units: string[] = [];
  units$: Promise<Unit[]> = new Promise((resolve, reject) => { });

  unitsBarnkontakt$: Observable<Unit[]> = new Observable<Unit[]>();

  // the error msgs to be shown to the user
  saveError = '';
  firstNameError = '';
  lastNameError = '';
  organisationError = '';
  emailError = '';
  unitError = '';

  // email error msg to be shown to the user
  getErrorMessage() {
    if (this.email.hasError('required')) {
      return 'Du behöver skriva ett värde';
    }
    return this.email.hasError('email') ? 'Inte en giltig e-post' : '';
  }

  constructor(private store: Store<fromStore.State>,
    private _formBuilder: FormBuilder,
    private getSetService: GetSetService,
    private actions$: Actions,
    public dialog: MatDialog,
    private adminService: AdminService) { }

  ngOnInit(): void {

    // get the units without "Annat", "Ingen enhet" unit
    this.units$ = this.getSetService.getUnitsWithoutAnnat();

    this.unitsBarnkontakt$ = this.adminService.getUnitsBarnKontakt();
    this.unitsBarnkontakt$.subscribe(data=>{
      data.forEach((unit:Unit)=>{
        console.log(unit);
      });
    });

    this.createUserFormGroup = this._formBuilder.group({
      lastNameControl: ['', [Validators.required, Validators.minLength(2)]],
      firstNameControl: ['', [Validators.required, Validators.minLength(2)]],
      organisationControl: ['', [Validators.required, Validators.minLength(2)]],
    });

    // Listen to the CREATE_USER_SUCCESS action and display a confirmation window to confirm the user about changes
    // send the user to the users page to showthe new user in the users list
    this.actions$.pipe(
      ofType(adminAction.CREATE_USER_SUCCESS),
      tap(() => {
        const dialogRef = this.dialog.open(DialogComponent, {
          data: {
            title: 'Skapa användare',
            text: 'Du har lyckats skapa en ny användare.',
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

  // craete the user
  createUser() {
    this.saveError = '';
    this.firstNameError = '';
    this.lastNameError = '';
    this.emailError = '';
    this.unitError = '';
    this.organisationError = '';

    // check for errors before send the request
    if (this.email.hasError('required')) {
      this.emailError = 'Du behöver skriva ett värde i mejlet';
      this.saveError = 'Du har missat att fylla i saker';
    } else if (this.email.hasError('email')) {
      this.saveError = 'Du har missat att fylla i saker';
      this.emailError = 'Inte en giltig e-post';
    }
    if (this.createUserFormGroup.controls.firstNameControl.status == "INVALID") {
      this.firstNameError = 'Förnamn ska vara mist två bokstäver.';
      this.saveError = 'Du har missat att fylla i saker';
    } if (this.createUserFormGroup.controls.lastNameControl.status == "INVALID") {
      this.lastNameError = 'Efternamn ska vara mist två bokstäver.';
      this.saveError = 'Du har missat att fylla i saker';
    } if (this.createUserFormGroup.controls.organisationControl.status == "INVALID") {
      this.organisationError = 'Organisationen ska vara minst två bokstäver.';
      this.saveError = 'Du har missat att fylla i saker';
    } if (this.selectedRole != '1' && this.selectedRole != '4') {
      if (this.units.value == null) {
        this.unitError = 'Du måste välja minst en enhet.';
        this.saveError = 'Du har missat att fylla i saker';
      }
    }
    if (this.saveError == '') {
      // no error, send the CreateUser action to create the user
      this.isDirty = false;
      var unitIDs: string[] = [];
      var LastName = this.createUserFormGroup.value.lastNameControl.trim() ?? '0';
      var FirstName = this.createUserFormGroup.value.firstNameControl.trim() ?? '0';
      var Email = this.email.value.trim() ?? '0';
      var Organisation = this.createUserFormGroup.value.organisationControl.trim() ?? '0';
      var RoleID = parseInt(this.selectedRole) ?? 0;

      if (this.selectedRole == '1' || this.selectedRole == '4') {
        // upptäckare or admin don't have units so send 0 in the units list
        unitIDs.push('0');

      } else {
        // save all unitID in the unitIDs to send to the request
        this.units.value.forEach(unit => {
          unitIDs.push(unit.unitID);
        });
      }
      this.store.dispatch(new fromState.CreateUser(LastName, FirstName, Email, Organisation, RoleID, unitIDs));
    }

  }

}
