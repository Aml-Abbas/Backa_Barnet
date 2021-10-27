import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';

@Component({
  selector: 'app-create-event',
  templateUrl: './create-event.component.html',
  styleUrls: ['./create-event.component.scss']
})
export class CreateEventComponent implements OnInit {
  createPlanFormGroup: FormGroup;
  saveError='';

  constructor(private _formBuilder: FormBuilder) { }

  ngOnInit(): void {
    this.createPlanFormGroup = this._formBuilder.group({
      dateControl: ['', Validators.required],
      nameControl: ['', [Validators.required, Validators.minLength(2)]],
      proControl: ['', [Validators.required]],
      eventControl: ['', [Validators.required]],
      planControl: ['', [Validators.required]],

    }); 
  }

  save(){
    if(this.createPlanFormGroup.status== "INVALID"){
      this.saveError='Du har missat att fylla i saker';
      }else{
        this.saveError='';
      }
  }
}
