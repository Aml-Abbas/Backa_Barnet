import { Component, OnInit } from '@angular/core';
import {Store} from '@ngrx/store';
import * as fromStore from 'src/app/state';
import {FormBuilder, FormGroup, Validators, FormControl} from '@angular/forms';
import { Observable } from 'rxjs';
import { Unit } from 'src/app/models/Unit';
import { GetSetService } from '../../services/get-set/get-set.service';
import { ComponentCanDeactivate } from 'src/app/interfaces/component-can-deactivate';
import * as fromState from '../../state';


@Component({
  selector: 'app-create-user',
  templateUrl: './create-user.component.html',
  styleUrls: ['./create-user.component.scss']
})
export class CreateUserComponent implements OnInit , ComponentCanDeactivate {
  canDeactivate(): boolean {
    return !this.isDirty;
  }

  isDirty = false;
  createUserFormGroup: FormGroup;
  email = new FormControl('', [Validators.required, Validators.email]);
  selectedRole= '1';

  added_units: string[]= [];
  units$: Promise<Unit[]>= new Promise((resolve, reject) => { });

  units = new FormControl();
  
  saveError='';
  firstNameError='';
  lastNameError='';
  organisationError='';
  emailError='';
  unitError='';

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
    this.units$= this.getSetService.getUnitsWithoutAnnat();
    this.createUserFormGroup = this._formBuilder.group({
      lastNameControl:['', [Validators.required, Validators.minLength(2)]],
      firstNameControl:['', [Validators.required, Validators.minLength(2)]],
      organisationControl:['', [Validators.required, Validators.minLength(2)]],
    }); 

  }

  createUser(){
    this.saveError='';
    this.firstNameError='';
    this.lastNameError='';
    this.emailError='';
    this.unitError='';
    this.organisationError='';
    console.log(this.units.value);

    if(this.email.hasError('required') ){
      this.emailError='Du behöver skriva ett värde i mejlet';
      this.saveError='Rätta felen först';
    }else if( this.email.hasError('email')){
      this.saveError='Rätta felen först';
      this.emailError='Inte ett giltigt mejl';
    }
    if(this.createUserFormGroup.controls.firstNameControl.status== "INVALID"){
      this.firstNameError='Förnamn ska vara mist två bokstäver.';
      this.saveError='Rätta felen först';
    }if(this.createUserFormGroup.controls.lastNameControl.status== "INVALID"){
      this.lastNameError='Efternamn ska vara mist två bokstäver.';
      this.saveError='Rätta felen först';
    }if(this.createUserFormGroup.controls.organisationControl.status== "INVALID"){
      this.organisationError='Organisationen ska vara minst två bokstäver.';
      this.saveError='Rätta felen först';
    }if(this.selectedRole!='1' && this.selectedRole!='4'){
      if(this.units.value==null){
        this.unitError='Du måste välja minst en enhet.';
        this.saveError='Rätta felen först';
      }
    }
    if(this.saveError==''){
      this.isDirty= false;

      if(this.selectedRole=='1' || this.selectedRole=='4'){
        var user = {
          LastName :  this.createUserFormGroup.value.lastNameControl.trim()?? '0',
          FirstName : this.createUserFormGroup.value.firstNameControl.trim() ?? '0',
          Email  : this.email.value.trim() ?? '0',
          Organisation : this.createUserFormGroup.value.organisationControl.trim() ?? '0',
          RoleID : parseInt(this.selectedRole) ?? 0,
          UnitID : 0,
        } 
        this.store.dispatch(new fromState.CreateUser(user));

      }else{
        this.units.value.forEach(unit => {
          var user = {
            LastName :  this.createUserFormGroup.value.lastNameControl.trim()?? '0',
            FirstName : this.createUserFormGroup.value.firstNameControl.trim() ?? '0',
            Email  : this.email.value.trim() ?? '0',
            Organisation : this.createUserFormGroup.value.organisationControl.trim() ?? '0',
            RoleID : parseInt(this.selectedRole) ?? 0,
            UnitID : unit.unitID,
          } 
          this.store.dispatch(new fromState.CreateUser(user));
    
        });
      }
    }
    
  }

}
