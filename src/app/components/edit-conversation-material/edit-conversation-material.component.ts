import { Component, OnInit } from '@angular/core';
import { ConversationCard } from 'src/app/models/ConversationCard';
import { Observable } from 'rxjs';
import * as fromState from '../../state';
import { Store } from '@ngrx/store';
import { User } from 'src/app/models/User';
import { Person } from 'src/app/models/Person';
import { ComponentCanDeactivate } from 'src/app/interfaces/component-can-deactivate';
import { MatDialog } from '@angular/material/dialog';
import { DialogComponent } from '../dialog/dialog.component';
import * as fromRoot from '../../../app/state';

@Component({
  selector: 'app-edit-conversation-material',
  templateUrl: './edit-conversation-material.component.html',
  styleUrls: ['./edit-conversation-material.component.scss']
})
export class EditConversationMaterialComponent implements OnInit, ComponentCanDeactivate {
  canDeactivate(): boolean {
    return !this.isDirty;
  }
  isDirty = false;

  selected = '2';
  saveError='';

  current_conversation_card$= new Observable<ConversationCard | null>();
  conversationCard: ConversationCard;

  current_user$: Observable<User | null> = new Observable<User | null>();
  userId: string='';

  current_person$= new Observable<Person | null>();
  current_person: Person;

  grades: string[]= [];
  comments: string[]= [];
  grades1: string[]= [];
  comments1: string[]= [];
  grades2: string[]= [];
  comments2: string[]= [];

  gradedOn: string;

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

  constructor(private store: Store<fromState.State>, public dialog: MatDialog) { }

  ngOnInit(): void {
    this.current_person$ = this.store.select(fromState.getCurrentPerson);
    this.current_user$ = this.store.select(fromState.getCurrentUser);
    this.current_user$.subscribe(data => {
      this.userId= data?.userID ?? '';
    });
    this.current_person$.subscribe(data => {
      let personNbr:string= data?.personNbr ?? '';
      let lastName: string= data?.lastName ?? '';
      let firstName: string= data?.firstName ?? '';
      let name: string= data?.name ?? '';
  
      let guardian1: string= data?.guardian1 ?? '';
      let guardianPersonNbr1: string= data?.guardianPersonNbr1 ?? '';
      let guardian2: string= data?.guardian2 ?? '';
      let guardianPersonNbr2: string= data?.guardianPersonNbr2 ?? '';
  
      let changedBy: string= data?.changedBy ?? '';
      let changedOn: string= data?.changedOn ?? '';
      let status: string= data?.status ?? '';
      let personID: string= data?.personID ?? '';

      this.current_person= new Person(personNbr, lastName, firstName, name, guardian1, guardianPersonNbr1,
                                      guardian2, guardianPersonNbr2, changedBy, changedOn, status, personID);
                                      

        });

    this.current_conversation_card$ = this.store.select(fromState.getCurrentConversationCard);
    this.current_conversation_card$.subscribe(data=>{
      if(data?.guardian2_scores[0]=='0'){
        this.selected='1';
      }
      data?.person_scores.forEach(element=>{
        this.grades.push(element);
      });
      data?.person_comments.forEach(element=>{
        this.comments.push(element);
      });

      data?.guardian1_scores.forEach(element=>{
        this.grades1.push(element);
      });
      data?.guardian1_comments.forEach(element=>{
        this.comments1.push(element);
      });

      data?.guardian2_scores.forEach(element=>{
        this.grades2.push(element);
      });

      data?.guardian2_comments.forEach(element=>{
        this.comments2.push(element);
      });

      this.gradedOn= data?.gradedOn??'';
    });

 }

  changeDirty(){
    this.isDirty= true;
  }

send(nbr: number): void{
  if (!this.checkErrors()) {
    this.saveError='Du har glömt att välja ett betyg';
    }else{ 
      if(this.selected=='1'){
        this.grades2=[];
        this.comments2=[];
      }
  var conversationMaterial = {
    UserID: parseInt(this.userId) ?? 0,
    PersonId:  parseInt(this.current_person.personID)?? 0,

    GuardianNbr1: this.current_person.guardianPersonNbr1 ?? '0',
    GuardianNbr2: this.current_person.guardianPersonNbr2 ?? '0',
  
    GradedOn: this.gradedOn,

    GradeOmsorg: parseInt(this.grades[0]),
    CommentOmsorg: this.comments[0] ?? '0',
    GradeTrygghet: parseInt(this.grades[1])?? 0,
    CommentTrygghet: this.comments[1] ?? '0',
    GradeMarBra: parseInt(this.grades[2]),
    CommentMarBra: this.comments[2] ?? '0',
    GradeFritid: parseInt(this.grades[3]),
    CommentFritid: this.comments[3] ?? '0',
    GradeTillhorighet: parseInt(this.grades[4]),
    CommentTillhorighet: this.comments[4] ?? '0',
    GradeAnsvarstagande: parseInt(this.grades[5]),
    CommentAnsvarstagande: this.comments[5] ?? '0',
    GradeRespekteras: parseInt(this.grades[6]),
    CommentRespekteras: this.comments[6] ?? '0',
    GradeUtvecklas: parseInt(this.grades[7]),
    CommentUtvecklas: this.comments[7] ?? '0',

    GradeOmsorg1: parseInt(this.grades1[0]),
    CommentOmsorg1: this.comments1[0] ?? '0',
    GradeTrygghet1: parseInt(this.grades1[1]),
    CommentTrygghet1: this.comments1[1] ?? '0',
    GradeMarBra1: parseInt(this.grades1[2]),
    CommentMarBra1: this.comments1[2] ?? '0',
    GradeFritid1: parseInt(this.grades1[3]),
    CommentFritid1: this.comments1[3] ?? '0',
    GradeTillhorighet1: parseInt(this.grades1[4]),
    CommentTillhorighet1: this.comments1[4] ?? '0',
    GradeAnsvarstagande1: parseInt(this.grades1[5]),
    CommentAnsvarstagande1: this.comments1[5] ?? '0',
    GradeRespekteras1: parseInt(this.grades1[6]),
    CommentRespekteras1: this.comments1[6] ?? '0',
    GradeUtvecklas1: parseInt(this.grades1[7]),
    CommentUtvecklas1: this.comments1[7] ?? '0',

    GradeOmsorg2: parseInt(this.grades2[0]),
    CommentOmsorg2: this.comments2[0]?? '0',
    GradeTrygghet2: parseInt(this.grades2[1]),
    CommentTrygghet2: this.comments2[1]?? '0',
    GradeMarBra2: parseInt(this.grades2[2]),
    CommentMarBra2: this.comments2[2]?? '0',
    GradeFritid2: parseInt(this.grades2[3]),
    CommentFritid2: this.comments2[3]?? '0',
    GradeTillhorighet2: parseInt(this.grades2[4]),
    CommentTillhorighet2: this.comments2[4]?? '0',
    GradeAnsvarstagande2: parseInt(this.grades2[5]),
    CommentAnsvarstagande2: this.comments2[5]?? '0',
    GradeRespekteras2: parseInt(this.grades2[6]),
    CommentRespekteras2: this.comments2[6]?? '0',
    GradeUtvecklas2: parseInt(this.grades2[7]),
    CommentUtvecklas2: this.comments2[7]?? '0',
    Status: nbr,
  };

  console.log(conversationMaterial);

  var title= 'Ändra samtalsunderlag';
  var text= 'Kortet kommer att sparas';

 if(nbr==2){
    text= 'Barnet kommer delas status "behoveruppfylt"';
    this.current_person.status= 'Behov uppfyllt';
  }else{
    text= 'Barnet kommer skickas till barnteam';
    this.current_person.status= 'I barnteam';
  }

  const dialogRef = this.dialog.open(DialogComponent, {
    data: {
      title: title,
      text: text,
    }
  });

  dialogRef.afterClosed().subscribe(result => {
    if (result) {
      this.isDirty = false;
      this.store.dispatch(new fromRoot.UpdatePerson(this.current_person));
      this.store.dispatch(new fromState.UpdateConversationCard(conversationMaterial));
    }
  });
    }
 }

 checkErrors(): boolean{
  var isMissed= false;
  this.grades.forEach(element => {
    if(element=='0'){
      isMissed= true;
    }
  });
  this.grades1.forEach(element => {
    if(element=='0'){
      isMissed= true;
    }
  });
  if(this.selected=='2'){
    this.grades2.forEach(element => {
      if(element=='0'){
        isMissed= true;
      }
    });
  }
  return !isMissed;
}

}
