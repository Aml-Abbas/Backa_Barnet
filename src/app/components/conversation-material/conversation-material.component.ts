import { Component, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import * as fromRoot from '../../../app/state';
import { ConversationMaterial } from 'src/app/models/ConversationMaterial';
import { Observable } from 'rxjs';
import { ConversationCard } from 'src/app/models/ConversationCard';
import { Person } from 'src/app/models/Person';

@Component({
  selector: 'app-conversation-material',
  templateUrl: './conversation-material.component.html',
  styleUrls: ['./conversation-material.component.scss']
})
export class ConversationMaterialComponent implements OnInit {
  conversationMaterial$: Observable<ConversationMaterial[]> = new Observable<ConversationMaterial[]>();
  
  ConversationCards: ConversationCard[]= [];
  questionsID: string []= [];
  grades: string[]= [];
  comments: string[]= [];
  grades1: string[]= [];
  comments1: string[]= [];
  grades2: string[]= [];
  comments2: string[]= [];

  searchCards: ConversationCard[]= [];
  personID: string;

  current_person$= new Observable<Person | null>();

  constructor(private store: Store<fromState.State>) {}

  ngOnInit(): void {
    this.current_person$ = this.store.select(fromState.getCurrentPerson);
    this.current_person$.subscribe(data=>{
      this.personID = data?.personID ?? '';
    });
    this.store.dispatch(new fromState.LoadConversationMaterial(this.personID));

    this.conversationMaterial$ = this.store.select(fromState.getConversationMaterial);
    this.conversationMaterial$.subscribe(data=>{
      var index=1;
      data.map((conversationMaterial: ConversationMaterial)=>{
        let questionID= conversationMaterial.questionID;
        let personID= conversationMaterial.personID;

        let grade= conversationMaterial.grade;

        let comment= '';
        if(conversationMaterial.comment!='0'){
          comment= conversationMaterial.comment;
        }
        let grade1= conversationMaterial.grade1;

        let comment1= '';
        if(conversationMaterial.comment1!='0'){
          comment1= conversationMaterial.comment1;
        }
        let grade2= conversationMaterial.grade2;
        let comment2= '';
        if(conversationMaterial.comment2!='0'){
          comment2= conversationMaterial.comment2;
        }

        let gradedOn= conversationMaterial.gradedOn;
        let status= conversationMaterial.status;


        if(!this.containsCard(conversationMaterial.gradedOn)){
         this.questionsID.push(questionID);
         this.grades.push(grade);
         this.comments.push(comment);

         this.grades1.push(grade1);
         this.comments1.push(comment1);
         this.grades2.push(grade2);
         this.comments2.push(comment2);

          this.ConversationCards.push(new ConversationCard(String(index), personID, this.questionsID, this.grades, this.comments,
            this.grades1, this.comments1, this.grades2, this.comments2, gradedOn, status));
            this.questionsID= [];

            this.grades= [];
            this.comments= [];
            this.grades1= [];
            this.comments1= [];
            this.grades2= [];
            this.comments2= [];

            index++;
          }else{
            this.ConversationCards.forEach(element => {
              if(element.gradedOn== gradedOn && !this.containsQuestion(element, questionID)){
                element.questionsID.push(questionID);
                element.person_scores.push(grade);
                element.person_comments.push(comment);
                element.guardian1_scores.push(grade1);
                element.guardian1_comments.push(comment1);
                element.guardian2_scores.push(grade2);
                element.guardian2_comments.push(comment2);

              }      
            });
        }
      })
        });
        this.store.dispatch(new fromState.UpdateConversationCardsSuccess(this.ConversationCards));

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

  containsQuestion(card: ConversationCard, questionId: string): boolean{
    var found= false;

    card.questionsID.forEach(question => {
      if(question== questionId){
        found= true;
      }      
    });
    return found;
  }

  applyFilter(event: Event) {
    this.searchCards=[];
    
    const filterValue = (event.target as HTMLInputElement).value;
    console.log(this.searchCards);
    this.ConversationCards.forEach(card=>{
      if(card.id.includes(filterValue) || card.gradedOn.includes(filterValue)|| card.status.includes(filterValue)){
        this.searchCards.push(card);
      }
   });
  }

  moveToCard(card: ConversationCard){
    this.store.dispatch(new fromState.UpdateCurrentConversationCard(card));
    this.store.dispatch(new fromRoot.Go({ path: ['/conversation-material', card.id] }));
  }

  moveToEditCard(card: ConversationCard){
    this.store.dispatch(new fromState.UpdateCurrentConversationCard(card));
    this.store.dispatch(new fromRoot.Go({ path: ['/edit-conversation-material', card.id] }));
  }

}