import { Component, OnInit } from '@angular/core';
import {MatTableDataSource} from '@angular/material/table';
import * as fromState from '../../state';
import { Store } from '@ngrx/store';
import * as fromRoot from '../../../app/state';
import { DiscoverCard } from 'src/app/models/DiscoverCard';
import { User } from 'src/app/models/User';
import { Card } from 'src/app/models/Card';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-discover-card',
  templateUrl: './discover-card.component.html',
  styleUrls: ['./discover-card.component.scss']
})
export class DiscoverCardComponent implements OnInit {
  displayedColumns: string[] = ['gradedOn', 'personName',  'userName', 'userOrg', 'status','id'];
  discoverCards$: Observable<DiscoverCard[]> = new Observable<DiscoverCard[]>();
  current_user$: Observable<User| null> = new Observable<User| null>();
  cards: Card[]= [];
  questions: string []= [];
  grades: string[]= [];
  comments: string[]= [];
  searchCards: Card[]= [];

 // dataSource = new MatTableDataSource(this.cards);

  constructor(private store: Store<fromState.State>) {
    
  }

  ngOnInit(): void {
    this.current_user$ = this.store.select(fromState.getCurrentUser);
    this.current_user$.subscribe(data => {
      let userID: string = data?.userID ?? '';
      this.store.dispatch(new fromState.LoadDiscoverCard(userID));
    });


    this.discoverCards$ = this.store.select(fromState.getDiscoverCards);
    this.discoverCards$.subscribe(data=>{
      var index=1;
      data.map((discoverCard: DiscoverCard)=>{
        let gradedOn= discoverCard.gradedOn;

        let userName= discoverCard.userName;
        let userOrg= discoverCard.userOrg;
        let userTitle= discoverCard.userTitle;

        let personName='Dolt';
        if(discoverCard.personName !=" "){
          personName= discoverCard.personName;
        }
        let personNbr='Dolt';
        if(discoverCard.personNbr!=""){
          personNbr= discoverCard.personNbr;
        }
        let guardian1='Dolt';
        if(discoverCard.guardian1 !=''){
          guardian1= discoverCard.guardian1;
        }
        let guardianPersonNbr1='Dolt';
        if(discoverCard.guardianPersonNbr1 !=''){
          guardianPersonNbr1= discoverCard.guardianPersonNbr1;
        }
        let guardian2='Dolt';
        if(discoverCard.guardian2 !=''){
          guardian2= discoverCard.guardian2;
        }
        let guardianPersonNbr2='Dolt';
        if(discoverCard.guardianPersonNbr2 !=''){
          guardianPersonNbr2= discoverCard.guardianPersonNbr2;
        }

        let unit = discoverCard.unit;
        let situation = discoverCard.situation;

        let questionID= discoverCard.questionID;
        let grade= discoverCard.grade;
        let comment='';
        if(discoverCard.comment !='0'){
          comment= discoverCard.comment;
        }
        let status =discoverCard.status;
        let personID= discoverCard.personID;

        if(!this.containsCard(discoverCard.gradedOn)){
         this.questions.push(questionID);
         this.grades.push(grade);
         this.comments.push(comment);
          this.cards.push(new Card(String(index), gradedOn, userName, userOrg, userTitle,
            personName, personNbr, guardian1, guardianPersonNbr1, guardian2, guardianPersonNbr2,
            unit, situation, this.questions, this.grades, this.comments, status, personID));
            this.questions= [];
            this.grades= [];
            this.comments= [];
          
            index++;
          }else{
            this.cards.forEach(element => {
              if(element.gradedOn== gradedOn && !this.containsQuestion(element, questionID)){
                element.questions.push(questionID);
                element.grades.push(grade);
                element.comments.push(comment);
              }      
            });
        }
      })
        });
      //  this.dataSource.data = this.cards;
        this.store.dispatch(new fromState.UpdateCards(this.cards));
      }

  moveToCard(card: Card){
    this.store.dispatch(new fromState.UpdateCard(card));
    this.store.dispatch(new fromRoot.Go({ path: ['/discover-card', card.id] }));
  }

  moveToEditCard(card: Card){
    this.store.dispatch(new fromState.UpdateCard(card));
    this.store.dispatch(new fromRoot.Go({ path: ['/edit-discover-card', card.id] }));
  }

  containsCard(date: string): boolean{
    var found= false;
    this.cards.forEach(element => {
      if(element.gradedOn== date){
        found= true;
      }      
    });
    return found;
  }

  containsQuestion(card: Card, questionId: string): boolean{
    var found= false;

    card.questions.forEach(question => {
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
    this.cards.forEach(card=>{
      if(card.personName.includes(filterValue) || card.userName.includes(filterValue)|| card.status.includes(filterValue)|| card.gradedOn.includes(filterValue)){
        this.searchCards.push(card);
      }
   });
  }

}
