import { Component, OnInit } from '@angular/core';
import {Store} from '@ngrx/store';
import * as fromStore from 'src/app/state';
import {FormBuilder, FormGroup, Validators, FormControl} from '@angular/forms';
import { Observable } from 'rxjs';
import { Unit } from 'src/app/models/Unit';
import { GetSetService } from '../../services/get-set/get-set.service';
import { ComponentCanDeactivate } from 'src/app/interfaces/component-can-deactivate';


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
  selectedRole= '0';
  selectedOrganisation= '0';

  unitNbr=0; 
  added_units: string[]= [];
  units$: Observable<Unit[]> = new Observable<Unit[]>();

  units = new FormControl();
  
  saveError='';
  nameError='';
  emailError='';
  nbrError='';
  workError='';
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
    this.units$= this.getSetService.getUnits();

    this.createUserFormGroup = this._formBuilder.group({
      nameControl:['', [Validators.required, Validators.minLength(2)]],
      numberControl:['', [Validators.required, Validators.minLength(10), Validators.maxLength(10)]],
      workplaceControl:['', [Validators.required, Validators.minLength(2)]],
    }); 

  }

  createUser(){
    this.saveError='';
    this.nameError='';
    this.emailError='';
    this.nbrError='';
    this.workError='';
    this.unitError='';
  
    if(this.email.hasError('required') ){
      this.emailError='Du behöver skriva ett värde i mejlet';
      this.saveError='Rätta felen först';
    }else if( this.email.hasError('email')){
      this.saveError='Rätta felen först';
      this.emailError='Inte ett giltigt mejl';
    }
    if(this.createUserFormGroup.controls.nameControl.status== "INVALID"){
      this.nameError='Namnet ska vara mist två bokstäver.';
      this.saveError='Rätta felen först';
    }if(this.selectedRole!='0'){
      if(this.createUserFormGroup.controls.numberControl.status== "INVALID"){
        this.nbrError='Numret ska vara 10 siffror.';
        this.saveError='Rätta felen först';
      }if(this.createUserFormGroup.controls.workplaceControl.status== "INVALID"){
        this.workError='jobbplats behövs.';
        this.saveError='Rätta felen först';
      }if(this.units.value==null){
        this.unitError='Du måste välja minst en enhet.';
        this.saveError='Rätta felen först';
      }
    }
    
  }

  changeRole(nbr: number){
    if(nbr==0){
      this.unitNbr=0;
    }
    else{
      this.unitNbr=1;
    }
  }

}
