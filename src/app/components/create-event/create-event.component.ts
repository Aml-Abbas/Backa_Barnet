import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { Person } from 'src/app/models/Person';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ComponentCanDeactivate } from 'src/app/interfaces/component-can-deactivate';

@Component({
  selector: 'app-create-event',
  templateUrl: './create-event.component.html',
  styleUrls: ['./create-event.component.scss']
})
export class CreateEventComponent implements OnInit , ComponentCanDeactivate {
  canDeactivate(): boolean {
    return !this.isDirty;
  }

  isDirty = false;
  createPlanFormGroup: FormGroup;
  saveError = '';
  eventError = '';
  planError = '';
  nameError = '';
  proError = '';

  current_person$ = new Observable<Person | null>();
  personID: string;

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
    this.current_person$.subscribe(data => {
      this.personID = data?.personID ?? '';
    });

  }

  save() {
    this.saveError = '';
    this.eventError = '';
    this.planError = '';
    this.nameError = '';
    this.proError = '';
  
    var name = this.createPlanFormGroup.value.nameControl.trim().split(' ');

    if (this.createPlanFormGroup.status == "INVALID") {
      this.saveError = 'Du har missat att fylla i saker';
    } if (this.createPlanFormGroup.controls.eventControl.status == "INVALID") {
      this.eventError = 'Händelse beskrivning måste vara minst 10 bokstäver';
    } if (this.createPlanFormGroup.controls.planControl.status == "INVALID") {
      this.planError = 'Insats beskrivning måste vara minst 10 bokstäver';
    } if (name.length <2 || name[0].length<2 || name[1].length<2 ) {
      this.nameError = 'För och efternamn ska vara med. Minst två bokstäver i för och efternamn.';
    } if (this.createPlanFormGroup.controls.proControl.status == "INVALID") {
      this.proError = 'Profession måste vara minst två boksäver';
    }
    else {
      this.saveError = '';
      var event = {
        PersonID: parseInt(this.personID) ?? 0,
        Action: this.createPlanFormGroup.value.planControl.trim() ?? '0',
        Event: this.createPlanFormGroup.value.eventControl.trim() ?? '0',
        Responsible: this.createPlanFormGroup.value.nameControl.trim() ?? '0',
        Profession: this.createPlanFormGroup.value.proControl.trim() ?? '0',
      }
      this.isDirty = false;
      this.store.dispatch(new fromState.CreateEvent(event));
    }
  }
}
