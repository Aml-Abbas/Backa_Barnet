import { Component, OnInit } from '@angular/core';
import {MatTableDataSource} from '@angular/material/table';
import * as fromState from '../../state';
import { Store } from '@ngrx/store';
import * as fromRoot from '../../../app/state';
import { DiscoverCard } from 'src/app/models/DiscoverCard';
import { User } from 'src/app/models/User';
import { Card } from 'src/app/models/Card';
import { Observable } from 'rxjs';
import * as fromStore from 'src/app/state';

export interface QuestionText {
  id: number;
  text: string,
}

export interface PeriodicElement {
  id: number;
  date: string,
  type: string;
  status: string,
  by: string,
  organisation: string,
}

const ELEMENT_DATA: PeriodicElement[] = [
  {id: 1, type: 'Polisen 1', status:'inskickat' , date: '2021', by: 'polis 1', organisation: 'skolan'},
  {id: 2, type: 'Skolan',status:'inskickat', date: '2021', by: 'polis 1', organisation: 'skolan'},
  {id: 3, type: 'Socialtjänsten' ,status:'inskickat', date: '2021', by: 'polis 1', organisation: 'skolan'},
  {id: 4, type: 'Polisen 2',status:'inskickat', date: '2021', by: 'polis 1', organisation: 'skolan'},
];

const QuestionTextData: QuestionText[] = [
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

@Component({
  selector: 'app-discover-card',
  templateUrl: './discover-card.component.html',
  styleUrls: ['./discover-card.component.scss']
})
export class DiscoverCardComponent implements OnInit {
  displayedColumns: string[] = ['date', 'by', 'organisation','status'];
  dataSource = new MatTableDataSource(ELEMENT_DATA);
  discoverCards$: Observable<DiscoverCard[]> = new Observable<DiscoverCard[]>();
  current_user$: Observable<User| null> = new Observable<User| null>();
  cards: Card[]= [];

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }

  constructor(private store: Store<fromState.State>) { }

  ngOnInit(): void {
    this.current_user$ = this.store.select(fromState.getCurrentUser);
    this.current_user$.subscribe(data=>{
      this.store.dispatch(new fromStore.LoadDiscoverCard(String(data?.userID)));
    });
    
    this.discoverCards$ = this.store.select(fromState.getDiscoverCards);
    this.discoverCards$.subscribe(data=>{
     // if(containsCard())
    });
  }

  moveToCard(id: string){
    this.store.dispatch(new fromRoot.Go({ path: ['/discover-card', id] }));
  }
}
