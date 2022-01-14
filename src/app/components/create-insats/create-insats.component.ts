import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { Person } from 'src/app/models/Person';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ComponentCanDeactivate } from 'src/app/interfaces/component-can-deactivate';
import { Status } from 'src/app/models/Status';
import { Event } from 'src/app/models/Event';
import { EventService } from 'src/app/services/event/event.service';

@Component({
  selector: 'app-create-insats',
  templateUrl: './create-insats.component.html',
  styleUrls: ['./create-insats.component.scss']
})
export class CreateInsatsComponent implements OnInit, ComponentCanDeactivate {
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

  pevents: Promise<Event[]> = new Promise((resolve, reject) => { });
  events: Event[] = [];

  eventID = '-1';
  eventDescription = '-1';

  constructor(private _formBuilder: FormBuilder,
    private store: Store<fromState.State>,
    private eventService: EventService) { }

  ngOnInit(): void {
    this.createPlanFormGroup = this._formBuilder.group({
      nameControl: ['', [Validators.required, Validators.minLength(2)]],
      proControl: ['', [Validators.required, Validators.minLength(2)]],
      planControl: ['', [Validators.required, Validators.minLength(10)]],
    });

    // get the choosen child
    this.current_person$ = this.store.select(fromState.getCurrentPerson);
    this.current_person$.subscribe(data => {
      this.personID = data?.personID ?? '';
    });

    // get the created events for the choosen child 
    this.pevents = this.eventService.getEvent(this.personID);
    let cards = this.events;

    this.pevents.then(function (response) {
      response.forEach((event: Event) => {
        cards.push(event);
      });
    });
    cards.forEach(element => {
      this.events.push(element);
    });

  }

  // to be called when the user choose an event from the event list
  changeEvent(eventId: string, eventDes: string) {
    this.isDirty = true;
    this.eventID = eventId;
    this.eventDescription = eventDes;
  }

  // to be called when clicking on create button to create the insats
  save() {
    this.saveError = '';
    this.eventError = '';
    this.planError = '';
    this.nameError = '';
    this.proError = '';

    var name = this.createPlanFormGroup.value.nameControl.trim().split(' ');

    // check for errors before send the request
    if (this.createPlanFormGroup.status == "INVALID") {
      this.saveError = 'Du har missat att fylla i saker';
    } if (this.eventID == '-1') {
      this.eventError = 'Händelse måste väljas';
      this.saveError = 'Du har missat att fylla i saker';
    } if (this.createPlanFormGroup.controls.planControl.status == "INVALID") {
      this.planError = 'Insatsbeskrivningen måste vara minst 10 bokstäver';
    } if (name.length < 2 || name[0].length < 2 || name[1].length < 2) {
      this.nameError = 'För och efternamn ska vara med. Minst två bokstäver i för och efternamn.';
      this.saveError = 'Du har missat att fylla i saker';
    } if (this.createPlanFormGroup.controls.proControl.status == "INVALID") {
      this.proError = 'Profession måste vara minst två boksäver';
    }
    if (this.saveError == '') {
      // no error, send the CreateAction action to create the insats with a json variable to be used in the request later
      var action = {
        PersonID: parseInt(this.personID) ?? 0,
        Action: this.createPlanFormGroup.value.planControl.trim() ?? '0',
        EventID: this.eventID ?? 0,
        Responsible: this.createPlanFormGroup.value.nameControl.trim() ?? '0',
        Profession: this.createPlanFormGroup.value.proControl.trim() ?? '0',
      }
      this.isDirty = false;
      this.store.dispatch(new fromState.CreateAction(action));
    }
  }

}
