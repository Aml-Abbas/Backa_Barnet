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
import { ConversationCard } from 'src/app/models/ConversationCard';
import { EstimateCard } from 'src/app/models/EstimateCard';
import { Card } from 'src/app/models/Card';
import { User } from 'src/app/models/User';

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

  ConversationCards: ConversationCard[]= [];
  pcards: Promise<ConversationCard[]>= new Promise((resolve, reject) => { });

  estimatecards: EstimateCard[]= [];
  ecards: Promise<EstimateCard[]>= new Promise((resolve, reject) => { });

  current_user$: Observable<User| null> = new Observable<User| null>();
  dcards: Promise<Card[]>= new Promise((resolve, reject) => { });

  constructor(private getSetService: GetSetService,
    private store: Store<fromState.State>,
    private eventService: EventService,
    private actions$: Actions) { }

  ngOnInit(): void {
    this.current_person$ = this.store.select(fromState.getCurrentPerson);
    this.current_person$.subscribe(data=>{
      this.personID = data?.personID ?? '';
      this.pcards= this.getSetService.getConversationMaterial(this.personID);
      this.ecards= this.getSetService.getEstimate(this.personID);
    });

    this.current_user$ = this.store.select(fromState.getCurrentUser);
    this.current_user$.subscribe(data => {
      let userID: string = data?.userID ?? '';       
       this.dcards= this.getSetService.getCards(userID);
    });

    this.events$= this.eventService.getEvent(this.personID);
    this.events$.subscribe(data=>{
      data.map((action: Event)=>{
        this.actions.push({title: 'Create insats', date: action.createdOn ,
        actionDescription: action.actionDescription, eventDescription: action.eventDescription,
        responsible: action.responsible, role: action.profession,
        actionId: action.actionID ,status: action.status});
      });
      this.actions= this.actions.sort((a, b) => (a.date < b.date ? -1 : 1));
    });

    let cards= this.actions;
    this.pcards.then(function (response) {
      
      response.forEach((card: ConversationCard)=>{
        cards.push({title: 'Create samtalsunderlag', date: card.gradedOn ,
        actionDescription: card.person_scores.toString(), eventDescription: card.person_comments.toString(),
        responsible: card.personID, role: card.personID,
        actionId: card.id ,status: card.status});
    });
    });

    cards.forEach(element=>{
      //this.ConversationCards.push(element);
      this.actions.push(element);
      this.actions= this.actions.sort((a, b) => (a.date < b.date ? -1 : 1));
      console.log(this.actions);
    });

    let estimatecards= this.actions;
    this.ecards.then(function (response) {
      
      response.forEach((card: EstimateCard)=>{
          estimatecards.push({title: 'Create skattning', date: card.gradedOn ,
          actionDescription: card.grades.toString(), eventDescription: card.grades.toString(),
          responsible: card.userName, role: card.userID,
          actionId: card.userID ,status: card.status});    
      });
    });

    estimatecards.forEach(element=>{
      //this.estimatecards.push(element);
      this.actions.push(element);

    });

    let discoverCards= this.actions;

    this.dcards.then(function (response) {
      
      response.forEach((card: Card)=>{
        discoverCards.push({title: 'Create upptäckarkort', date: card.gradedOn ,
        actionDescription: card.grades.toString(), eventDescription: card.grades.toString(),
        responsible: card.userName, role: card.userTitle,
        actionId: card.id ,status: card.status});
    });
    });
    discoverCards.forEach(element=>{
      this.actions.push(element);
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
