import { Component, OnInit } from '@angular/core';
import { Card } from 'src/app/models/Card';
import { Observable } from 'rxjs';
import * as fromState from '../../state';
import { Store } from '@ngrx/store';
import * as fromRoot from '../../../app/state';

export interface QuestionText {
  id: number;
  text: string,
  category: string,
  color: string,
}

@Component({
  selector: 'app-discover-card-details',
  templateUrl: './discover-card-details.component.html',
  styleUrls: ['./discover-card-details.component.scss']
})
export class DiscoverCardDetailsComponent implements OnInit {
  current_card$= new Observable<Card | null>();
  card: Card;

  QuestionTextData: QuestionText[] = [
    {id: 40, text: 'Barnet har vuxna i sin närhet som hen kan lita på och vända sig till', category:'OMSORG', color: '#003686'},
    {id: 41, text: 'Barnet skyddas från sådant som kan skada hen i och utanför hemmet', category:'TRYGGHET', color: '#353370'},
    {id: 42, text: 'Barnet har hälsosamma matvanor, god hygien och ett liv fritt från tobak, alkohol och narkotika', category:'MÅR BRA', color: '#e0448c'},
    {id: 43, text: 'Barnet har fritidsintresse med delaktighet från vårdnadshavare eller annan trygg person i dess närhet', category:'FRITID', color: '#df2d5b'},
    {id: 44, text: 'Barnet känner tillhörighet och uppskattning av personer som barnet möter i sin vardag', category:'TILLHÖRIGHET', color: '#eb612d'},
    {id: 45, text: 'Barnet förstår vad som förväntas av hen i sin vardag, visar hänsyn och omtanke inför andra och följer givna regler', category:'ANSVARSTAGANDE', color: '#f79c2e'},
    {id: 46, text: 'Barnet känner sig sedd, hörd och bekräftad av viktiga personer i sin vardag', category:'RESPEKTERAS', color: '#4ba562'},
    {id: 47, text: 'Barnet utvecklas i fas med sin ålder och har förmågor att klara av det vardagliga livet', category:'UTVECKLAS', color: '#31acaf'},
    {id: 48, text: 'Åtgärder har vidtagits inom egen organisation', category:'', color: ''},
    {id: 49, text: 'Vårdnadshavare är informerad om att upptäckarkort upprättats', category:'', color: ''},
    {id: 50, text: 'Vårdnadshavare har gett samtycke till att information gällande upptäckten delas mellan upptäckare och barnkontakt', category:'', color: ''},
  ];
  
  constructor(private store: Store<fromState.State>) { }

  ngOnInit(): void {
    this.current_card$ = this.store.select(fromState.getCurrentCard);
    this.current_card$.subscribe(data=>{
      console.log(data?.questions[5]);
      console.log(data?.comments[5]);
      console.log(data?.grades[5]);

    });
  }
  moveToEditCard(card: Card){
    this.store.dispatch(new fromRoot.Go({ path: ['/edit-discover-card', card.id] }));
  }

}
