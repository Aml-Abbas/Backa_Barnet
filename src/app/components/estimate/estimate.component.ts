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
  careFormGroup: FormGroup;
  securityFormGroup: FormGroup;
  feelgoodFormGroup: FormGroup;
  beloningFormGroup: FormGroup;
  responsibilityFormGroup: FormGroup;
  respektFormGroup: FormGroup;
  developFormGroup: FormGroup;
  freetimeFormGroup: FormGroup;

  care_1: string;
  care_2: string;
  care_3: string;
  care_4: string;
  care_5: string;
  care_6: string;

  security_1:string;
  security_2:string;
  security_3:string;
  security_4:string;
  security_5:string;
  security_6:string;
  security_7:string;
  security_8:string;

  feelgood_1:string;
  feelgood_2:string;
  feelgood_3:string;
  feelgood_4:string;
  feelgood_5:string;
  feelgood_6:string;

  freetime_1:string;
  freetime_2:string;
  freetime_3:string;

  beloning_1:string;
  beloning_2:string;
  beloning_3:string;

  responsibility_1:string;
  responsibility_2:string;
  responsibility_3:string;
  responsibility_4:string;
  responsibility_5:string;
  responsibility_6:string;
  responsibility_7:string;

  respekt_1:string;
  respekt_2:string;
  respekt_3:string;
  respekt_4:string;

  develop_1:string;
  develop_2:string;
  develop_3:string;
  develop_4:string;
  develop_5:string;

  saveError='';

  constructor(private _formBuilder: FormBuilder) { }

  ngOnInit(): void {
    this.careFormGroup = this._formBuilder.group({
      care_1: [undefined, Validators.required],
      care_2: [undefined, Validators.required],
      care_3: [undefined, Validators.required],
      care_4: [undefined, Validators.required],
      care_5: [undefined, Validators.required],
      care_6: [undefined, Validators.required]
    });
    
    this.securityFormGroup = this._formBuilder.group({
      security_1: [undefined, Validators.required],
      security_2: [undefined, Validators.required],
      security_3: [undefined, Validators.required],
      security_4: [undefined, Validators.required],
      security_5: [undefined, Validators.required],
      security_6: [undefined, Validators.required],
      security_7: [undefined, Validators.required],
      security_8: [undefined, Validators.required]
    }); 

    this.feelgoodFormGroup = this._formBuilder.group({
      feelgood_1: [undefined, Validators.required],
      feelgood_2: [undefined, Validators.required],
      feelgood_3: [undefined, Validators.required],
      feelgood_4: [undefined, Validators.required],
      feelgood_5: [undefined, Validators.required],
      feelgood_6: [undefined, Validators.required]
    }); 

    this.beloningFormGroup = this._formBuilder.group({
      beloning_1: [undefined, Validators.required],
      beloning_2: [undefined, Validators.required],
      beloning_3: [undefined, Validators.required]
    }); 

    this.responsibilityFormGroup = this._formBuilder.group({
      responsibility_1: [undefined, Validators.required],
      responsibility_2: [undefined, Validators.required],
      responsibility_3: [undefined, Validators.required],
      responsibility_4: [undefined, Validators.required],
      responsibility_5: [undefined, Validators.required],
      responsibility_6: [undefined, Validators.required],
      responsibility_7: [undefined, Validators.required]
    }); 

    this.respektFormGroup = this._formBuilder.group({
      respekt_1: [undefined, Validators.required],
      respekt_2: [undefined, Validators.required],
      respekt_3: [undefined, Validators.required],
      respekt_4: [undefined, Validators.required],
    }); 

    this.developFormGroup = this._formBuilder.group({
      develop_1: [undefined, Validators.required],
      develop_2: [undefined, Validators.required],
      develop_3: [undefined, Validators.required],
      develop_4: [undefined, Validators.required],
      develop_5: [undefined, Validators.required]
    }); 

    this.freetimeFormGroup = this._formBuilder.group({
      freetime_1: [undefined, Validators.required],
      freetime_2: [undefined, Validators.required],
      freetime_3: [undefined, Validators.required]
    }); 

  }

  send(): void{
    if(this.careFormGroup.status== "INVALID" ||
    this.securityFormGroup.status=="INVALID" ||
    this.feelgoodFormGroup.status=="INVALID" ||
    this.beloningFormGroup.status=="INVALID" ||
    this.responsibilityFormGroup.status=="INVALID" ||
    this.respektFormGroup.status=="INVALID" ||
    this.developFormGroup.status=="INVALID" ||
    this.freetimeFormGroup.status=="INVALID"){

      this.saveError='Du har missat att välja ett poäng';
    }else{
      this.saveError='';
    }

    
  console.log(this.care_1);
    console.log(this.care_2);
    console.log(this.care_3);
    console.log(this.care_4);
    console.log(this.care_5);
    console.log(this.care_6);

/*   
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

 */  }

}
