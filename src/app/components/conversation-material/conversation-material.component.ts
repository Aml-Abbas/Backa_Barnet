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
        console.log('adding1 '+ card);
        cards.push(card);
    });
    });
    cards.forEach(element=>{
      console.log('adding '+ element);
      this.ConversationCards.push(element);
    });

/*     this.store.dispatch(new fromState.LoadConversationMaterial(this.personID));

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
        
        let gradeType= conversationMaterial.gradeType;
        let gradedOn= conversationMaterial.gradedOn;
        let status= conversationMaterial.status;


        if(!this.containsCard(conversationMaterial.gradedOn)){
         this.questionsID.push(questionID);
         if(gradeType=='Guardian2'){
          this.grades2.push(grade);
          this.comments2.push(comment);
         }else if(gradeType=='Guardian1'){
          this.grades1.push(grade);
          this.comments1.push(comment);
         }else{
          this.grades.push(grade);
          this.comments.push(comment);
         }

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
              if(element.gradedOn== gradedOn){
                element.questionsID.push(questionID);
                if(gradeType=='Guardian2'){
                  element.guardian2_scores.push(grade);
                  element.guardian2_comments.push(comment);
  
                   }else if(gradeType=='Guardian1'){
                    element.guardian1_scores.push(grade);
                    element.guardian1_comments.push(comment);
                     }else{
                      element.person_scores.push(grade);
                      element.person_comments.push(comment);
                     }
              }      
            });
        }
      })
        });
        this.store.dispatch(new fromState.UpdateConversationCards(this.ConversationCards));

 */  }

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
    
    const filterValue = (event.target as HTMLInputElement).value;
    console.log(this.searchCards);
    this.ConversationCards.forEach(card=>{
      if(card.id.includes(filterValue) || card.gradedOn.includes(filterValue)|| card.status.includes(filterValue)){
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