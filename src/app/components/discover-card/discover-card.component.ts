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

  current_user$: Observable<User | null> = new Observable<User | null>();

  pcards: Promise<Card[]> = new Promise((resolve, reject) => { });
  cards: Card[] = [];
  searchCards: Card[] = [];

  filterStatus: boolean = false;

  constructor(private store: Store<fromState.State>,
    private getSetService: GetSetService) { }

  ngOnInit(): void {

    //get the current user
    this.current_user$ = this.store.select(fromState.getCurrentUser);
    this.current_user$.subscribe(data => {
      let userID: string = data?.userID ?? '';
      this.pcards = this.getSetService.getCardsUser(userID);
    });
    let cards = this.cards;
    this.pcards.then(function (response) {
      response.forEach((card: Card) => {
        cards.push(card);
      });
    });
    cards.forEach(element => {
      this.cards.push(element);
    });

  }

  // this function is called when clicking on a row from the list 
  // update the cards and then update the choosen card 
  // move to the card's detail page
  moveToCard(card: Card) {
    this.store.dispatch(new fromState.UpdateCards(this.cards));

    this.store.dispatch(new fromState.UpdateCard(card));
    this.store.dispatch(new fromRoot.Go({ path: ['/discover-card', card.gradedOn] }));
  }

  // this function is called when clicking in the edit button 
  // update the cards and then update the choosen card 
  // move to the edit card page
  moveToEditCard(card: Card) {
    this.store.dispatch(new fromState.UpdateCards(this.cards));

    this.store.dispatch(new fromState.UpdateCard(card));
    this.store.dispatch(new fromRoot.Go({ path: ['/edit-discover-card', card.gradedOn] }));
  }

  // this function is called when the user writes something in the search input
  // the function searches for a match card in the cards list and display it in the cards list
  applyFilter(event: Event) {
    this.searchCards = [];

    const filterValue = (event.target as HTMLInputElement).value.toLowerCase();
    if (filterValue != '') {
      this.filterStatus = true;
    }
    this.cards.forEach(card => {
      if (card.personName.toLowerCase().includes(filterValue) || card.userName.toLowerCase().includes(filterValue) ||
        card.status.toLowerCase().includes(filterValue) || card.gradedOn.toLowerCase().includes(filterValue)) {
        this.searchCards.push(card);
      }
    });
  }
}