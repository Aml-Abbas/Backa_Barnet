import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { Person } from 'src/app/models/Person';
import * as fromRoot from '../../state';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import { GetSetService } from '../../services/get-set/get-set.service';
import { Event } from 'src/app/models/Event';
import { EventService } from 'src/app/services/event/event.service';
import {Actions, ofType} from '@ngrx/effects';
import * as eventAction from '../../state/actions/event.action';
import { tap } from 'rxjs/operators';

export interface Action {
  title: string;
  date: string;
  actionDescription: string;
  eventDescription: string;
  responsible: string;
  role:string;
  actionId: string;
  status:string;
}

@Component({
  selector: 'app-event',
  templateUrl: './event.component.html',
  styleUrls: ['./event.component.scss']
})
export class EventComponent implements OnInit {

  actions: Action[] = [];
  
  current_person$= new Observable<Person | null>();
  events$: Observable<Event[]> = new Observable<Event[]>();
  personID:string;

  constructor(private getSetService: GetSetService,
    private store: Store<fromState.State>,
    private eventService: EventService,
    private actions$: Actions) { }

  ngOnInit(): void {
    this.current_person$ = this.store.select(fromState.getCurrentPerson);
    this.current_person$.subscribe(data=>{
      this.personID = data?.personID ?? '';
    });

    this.events$= this.eventService.getEvent(this.personID);
    this.events$.subscribe(data=>{
      data.map((action: Event)=>{
        this.actions.push({title: 'Create insats', date: action.createdOn ,
        actionDescription: action.actionDescription, eventDescription: action.eventDescription,
        responsible: action.responsible, role: action.profession,
        actionId: action.actionID ,status: action.status});
      });
    });

    this.actions$.pipe(
      ofType(eventAction.UPDATE_EVENT_SUCCESS),
      tap(() => {
        window.location.reload()
      })
    ).subscribe();

  }

  endAction(action: Action){
    var actionID = {
      ActionID : parseInt(action.actionId) ?? 0,
    }
   this.store.dispatch(new fromState.UpdateEvent(actionID));

    }
}
