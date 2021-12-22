import { Component, OnInit } from '@angular/core';
import { Unit } from 'src/app/models/Unit';
import { AdminService } from '../../services/admin/admin.service';
import { Observable } from 'rxjs';
import { FormControl } from '@angular/forms';
import { Store } from '@ngrx/store';
import * as fromStore from 'src/app/state';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ComponentCanDeactivate } from 'src/app/interfaces/component-can-deactivate';
import * as fromState from '../../state';
import { Actions, ofType } from '@ngrx/effects';
import * as adminAction from '../../state/actions/admin.action';
import { tap } from 'rxjs/operators';
import { DialogComponent } from '../../components/dialog/dialog.component';
import { MatDialog } from '@angular/material/dialog';

@Component({
  selector: 'app-create-barnteam',
  templateUrl: './create-barnteam.component.html',
  styleUrls: ['./create-barnteam.component.scss']
})
export class CreateBarnteamComponent implements OnInit, ComponentCanDeactivate {
  canDeactivate(): boolean {
    return !this.isDirty;
  }

  isDirty = false;

  createBarnteamFormGroup: FormGroup;

  selectedRole = '0';
  unitNbr = 1;
  added_units: string[] = [];
  units$: Observable<Unit[]> = new Observable<Unit[]>();

  units = new FormControl();
  ChoosenUnits: Unit[] = [];

  saveError = '';
  nameError = '';
  unitError = '';

  constructor(private store: Store<fromStore.State>,
    private adminService: AdminService,
    private _formBuilder: FormBuilder,
    private actions$: Actions,
    public dialog: MatDialog) { }

  ngOnInit(): void {

    // get the availabe units to be choosen when creating a new team
    this.units$ = this.adminService.getUnits();
    this.createBarnteamFormGroup = this._formBuilder.group({
      nameControl: ['', [Validators.required, Validators.minLength(2)]],
    });

    // Listen to the CREATE_BARNTEAM_SUCCESS action and display a confirmation window to confirm the user about the changes
    //move th barnteam page to display the new barnteam
    this.actions$.pipe(
      ofType(adminAction.CREATE_BARNTEAM_SUCCESS),
      tap(() => {
        const dialogRef = this.dialog.open(DialogComponent, {
          data: {
            title: 'Skapa barnteam',
            text: 'Du har lyckats skapa ett nytt barnteam.',
          }
        });

        dialogRef.afterClosed().subscribe(result => {
          if (result) {
            this.store.dispatch(new fromStore.Go({ path: ['/barnteam'] }));
          }
        });
      })
    ).subscribe();

  }

  // This function is called when clicking in the create button to create a user
  // creating a user by calling the crateBarnteam action action and send team name and and theunits to be used later in the request
  create() {
    this.saveError = '';
    this.nameError = '';
    this.unitError = '';

    // check for error before creating the user
    if (this.createBarnteamFormGroup.status == "INVALID") {
      this.saveError = 'Du har missat att fylla i saker';
      this.nameError = 'Namnet ska vara minst två bokstäver.';
    }
    if (this.units.value == null || this.units.value.length == 0) {
      this.saveError = 'Du har missat att fylla i saker';
      this.unitError = 'Välj minst en enhet.';

    }

    // when no error found, create the user 
    if (this.saveError == "") {
      this.isDirty = false;

      var unitIDs: string[] = [];
      var teamNName = this.createBarnteamFormGroup.value.nameControl.trim() ?? '0';
      this.units.value.forEach(unit => {
        unitIDs.push(unit.unitID);
      });

      this.store.dispatch(new fromState.CreateBarnteam(teamNName, unitIDs));
    }
  }

}
