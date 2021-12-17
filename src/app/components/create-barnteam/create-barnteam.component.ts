import { Component, OnInit } from '@angular/core';
import { Unit } from 'src/app/models/Unit';
import { AdminService } from '../../services/admin/admin.service';
import { Observable } from 'rxjs';
import {FormControl} from '@angular/forms';
import {Store} from '@ngrx/store';
import * as fromStore from 'src/app/state';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import { ComponentCanDeactivate } from 'src/app/interfaces/component-can-deactivate';
import * as fromState from '../../state';
import { ThrowStmt } from '@angular/compiler';

@Component({
  selector: 'app-create-barnteam',
  templateUrl: './create-barnteam.component.html',
  styleUrls: ['./create-barnteam.component.scss']
})
export class CreateBarnteamComponent implements OnInit , ComponentCanDeactivate {
  canDeactivate(): boolean {
    return !this.isDirty;
  }

  isDirty = false;

  createBarnteamFormGroup: FormGroup;

  selectedRole= '0';
  unitNbr=1; 
  added_units: string[]= [];
  units$: Observable<Unit[]> = new Observable<Unit[]>();

  units = new FormControl();
  ChoosenUnits: Unit[]= [];

  saveError='';
  nameError='';
  unitError='';

  constructor(private store: Store<fromStore.State>,
    private adminService: AdminService,
    private _formBuilder: FormBuilder) { }

  ngOnInit(): void {
    this.units$= this.adminService.getUnits();
    this.createBarnteamFormGroup = this._formBuilder.group({
      nameControl:['', [Validators.required, Validators.minLength(2)]],
    }); 
  }

  create(){
    this.saveError='';
    this.nameError='';
    this.unitError='';
  
    if(this.createBarnteamFormGroup.status== "INVALID"){
      this.saveError='Rätta felen först';
      this.nameError='Namnet ska vara minst två bokstäver.';
    }
    if(this.units.value==null || this.units.value.length==0){
      this.saveError='Rätta felen först';
      this.unitError='Välj minst en enhet.';

    }
    if(this.saveError==""){
      this.isDirty= false;

      var unitIDs: string[]=[];
      var teamNName= this.createBarnteamFormGroup.value.nameControl.trim()?? '0';
      this.units.value.forEach(unit => {
        unitIDs.push(unit.unitID);
/*             var user = {
              TeamName:  this.createBarnteamFormGroup.value.nameControl.trim()?? '0',
              UnitID: unit.unitID,
            } 
            
            console.log(user);  */
          }); 

          this.store.dispatch(new fromState.CreateBarnteam(teamNName, unitIDs));

          //this.store.dispatch(new fromState.Go({ path: ['/barnteam'] }));

        }
      }
 
}
