import { Component, OnInit } from '@angular/core';
import * as fromState from '../../state';
import { Store } from '@ngrx/store';
import * as fromRoot from '../../../app/state';
import { User } from 'src/app/models/User';
import { Card } from 'src/app/models/Card';
import { Observable } from 'rxjs';
import { GetSetService } from '../../services/get-set/get-set.service';

@Component({
  selector: 'app-discover-card',
  templateUrl: './discover-card.component.html',
  styleUrls: ['./discover-card.component.scss']
})
export class DiscoverCardComponent implements OnInit {
  discoverCards$: Observable<Card[]> = new Observable<Card[]>();
  current_user$: Observable<User| null> = new Observable<User| null>();
  pcards: Promise<Card[]>= new Promise((resolve, reject) => { });
  searchCards: Card[]= [];
  cards : Card[]= [];

  constructor(private store: Store<fromState.State>,
    private getSetService: GetSetService) {}

  ngOnInit(): void {
    this.current_user$ = this.store.select(fromState.getCurrentUser);
    this.current_user$.subscribe(data => {
      let userID: string = data?.userID ?? '';       
       this.pcards= this.getSetService.getCards(userID);
    });
    let cards= this.cards;

    this.pcards.then(function (response) {
      
      response.forEach((card: Card)=>{
        cards.push(card);
    });
    });
    cards.forEach(element=>{
      this.cards.push(element);
    });
    
      }

  moveToCard(card: Card){
    this.store.dispatch(new fromState.UpdateCards(this.cards));

    this.store.dispatch(new fromState.UpdateCard(card));
    this.store.dispatch(new fromRoot.Go({ path: ['/discover-card', card.id] }));
  }

  moveToEditCard(card: Card){
    this.store.dispatch(new fromState.UpdateCards(this.cards));

    this.store.dispatch(new fromState.UpdateCard(card));
    this.store.dispatch(new fromRoot.Go({ path: ['/edit-discover-card', card.id] }));
  }

  applyFilter(event: Event) {
    this.searchCards=[];
    
    const filterValue = (event.target as HTMLInputElement).value;
    console.log(this.searchCards);
    this.cards.forEach(card=>{
      if(card.personName.includes(filterValue) || card.userName.includes(filterValue)|| card.status.includes(filterValue)|| card.gradedOn.includes(filterValue)){
        this.searchCards.push(card);
      }
   });
  }
}