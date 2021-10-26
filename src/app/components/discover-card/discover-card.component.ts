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
import { ContactGuardianService } from 'src/app/services/contact-guardian/contact-guardian.service';


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
  {id: 11, type: 'Polisen 1',status:'inskickat', date: '2021', by: 'polis 1', organisation: 'skolan'},
  {id: 12, type: 'Skolan',status:'sparat', date: '2021', by: 'polis 1', organisation: 'skolan'},
  {id: 13, type: 'Socialtjänsten',status:'inskickat', date: '2021', by: 'polis 1', organisation: 'skolan'},
  {id: 14, type: 'Polisen 2',status:'inskickat', date: '2021', by: 'polis 1', organisation: 'skolan'},
  {id: 10, type: 'Polisen 1',status:'sparat', date: '2021', by: 'polis 1', organisation: 'skolan'},
  {id: 20, type: 'Skolan',status:'sparat', date: '2021', by: 'polis 1', organisation: 'skolan'},
  {id: 30, type: 'Socialtjänsten',status:'sparat', date: '2021', by: 'polis 1', organisation: 'skolan'},
  {id: 40, type: 'Polisen 2',status:'inskickat', date: '2021', by: 'polis 1', organisation: 'skolan'},
  {id: 16, type: 'Polisen 1',status:'sparat', date: '2021', by: 'polis 1', organisation: 'skolan'},
  {id: 22, type: 'Skolan',status:'inskickat', date: '2021', by: 'polis 1', organisation: 'skolan'},
  {id: 33, type: 'Socialtjänsten',status:'sparat', date: '2021', by: 'polis 1', organisation: 'skolan'},
  {id: 44, type: 'Polisen 2',status:'sparat', date: '2021', by: 'polis 1', organisation: 'skolan'},
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
