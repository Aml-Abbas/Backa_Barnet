import { Component, OnInit } from '@angular/core';
import { DiscoverCard } from 'src/app/models/DiscoverCard';
import { Card } from 'src/app/models/Card';
import { Observable } from 'rxjs';
import * as fromState from '../../state';
import { Store } from '@ngrx/store';
import * as fromRoot from '../../../app/state';

export interface QuestionText {
  id: number;
  text: string,
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
    {id: 40, text: 'Barnet har vuxna i sin närhet som hen kan lita på och vända sig till'},
    {id: 41, text: 'Barnet skyddas från sådant som kan skada hen i och utanför hemmet'},
    {id: 42, text: 'Barnet har hälsosamma matvanor, god hygien och ett liv fritt från tobak, alkohol och narkotika'},
    {id: 43, text: 'Barnet har fritidsintresse med delaktighet från vårdnadshavare eller annan trygg person i dess närhet'},
    {id: 44, text: 'Barnet känner tillhörighet och uppskattning av personer som barnet möter i sin vardag'},
    {id: 45, text: 'Barnet förstår vad som förväntas av det i sin vardag, visar hänsyn och omtanke inför andra och följer givna regler'},
    {id: 46, text: 'Barnet känner sig sedd, hörd och bekräftad av viktiga personer i sin vardag'},
    {id: 47, text: 'Barnet utvecklas i fas med sin ålder och har förmågor att klara av det vardagliga livet'},
    {id: 48, text: 'Åtgärder har vidtagits inom egen organisation'},
    {id: 49, text: 'Vårdnadshavare är informerad om att upptäckarkort upprättats'},
    {id: 50, text: 'Vårdnadshavare har gett samtycke till att information gällande upptäckten delas mellan upptäckare och barnkontakt'},
  ];
  
  constructor(private store: Store<fromState.State>) { }

  ngOnInit(): void {
    this.current_card$ = this.store.select(fromState.getCurrentCard);
/*     this.current_card$.subscribe(data=>{
      this.card= new Card(data?.id, data?.gradedOn, data?.userName, data?.userOrg, data?.userTitle,
        data?.personName, data?.personNbr, data?.guardian1, data?.guardianPersonNbr1, data?.guardian2,
        data?.guardianPersonNbr2, data?.healthTeam, data?.situation, data?.questions,
        data?.grades, data?.comments);
    }); */

  }

  islessthan(i: number): boolean{
    return true;
  }
}
