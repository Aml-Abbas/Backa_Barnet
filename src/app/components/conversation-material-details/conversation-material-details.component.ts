import { Component, OnInit } from '@angular/core';
import { ConversationCard } from 'src/app/models/ConversationCard';
import { Observable } from 'rxjs';
import * as fromState from '../../state';
import { Store } from '@ngrx/store';
import * as fromRoot from '../../../app/state';

@Component({
  selector: 'app-conversation-material-details',
  templateUrl: './conversation-material-details.component.html',
  styleUrls: ['./conversation-material-details.component.scss']
})
export class ConversationMaterialDetailsComponent implements OnInit {
  selected='2';
  current_conversation_card$= new Observable<ConversationCard | null>();
  conversationCard: ConversationCard;

  scores = [
    { area: "OMSORG", id: "care",class: "care-class", question:'Jag har någon som bryr sig om mig', 
    color: '#003686'},

    { area: "TRYGGHET", id: "security", class:'security-class', question:'Jag känner mig trygg', 
    color: '#353370'},

    { area: "MÅ BRA", id: "feel_good", class:'feel_good-class', question:'Jag mår bra', 
    color: '#e0448c'},

    { area: "FRITID", id: "free_time", class:'free_time-class', question:'Jag trivs med min fritid', 
    color: '#df2d5b'},

    { area: "TILLHÖRIGHET", id: "beloning", class:'beloning-class', question:'Jag får vara med', 
    color: '#eb612d'},

    { area: "ANSVARSTAGANDE", id: "responsibility", class:'responsibility-class', question:'Jag tar ansvar för mig själv och andra', 
    color: '#f79c2e'},

    { area: "RESPEKTERAS", id: "respekt", class:'respekt-class', question:'Jag känner mig respekterad', 
    color: '#4ba562'},

    { area: "UTVECKLAS", id: "develop", class:'develop-class', question:'Jag gör mitt bästa', 
    color: '#31acaf'}
  ];


  constructor(private store: Store<fromState.State>) { }

  ngOnInit(): void {
    this.current_conversation_card$ = this.store.select(fromState.getCurrentConversationCard);
    this.current_conversation_card$.subscribe(data=>{
      var oneGuardian= true;

      if(data?.guardian2_scores[0]==''){
        this.selected='1';
      }
      data?.guardian2_scores.forEach(element=>{
        if(element !='0'){
          oneGuardian= false;
        }
        if(!oneGuardian){
          this.selected= '2';
        }
      }); 
    });
  }

  moveToEditCard(card: ConversationCard){
    this.store.dispatch(new fromState.UpdateCurrentConversationCard(card));
    this.store.dispatch(new fromRoot.Go({ path: ['/edit-conversation-material', card.id] }));
  }

}
