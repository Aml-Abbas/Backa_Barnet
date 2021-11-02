import { Component, OnInit } from '@angular/core';
import {Store} from '@ngrx/store';
import * as fromStore from 'src/app/state';
import {FormBuilder, FormGroup, Validators, FormControl} from '@angular/forms';

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

  getErrorMessage() {
    if (this.email.hasError('required')) {
      return 'Du behöver skriva ett värde';
    }

    return this.email.hasError('email') ? 'Inte ett giltigt mejl' : '';
  }

  constructor(private store: Store<fromStore.State>,
              private _formBuilder: FormBuilder) { }

  ngOnInit(): void {
    this.createUserFormGroup = this._formBuilder.group({
      organisationControl:['', Validators.required],
      unitControl:['', Validators.required],
    }); 

  }

  createUser(){
    console.log(this.selectedRole);
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
}
