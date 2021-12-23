import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import { Event } from 'src/app/models/Event';
import axios from 'axios';
import { GetSetService } from '../../services/get-set/get-set.service';
import { ConversationCard } from 'src/app/models/ConversationCard';
import { EstimateCard } from 'src/app/models/EstimateCard';
import { Card } from 'src/app/models/Card';
import { Action } from 'src/app/models/Action';


@Injectable({
  providedIn: 'root'
})

/* This service class is used to send all the http request which is used in the event page */
export class EventService {

  constructor(private http: HttpClient,
    private getSetService: GetSetService,
    private store: Store<fromState.State>) { }

  // create a new event
  createEvent(eventJson: any) {
    return this.http.post('https://func-ykbb.azurewebsites.net/api/event/create?code=zH/btVHzaGqpESkmr3SCic2B4CBLIvGRTXaJu7z/vVsYDb1t1Mw61Q==', eventJson);
  }

  // create a new action or insats
  createAction(actionJson: any) {
    return this.http.post('https://func-ykbb.azurewebsites.net/api/action/create?code=/X7EgM0p15bhLjN7N6zMYERR4aWR9dOHBVBr7wT6HaZv3dsDVsJ6DQ==', actionJson);
  }

  // lock the insats (change the status of the insats from "spara" to "locked")
  editAction(actionIdJson: any) {
    return this.http.post('https://func-ykbb.azurewebsites.net/api/action/edit?code=2Td4p/VoekRtnBV5wXMDu8NnZOaXIrBWXPat1f7S6vOpORkGT7HRag==', actionIdJson);
  }

  // get a list of all events created for a specific child to be choosen when creating a new instas for the child
  async getEvent(personId: string): Promise<Event[]> {
    var events: Event[] = [];
    await axios.get('https://func-ykbb.azurewebsites.net/api/event/' + personId + '?code=4BSzbYC1YIm9Qxgocsd1A/Z9dwyuHw1SiGNRVEhIFD3LxbaoLAKV1g==')
      .then(function (response) {
        response.data.forEach((event: Event) => {
          if (!containsEvent(events, event)) {
            events.push(event);
          }
        })
      })
      .catch(function (error) {
        console.log(error);
      })
      .then(function () {
      });
    return events;

  }

  // get a list of all events and actions "insats" which is created for a specific child
  async getEvents(personId: string): Promise<Event[]> {
    var events: Event[] = [];
    await axios.get('https://func-ykbb.azurewebsites.net/api/event/' + personId + '?code=4BSzbYC1YIm9Qxgocsd1A/Z9dwyuHw1SiGNRVEhIFD3LxbaoLAKV1g==')
      .then(function (response) {
        response.data.forEach((event: Event) => {
          events.push(event);
        })
      })
      .catch(function (error) {
        console.log(error);
      })
      .then(function () {
      });
    return events;

  }

  // get a list of all events for a specific child discover card, estimates, samtals underlag and actions to be shown in the timeline
  async getAllEvents(personId: string, userId: string): Promise<Action[]> {
    var actions: Action[] = [];
    var pcards = this.getSetService.getConversationMaterial(personId);
    var ecards = this.getSetService.getEstimate(personId);
    var events: Promise<Event[]> = this.getEvents(personId);
    var dcards = this.getSetService.getCardsPerson(personId, userId);
    var conversation: ConversationCard[] = [];
    var discover: Card[] = [];


    await axios.get('https://func-ykbb.azurewebsites.net/api/card/' + userId + '?code=bbdIBAbikn/AMydOBvxm69FyKFhRfS4fxUb55SaSz0TfK/cjnxiYEw==')
      .then(function (response) {

        let eventsCard = actions;

        events.then(function (response) {
          response.forEach((action: Event) => {
            eventsCard.push({
              title: 'Insats', date: action.createdOn,
              description: ['Insatsbeskrivning: ' + action.eventDescription,
              'Händelsebeskrivning: ' + action.actionDescription],
              responsible: action.responsible, role: action.profession,
              id: action.actionID, status: action.status
            });
          });
        });

        eventsCard.forEach(element => {
          actions.push(element);
        });

        let cards = actions;
        let conversationCards = conversation;

        pcards.then(function (response) {

          response.forEach((card: ConversationCard) => {
            cards.push({
              title: 'Samtalsunderlag', date: card.gradedOn,
              description: ['Ett samtalsunderlag har skapats för barnet'],
              responsible: card.userName, role: card.userRole,
              id: card.id, status: card.status
            });
            conversationCards.push(card);
          });
        });

        cards.forEach(element => {
          actions.push(element);
        });
        conversationCards.forEach(element => {
          conversation.push(element);
        });

        let estimatecards = actions;
        ecards.then(function (response) {

          response.forEach((card: EstimateCard) => {
            estimatecards.push({
              title: 'Skattning', date: card.gradedOn,
              description: ['En skattning har skapats för barnet'],
              responsible: card.userName, role: card.userRole,
              id: card.userID, status: card.status
            });
          });
        });

        estimatecards.forEach(element => {
          actions.push(element);

        });

        let discoverCards = actions;
        let discoverCardsToUpdate = discover;

        dcards.then(function (response) {

          response.forEach((card: Card) => {
            discoverCards.push({
              title: 'Upptäckarkort', date: card.gradedOn,
              description: ['Ett upptäckarkort har skapats för barnet'],
              responsible: card.userName, role: card.userTitle,
              id: card.id, status: card.status
            });
            discoverCardsToUpdate.push(card);
          });
        });

        discoverCards.forEach(element => {
          actions.push(element);
        });
        discoverCardsToUpdate.forEach(element => {
          discover.push(element);
        });

      })
      .catch(function (error) {
        console.log(error);
      })
      .then(function () {
      });

    this.store.dispatch(new fromState.UpdateConversationCards(conversation));
    this.store.dispatch(new fromState.UpdateCards(discover));

    return actions.sort((a, b) => compare(a, b));
  }

}

//sort the events to show them in the timeline
function compare(a: Action, b: Action): number {
  if (a.date < b.date) {
    return -1;
  }
  if (a.date > b.date) {
    return 1;
  }
  return 0;
}

// check if the list contains the event before adding it twice
function containsEvent(events: Event[], event: Event): boolean {
  var found = false;
  events.forEach(element => {
    if (element.eventID == event.eventID) {
      found = true;
    }
  });
  return found;
}

