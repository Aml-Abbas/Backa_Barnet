import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {STEPPER_GLOBAL_OPTIONS} from '@angular/cdk/stepper';

@Component({
  selector: 'app-estimate',
  templateUrl: './estimate.component.html',
  styleUrls: ['./estimate.component.scss'],
  providers: [{
    provide: STEPPER_GLOBAL_OPTIONS, useValue: {showError: true}
  }]

})
export class EstimateComponent implements OnInit {
  firstFormGroup: FormGroup;
  secondFormGroup: FormGroup;
/*   thirdFormGroup: FormGroup;
  fourthFormGroup: FormGroup;
  fifthFormGroup: FormGroup;
  sixthFormGroup: FormGroup;
  seventhFormGroup: FormGroup;
  eigthFormGroup: FormGroup; */

  care_1: number;
  care_2: number;
  care_3: number;
  care_4: number;
  care_5: number;
  care_6: number;

  security_1:number;
  security_2:number;
  security_3:number;
  security_4:number;
  security_5:number;
  security_6:number;
  security_7:number;
  security_8:number;


  constructor(private _formBuilder: FormBuilder) { }

  ngOnInit(): void {
    this.firstFormGroup = this._formBuilder.group({
      care_1: [5, Validators.max, 0 , Validators.min],
      care_2: [5, Validators.max, 0 , Validators.min],
      care_3: [5, Validators.max, 0 , Validators.min],
      care_4: [5, Validators.max, 0 , Validators.min],
      care_5: [5, Validators.max, 0 , Validators.min],
      care_6: [5, Validators.max, 0 , Validators.min],


     //firstCtrl: ['', Validators.required]
    });
    this.secondFormGroup = this._formBuilder.group({
      //secondCtrl: ['', Validators.required]
    });

  }

  send(): void{

  }

}
