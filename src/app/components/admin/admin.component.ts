import { Component, OnInit } from '@angular/core';
import {Store} from '@ngrx/store';
import * as fromStore from 'src/app/state';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.scss']
})
export class AdminComponent implements OnInit {
  createUserFormGroup: FormGroup;
  saveError='';

  constructor(private store: Store<fromStore.State>,
              private _formBuilder: FormBuilder) { }

  ngOnInit(): void {
    this.createUserFormGroup = this._formBuilder.group({
      emailControl: ['', [Validators.required, Validators.email]],
      roleControl:['', Validators.required],
      organisationControl:['', Validators.required],
      unitControl:['', Validators.required],
    }); 

  }

  createUser(){
    if(this.createUserFormGroup.status== "INVALID" ){
      this.saveError='Du har missat att fylla i saker';
    }else{
      this.saveError='';

    }
  }
}
