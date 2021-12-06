import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { Person } from 'src/app/models/Person';
import * as fromRoot from '../../state';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import { GetSetService } from '../../services/get-set/get-set.service';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';

@Component({
  selector: 'app-create-insats',
  templateUrl: './create-insats.component.html',
  styleUrls: ['./create-insats.component.scss']
})
export class CreateInsatsComponent implements OnInit {
  createPlanFormGroup: FormGroup;
  saveError='';
  current_person$= new Observable<Person | null>();

  constructor(private _formBuilder: FormBuilder,
    private store: Store<fromState.State>) { }

  ngOnInit(): void {
    this.createPlanFormGroup = this._formBuilder.group({
      nameControl: ['', [Validators.required, Validators.minLength(2)]],
      proControl: ['', [Validators.required, Validators.minLength(2)]],
      eventControl: ['', [Validators.required, Validators.minLength(10)]],
      planControl: ['', [Validators.required], Validators.minLength(10)],
    }); 
    this.current_person$ = this.store.select(fromState.getCurrentPerson);
    this.current_person$.subscribe(data=>{
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
