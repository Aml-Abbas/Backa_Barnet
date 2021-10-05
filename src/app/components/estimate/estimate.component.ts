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

  care_1: string= "1";
  care_2: string= "1";
  care_3: string= "1";
  care_4: string= "1";
  care_5: string= "1";
  care_6: string= "1";

  security_1:string= "1";
  security_2:string= "1";
  security_3:string= "1";
  security_4:string= "1";
  security_5:string= "1";
  security_6:string= "1";
  security_7:string= "1";
  security_8:string= "1";

  feelgood_1:string= "1";
  feelgood_2:string= "1";
  feelgood_3:string= "1";
  feelgood_4:string= "1";
  feelgood_5:string= "1";
  feelgood_6:string= "1";

  freetime_1:string= "1";
  freetime_2:string= "1";
  freetime_3:string= "1";

  beloning_1:string= "1";
  beloning_2:string= "1";
  beloning_3:string= "1";

  responsibility_1:string= "1";
  responsibility_2:string= "1";
  responsibility_3:string= "1";
  responsibility_4:string= "1";
  responsibility_5:string= "1";
  responsibility_6:string= "1";
  responsibility_7:string= "1";

  respekt_1:string= "1";
  respekt_2:string= "1";
  respekt_3:string= "1";
  respekt_4:string= "1";

  develop_1:string= "1";
  develop_2:string= "1";
  develop_3:string= "1";
  develop_4:string= "1";
  develop_5:string= "1";

  constructor(private _formBuilder: FormBuilder) { }

  ngOnInit(): void {
    this.firstFormGroup = this._formBuilder.group({
      care_1: [5, Validators.max, 1 , Validators.min],
      care_2: [5, Validators.max, 1 , Validators.min],
      care_3: [5, Validators.max, 1 , Validators.min],
      care_4: [5, Validators.max, 1 , Validators.min],
      care_5: [5, Validators.max, 1 , Validators.min],
      care_6: [5, Validators.max, 1 , Validators.min],


     //firstCtrl: ['', Validators.required]
    });
    this.secondFormGroup = this._formBuilder.group({
      //secondCtrl: ['', Validators.required]
    });

  }

  send(): void{
    console.log(this.care_1);
    console.log(this.care_2);
    console.log(this.care_3);
    console.log(this.care_4);
    console.log(this.care_5);
    console.log(this.care_6);

    console.log(this.security_1);
    console.log(this.security_2);
    console.log(this.security_3);
    console.log(this.security_4);
    console.log(this.security_5);
    console.log(this.security_6);
    console.log(this.security_7);
    console.log(this.security_8);

    console.log(this.feelgood_1);
    console.log(this.feelgood_2);
    console.log(this.feelgood_3);
    console.log(this.feelgood_4);
    console.log(this.feelgood_5);
    console.log(this.feelgood_6);

    console.log(this.freetime_1);
    console.log(this.freetime_2);
    console.log(this.freetime_3);

    console.log(this.beloning_1);
    console.log(this.beloning_2);
    console.log(this.beloning_3);

    console.log(this.responsibility_1);
    console.log(this.responsibility_2);
    console.log(this.responsibility_3);
    console.log(this.responsibility_4);
    console.log(this.responsibility_5);
    console.log(this.responsibility_6);
    console.log(this.responsibility_7);

    console.log(this.respekt_1);
    console.log(this.respekt_2);
    console.log(this.respekt_3);
    console.log(this.respekt_4);

    console.log(this.develop_1);
    console.log(this.develop_2);
    console.log(this.develop_3);
    console.log(this.develop_4);
    console.log(this.develop_5);

  }

}
