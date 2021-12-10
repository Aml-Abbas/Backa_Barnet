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
  conversationMaterial$: Observable<ConversationMaterial[]> = new Observable<ConversationMaterial[]>();
  
  ConversationCards: ConversationCard[]= [];
  pcards: Promise<ConversationCard[]>= new Promise((resolve, reject) => { });

  searchCards: ConversationCard[]= [];
  personID: string;

  current_person$= new Observable<Person | null>();

  filterStatus: boolean= false;

  constructor(private store: Store<fromState.State>,
    private getSetService: GetSetService) {}

  ngOnInit(): void {
    this.current_person$ = this.store.select(fromState.getCurrentPerson);
    this.current_person$.subscribe(data=>{
      this.personID = data?.personID ?? '';
      this.pcards= this.getSetService.getConversationMaterial(this.personID);
    });
    let cards= this.ConversationCards;

    this.pcards.then(function (response) {
      
      response.forEach((card: ConversationCard)=>{
        cards.push(card);
    });
    });
    cards.forEach(element=>{
      this.ConversationCards.push(element);
    });
   }

  containsCard(date: string): boolean{
    var found= false;
    this.ConversationCards.forEach(element => {
      if(element.gradedOn== date){
        found= true;
      }      
    });
    return found;
  }

  applyFilter(event: Event) {
    this.searchCards=[];
    
    const filterValue = (event.target as HTMLInputElement).value.toLowerCase();
    if(filterValue!=''){
      this.filterStatus= true;
    }
    this.ConversationCards.forEach(card=>{
      if(card.id.toLowerCase().includes(filterValue) || card.gradedOn.toLowerCase().includes(filterValue)||
       card.status.toLowerCase().includes(filterValue)){
        this.searchCards.push(card);
      }
   });
  }

  moveToCard(card: ConversationCard){
    this.store.dispatch(new fromState.UpdateConversationCards(this.ConversationCards));

    this.store.dispatch(new fromState.UpdateCurrentConversationCard(card));
    this.store.dispatch(new fromRoot.Go({ path: ['/conversation-material', card.id] }));
  }

  moveToEditCard(card: ConversationCard){
    this.store.dispatch(new fromState.UpdateConversationCards(this.ConversationCards));

    this.store.dispatch(new fromState.UpdateCurrentConversationCard(card));
    this.store.dispatch(new fromRoot.Go({ path: ['/edit-conversation-material', card.id] }));
  }

}