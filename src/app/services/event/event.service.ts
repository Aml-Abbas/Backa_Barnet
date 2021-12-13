import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { Event } from 'src/app/models/Event';
import axios from 'axios';
import { GetSetService } from '../../services/get-set/get-set.service';
import { ConversationCard } from 'src/app/models/ConversationCard';
import { EstimateCard } from 'src/app/models/EstimateCard';
import { Card } from 'src/app/models/Card';
import { Contact } from 'src/app/models/Contact';

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

@Injectable({
  providedIn: 'root'
})
export class EventService {

  constructor(private http: HttpClient,
    private getSetService: GetSetService) { }

  createEvent(eventJson: any) {
    return this.http.post('https://func-ykbb.azurewebsites.net/api/event/create?code=zH/btVHzaGqpESkmr3SCic2B4CBLIvGRTXaJu7z/vVsYDb1t1Mw61Q==', eventJson);
  }

  createAction(actionJson: any) {
    return this.http.post('https://func-ykbb.azurewebsites.net/api/action/create?code=/X7EgM0p15bhLjN7N6zMYERR4aWR9dOHBVBr7wT6HaZv3dsDVsJ6DQ==', actionJson);
  }

  editAction(actionIdJson: any) {
      return this.http.post('https://func-ykbb.azurewebsites.net/api/action/edit?code=2Td4p/VoekRtnBV5wXMDu8NnZOaXIrBWXPat1f7S6vOpORkGT7HRag==', actionIdJson);
    }

   getEvent(personId: string): Observable<Event[]> {
    return this.http.get<Event[]>('https://func-ykbb.azurewebsites.net/api/event/'+personId+'?code=4BSzbYC1YIm9Qxgocsd1A/Z9dwyuHw1SiGNRVEhIFD3LxbaoLAKV1g==');
  }
  
  async getAllEvents(personId: string, userId: string): Promise<Action[]> {

   var actions: Action[] = [];
   var pcards= this.getSetService.getConversationMaterial(personId);
   var ecards= this.getSetService.getEstimate(personId);
   var events$= this.getEvent(personId);
   var dcards= this.getSetService.getCards(userId);

    await axios.get('https://func-ykbb.azurewebsites.net/api/card/'+userId+'?code=bbdIBAbikn/AMydOBvxm69FyKFhRfS4fxUb55SaSz0TfK/cjnxiYEw==')
    .then(function (response) {
      events$.subscribe(data=>{
        data.map((action: Event)=>{
          actions.push({title: 'Create insats', date: action.createdOn ,
          actionDescription: action.actionDescription, eventDescription: action.eventDescription,
          responsible: action.responsible, role: action.profession,
          actionId: action.actionID ,status: action.status});
        });
      });

      let cards= actions;
      pcards.then(function (response) {
        
        response.forEach((card: ConversationCard)=>{
          cards.push({title: 'Create samtalsunderlag', date: card.gradedOn ,
          actionDescription: card.person_scores.toString(), eventDescription: card.person_comments.toString(),
          responsible: 'Aml Abbas', role: 'Barnkontakt',
          actionId: card.id ,status: card.status});
      });
      });
  
      cards.forEach(element=>{
        actions.push(element);
      });
  
      let estimatecards= actions;
      ecards.then(function (response) {
        
        response.forEach((card: EstimateCard)=>{
            estimatecards.push({title: 'Create skattning', date: card.gradedOn ,
            actionDescription: card.grades.toString(), eventDescription: card.grades.toString(),
            responsible: card.userName, role: card.userID,
            actionId: card.userID ,status: card.status});    
        });
      });
  
      estimatecards.forEach(element=>{
        actions.push(element);
  
      });
  
      let discoverCards= actions;
  
      dcards.then(function (response) {
        
        response.forEach((card: Card)=>{
          discoverCards.push({title: 'Create upptäckarkort', date: card.gradedOn ,
          actionDescription: card.grades.toString(), eventDescription: card.grades.toString(),
          responsible: card.userName, role: card.userTitle,
          actionId: card.id ,status: card.status});
      });
      });
      discoverCards.forEach(element=>{
        actions.push(element);
      });
    })
    .catch(function (error) {
      console.log(error);
    })
    .then(function () {
    });
     return actions.sort((a,b) => compare(a, b));
  }

}
function compare(a: Action, b: Action): number {
  if (a.date<b.date) {
    return -1;
  }
  if (a.date > b.date) {
    return 1;
  }
  return 0;
}

