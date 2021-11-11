import { Component, OnInit } from '@angular/core';
import {Store} from '@ngrx/store';
import * as fromStore from 'src/app/state';
import {FormBuilder, FormGroup, Validators, FormControl} from '@angular/forms';
import { Observable } from 'rxjs';
import { Unit } from 'src/app/models/Unit';
import { GetSetService } from '../../services/get-set/get-set.service';

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.scss']
})
export class AdminComponent implements OnInit {
  createUserFormGroup: FormGroup;
  saveError='';
  email = new FormControl('', [Validators.required, Validators.email]);
  selectedRole= '0';
  unit=0; 
  added_units: string[]= [];
  units$: Observable<Unit[]> = new Observable<Unit[]>();

  getErrorMessage() {
    if (this.email.hasError('required')) {
      return 'Du behöver skriva ett värde';
    }

    return this.email.hasError('email') ? 'Inte ett giltigt mejl' : '';
  }

  constructor(private store: Store<fromStore.State>,
              private _formBuilder: FormBuilder,
              private getSetService: GetSetService) { }

  ngOnInit(): void {
    this.units$= this.getSetService.getUnits();

    this.createUserFormGroup = this._formBuilder.group({
      organisationControl:['', Validators.required],
      unitControl:['', Validators.required],
    }); 

  }

  createUser(){
    console.log(this.selectedRole);
    console.log(this.unit);
    console.log(this.added_units);

    if(this.email.hasError('required') ){
      this.saveError='Du behöver skriva ett värde i mejlet';
    }else if( this.email.hasError('email')){
      this.saveError='Inte ett giltigt mejl';
    }
    else if(this.createUserFormGroup.status== "INVALID"){
      this.saveError='Du har missat att fylla i saker';
    }else{
      this.saveError='';
    }
  }

  increaseUnit(){
    this.unit++;
  }

  addUnit(name: string, nbr: string){
    this.added_units.push(nbr);
  }

}
