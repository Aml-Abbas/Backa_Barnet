import { Component, OnInit } from '@angular/core';
import { Card } from 'src/app/models/Card';
import { Observable } from 'rxjs';
import * as fromState from '../../state';
import { Store } from '@ngrx/store';

@Component({
  selector: 'app-edit-discover-card',
  templateUrl: './edit-discover-card.component.html',
  styleUrls: ['./edit-discover-card.component.scss']
})
export class EditDiscoverCardComponent implements OnInit {
  current_card$= new Observable<Card | null>();
  card: Card;

  constructor(private store: Store<fromState.State>) { }

  ngOnInit(): void {
    this.current_card$ = this.store.select(fromState.getCurrentCard);

  }

}
