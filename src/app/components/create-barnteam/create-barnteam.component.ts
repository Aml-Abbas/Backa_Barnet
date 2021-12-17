import { Component, OnInit } from '@angular/core';
import { Unit } from 'src/app/models/Unit';
import { GetSetService } from '../../services/get-set/get-set.service';
import { Observable } from 'rxjs';
import {FormControl} from '@angular/forms';
import {Store} from '@ngrx/store';
import * as fromStore from 'src/app/state';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import { ComponentCanDeactivate } from 'src/app/interfaces/component-can-deactivate';
import * as fromState from '../../state';

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
  units$: Promise<Unit[]>= new Promise((resolve, reject) => { });

  units = new FormControl();

  saveError='';
  nameError='';
  unitError='';

  constructor(private store: Store<fromStore.State>,
    private getSetService: GetSetService,
    private _formBuilder: FormBuilder) { }

  ngOnInit(): void {
    this.units$= this.getSetService.getUnitsWithoutAnnat();
    this.createBarnteamFormGroup = this._formBuilder.group({
      nameControl:['', [Validators.required, Validators.minLength(2)]],
    }); 
  }

  create(){
    this.saveError='';
    this.nameError='';
    this.unitError='';
  
    console.log(this.units);
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
          this.units.value.forEach(unit => {
            var user = {
              TeamName:  this.createBarnteamFormGroup.value.nameControl.trim()?? '0',
              UnitID: unit.unitID,
            } 
            this.store.dispatch(new fromState.CreateBarnteam(user));   
            console.log(user); 
          });
          this.store.dispatch(new fromState.Go({ path: ['/barnteam'] }));

        }
      }
 
}
