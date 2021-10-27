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

@Component({
  selector: 'app-discover-card',
  templateUrl: './discover-card.component.html',
  styleUrls: ['./discover-card.component.scss']
})
export class DiscoverCardComponent implements OnInit {
  displayedColumns: string[] = ['gradedOn', 'userName', 'userOrg'];
  discoverCards$: Observable<DiscoverCard[]> = new Observable<DiscoverCard[]>();
  current_user$: Observable<User| null> = new Observable<User| null>();
  cards: Card[]= [];
  questions: string []= [];
  grades: string[]= [];
  comments: string[]= [];
  dataSource = new MatTableDataSource(this.cards);

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
    
    this.cards= [];

    this.discoverCards$ = this.store.select(fromState.getDiscoverCards);
    this.discoverCards$.subscribe(data=>{
      var index=1;
      data.map((discoverCard: DiscoverCard)=>{
        let gradedOn= discoverCard.gradedOn;
        let userName= discoverCard.userName;
        let userOrg= discoverCard.userOrg;
        let userTitle= discoverCard.userTitle;

        let personName= discoverCard.personName;
        let personNbr= discoverCard.personNbr;

        let guardian1= discoverCard.guardian1;
        let guardianPersonNbr1= discoverCard.guardianPersonNbr1;
        let guardian2= discoverCard.guardian2;
        let guardianPersonNbr2= discoverCard.guardianPersonNbr2;


        let healthTeam = discoverCard.healthTeam;
        let situation = discoverCard.situation;

        let questionID= discoverCard.questionID;
        let grade= discoverCard.grade;
        let comment= discoverCard.comment;

        console.log(questionID);
        console.log(grade);
        console.log(comment);

        if(!this.containsCard(discoverCard.gradedOn)){
         this.questions.push(questionID);
         this.grades.push(grade);
         this.comments.push(comment);
          this.cards.push(new Card(String(index), gradedOn, userName, userOrg, userTitle,
            personName, personNbr, guardian1, guardianPersonNbr1, guardian2, guardianPersonNbr2,
            healthTeam, situation, this.questions, this.grades, this.comments));
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
        this.dataSource = new MatTableDataSource(this.cards);
  }

  moveToCard(card: Card){
    this.store.dispatch(new fromState.UpdateCard(card));
    this.store.dispatch(new fromRoot.Go({ path: ['/discover-card', card.id] }));
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
}
