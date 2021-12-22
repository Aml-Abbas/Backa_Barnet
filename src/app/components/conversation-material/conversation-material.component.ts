import { Component, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import * as fromRoot from '../../../app/state';
import { ConversationMaterial } from 'src/app/models/ConversationMaterial';
import { Observable } from 'rxjs';
import { ConversationCard } from 'src/app/models/ConversationCard';
import { Person } from 'src/app/models/Person';
import { GetSetService } from '../../services/get-set/get-set.service';

@Component({
  selector: 'app-conversation-material',
  templateUrl: './conversation-material.component.html',
  styleUrls: ['./conversation-material.component.scss']
})
export class ConversationMaterialComponent implements OnInit {

  pcards: Promise<ConversationCard[]> = new Promise((resolve, reject) => { });
  ConversationCards: ConversationCard[] = [];
  searchCards: ConversationCard[] = [];

  current_person$ = new Observable<Person | null>();

  // keep track about the search input 
  filterStatus: boolean = false;

  constructor(private store: Store<fromState.State>,
    private getSetService: GetSetService) { }

  ngOnInit(): void {

    // get the choosen child and user its personId to get the samtalsunderlag for the child
    this.current_person$ = this.store.select(fromState.getCurrentPerson);
    this.current_person$.subscribe(data => {
      var personID = data?.personID ?? '';
      this.pcards = this.getSetService.getConversationMaterial(personID);
    });
    let cards = this.ConversationCards;

    this.pcards.then(function (response) {

      response.forEach((card: ConversationCard) => {
        cards.push(card);
      });
    });
    cards.forEach(element => {
      this.ConversationCards.push(element);
    });
  }

  // this function is called when the user writes something in the search input
  // the function searches for a match samtalsunderlag in the samtalsunderlag list and display it in the samtalsunderlag list
  applyFilter(event: Event) {
    this.searchCards = [];

    const filterValue = (event.target as HTMLInputElement).value.toLowerCase();
    if (filterValue != '') {
      this.filterStatus = true;
    }
    this.ConversationCards.forEach(card => {
      if (card.id.toLowerCase().includes(filterValue) || card.gradedOn.toLowerCase().includes(filterValue) ||
        card.status.toLowerCase().includes(filterValue)) {
        this.searchCards.push(card);
      }
    });
  }

  // this function is called when clicking on a row from the list 
  // update the samtalsunderlag and then update the choosen samtalsunderlag 
  // move to the samtalsunderlag's detail page

  moveToCard(card: ConversationCard) {
    this.store.dispatch(new fromState.UpdateConversationCards(this.ConversationCards));

    this.store.dispatch(new fromState.UpdateCurrentConversationCard(card));
    this.store.dispatch(new fromRoot.Go({ path: ['/conversation-material', card.gradedOn] }));
  }

  // this function is called when clicking in the edit button 
  // update the samtalsunderlag and then update the choosen samtalsunderlag 
  // move to the edit samtalsunderlag page

  moveToEditCard(card: ConversationCard) {
    this.store.dispatch(new fromState.UpdateConversationCards(this.ConversationCards));

    this.store.dispatch(new fromState.UpdateCurrentConversationCard(card));
    this.store.dispatch(new fromRoot.Go({ path: ['/edit-conversation-material', card.gradedOn] }));
  }

}