import { Component, OnInit } from '@angular/core';
import {Store} from '@ngrx/store';
import * as fromStore from 'src/app/state';
import {FormBuilder, FormGroup, Validators, FormControl} from '@angular/forms';
import { Observable } from 'rxjs';
import { Unit } from 'src/app/models/Unit';
import { GetSetService } from '../../services/get-set/get-set.service';


@Component({
  selector: 'app-create-user',
  templateUrl: './create-user.component.html',
  styleUrls: ['./create-user.component.scss']
})
export class CreateUserComponent implements OnInit {

  createUserFormGroup: FormGroup;
  saveError='';
  email = new FormControl('', [Validators.required, Validators.email]);
  selectedRole= '0';
  unitNbr=0; 
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
      nameControl:['', Validators.required],
      organisationControl:['', Validators.required],
      unitControl:['', Validators.required],
      numberControl:['', Validators.required],
      workplaceControl:['', Validators.required],
    }); 

  }

  createUser(){
    console.log(this.selectedRole);
    console.log(this.unitNbr);
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
    this.unitNbr++;
  }

  decreaseUnit(){
    this.unitNbr--;
  }

  changeRole(nbr: number){
    if(nbr==0){
      this.unitNbr=0;
    }
    else{
      this.unitNbr=1;
    }
  }

  addUnit(name: string, nbr: string){
    this.added_units.push(nbr);
  }
}
