import { Component, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import { Observable } from 'rxjs';
import { User } from 'src/app/models/User';
import { Person } from 'src/app/models/Person';
import { MatDialog } from '@angular/material/dialog';
import { ComponentCanDeactivate } from 'src/app/interfaces/component-can-deactivate';
import { DialogComponent } from '../dialog/dialog.component';


@Component({
  selector: 'app-create-conversation-material',
  templateUrl: './create-conversation-material.component.html',
  styleUrls: ['./create-conversation-material.component.scss']
})
export class CreateConversationMaterialComponent implements OnInit, ComponentCanDeactivate{
  canDeactivate(): boolean {
    return !this.isDirty;
  }

  isDirty = false;

  current_user$: Observable<User | null> = new Observable<User | null>();
  userId: string='';

  current_person$= new Observable<Person | null>();
  personId: string='';
  guardianNbr1: string='';
  guardianNbr2: string='';

  guardianNbr: number=2;
  selected = '2';
  saveError='';

   scores = [
    { area: "OMSORG", id: "care",class: "care-class", question:'Jag har någon som bryr sig om mig', 
    person_score:'0', person_comment: '0',
    guardian1_score:'0', guardian1_comment: '0',
    guardian2_score:'0', guardian2_comment: '0',
    color: '#003686'},

    { area: "TRYGGHET", id: "security", class:'security-class', question:'Jag känner mig trygg', 
    person_score:'0', person_comment:'0',
    guardian1_score:'0', guardian1_comment: '0',
    guardian2_score:'0', guardian2_comment: '0',
    color: '#353370'},

    { area: "MÅ BRA", id: "feel_good", class:'feel_good-class', question:'Jag mår bra', 
    person_score:'0', person_comment: '0',
    guardian1_score:'0', guardian1_comment: '0',
    guardian2_score:'0', guardian2_comment: '0',
    color: '#e0448c'},

    { area: "FRITID", id: "free_time", class:'free_time-class', question:'Jag trivs med min fritid', 
    person_score:'0', person_comment: '0',
    guardian1_score:'0', guardian1_comment: '0',
    guardian2_score:'0', guardian2_comment: '0',
    color: '#df2d5b'},

    { area: "TILLHÖRIGHET", id: "beloning", class:'beloning-class', question:'Jag får vara med', 
    person_score:'0', person_comment: '0',
    guardian1_score:'0', guardian1_comment: '0',
    guardian2_score:'0', guardian2_comment: '0',
    color: '#eb612d'},

    { area: "ANSVARSTAGANDE", id: "responsibility", class:'responsibility-class', question:'Jag tar ansvar för mig själv och andra', 
    person_score:'0', person_comment: '0',
    guardian1_score:'0', guardian1_comment: '0',
    guardian2_score:'0', guardian2_comment: '0',
    color: '#f79c2e'},

    { area: "RESPEKTERAS", id: "respekt", class:'respekt-class', question:'Jag känner mig respekterad', 
    person_score:'0', person_comment: '0',
    guardian1_score:'0', guardian1_comment: '0',
    guardian2_score:'0', guardian2_comment: '0',
    color: '#4ba562'},

    { area: "UTVECKLAS", id: "develop", class:'develop-class', question:'Jag gör mitt bästa', 
    person_score:'0', person_comment: '0',
    guardian1_score:'0', guardian1_comment: '0',
    guardian2_score:'0', guardian2_comment: '0',
    color: '#31acaf'}
  ];
 
  constructor(private store: Store<fromState.State>,
    public dialog: MatDialog) { }

  ngOnInit(): void {
    this.current_person$ = this.store.select(fromState.getCurrentPerson);
    this.current_user$ = this.store.select(fromState.getCurrentUser);
    this.current_user$.subscribe(data => {
      this.userId= data?.userID ?? '';
    });
    this.current_person$.subscribe(data => {
      this.personId=  data?.personID ?? '';
      this.guardianNbr1= data?.guardianPersonNbr1??'';
      this.guardianNbr2= data?.guardianPersonNbr2??'';

        });

  }

    checkErroes(): boolean{
      var isMissed= false;
      this.scores.forEach(element => {
        if(element.person_score==''||
        element.guardian1_score==''){
          isMissed= true;
        }
        if( element.guardian2_score=='' && this.selected=='2'){
          isMissed= true;
        }
      });
      return !isMissed;
    }

    changeDirty(){
      this.isDirty= true;
    }

  send(nbr: number): void{
     if (!this.checkErroes()) {
    this.saveError='Du har glömt att välja ett betyg';
    }else{ 
      console.log(this.scores);
      this.saveError='';

      var conversationMaterial = {
        UserID: parseInt(this.userId) ?? 0,
        PersonId:  parseInt(this.personId)?? 0,
  
        GuardianNbr1: this.guardianNbr1 ?? '0',
        GuardianNbr2: this.guardianNbr2 ?? '0',
      
        GradeOmsorg: parseInt(this.scores[0].person_score),
        CommentOmsorg: this.scores[0].person_comment ?? '0',
        GradeTrygghet: parseInt(this.scores[1].person_score)?? 0,
        CommentTrygghet: this.scores[1].person_comment ?? '0',
        GradeMarBra: parseInt(this.scores[2].person_score),
        CommentMarBra: this.scores[2].person_comment ?? '0',
        GradeFritid: parseInt(this.scores[3].person_score),
        CommentFritid: this.scores[3].person_comment ?? '0',
        GradeTillhorighet: parseInt(this.scores[4].person_score),
        CommentTillhorighet: this.scores[4].person_comment ?? '0',
        GradeAnsvarstagande: parseInt(this.scores[5].person_score),
        CommentAnsvarstagande: this.scores[5].person_comment ?? '0',
        GradeRespekteras: parseInt(this.scores[6].person_score),
        CommentRespekteras: this.scores[6].person_comment ?? '0',
        GradeUtvecklas: parseInt(this.scores[7].person_score),
        CommentUtvecklas: this.scores[7].person_comment ?? '0',
  
        GradeOmsorg1: parseInt(this.scores[0].guardian1_score),
        CommentOmsorg1: this.scores[0].guardian1_comment ?? '0',
        GradeTrygghet1: parseInt(this.scores[1].guardian1_score),
        CommentTrygghet1: this.scores[1].guardian1_comment ?? '0',
        GradeMarBra1: parseInt(this.scores[2].guardian1_score),
        CommentMarBra1: this.scores[2].guardian1_comment ?? '0',
        GradeFritid1: parseInt(this.scores[3].guardian1_score),
        CommentFritid1: this.scores[3].guardian1_comment ?? '0',
        GradeTillhorighet1: parseInt(this.scores[4].guardian1_score),
        CommentTillhorighet1: this.scores[4].guardian1_comment ?? '0',
        GradeAnsvarstagande1: parseInt(this.scores[5].guardian1_score),
        CommentAnsvarstagande1: this.scores[5].guardian1_comment ?? '0',
        GradeRespekteras1: parseInt(this.scores[6].guardian1_score),
        CommentRespekteras1: this.scores[6].guardian1_comment ?? '0',
        GradeUtvecklas1: parseInt(this.scores[7].guardian1_score),
        CommentUtvecklas1: this.scores[7].guardian1_comment ?? '0',

        GradeOmsorg2: parseInt(this.scores[0].guardian2_score),
        CommentOmsorg2: this.scores[0].guardian2_comment ?? '0',
        GradeTrygghet2: parseInt(this.scores[1].guardian2_score),
        CommentTrygghet2: this.scores[1].guardian2_comment ?? '0',
        GradeMarBra2: parseInt(this.scores[2].guardian2_score),
        CommentMarBra2: this.scores[2].guardian2_comment ?? '0',
        GradeFritid2: parseInt(this.scores[3].guardian2_score),
        CommentFritid2: this.scores[3].guardian2_comment ?? '0',
        GradeTillhorighet2: parseInt(this.scores[4].guardian2_score),
        CommentTillhorighet2: this.scores[4].guardian2_comment ?? '0',
        GradeAnsvarstagande2: parseInt(this.scores[5].guardian2_score),
        CommentAnsvarstagande2: this.scores[5].guardian2_comment ?? '0',
        GradeRespekteras2: parseInt(this.scores[6].guardian2_score),
        CommentRespekteras2: this.scores[6].guardian2_comment ?? '0',
        GradeUtvecklas2: parseInt(this.scores[7].guardian2_score),
        CommentUtvecklas2: this.scores[7].guardian2_comment ?? '0',

        Status: nbr,
      };

      console.log(conversationMaterial);

      var title= 'Skapa samtalsunderlag';
      var text= '';

      if(nbr==1){
        text= 'Kortet kommer att sparas';
      }else if(nbr==2){
        text= 'Barnet kommer delas status "behoveruppfylt"';
      }else{
        text= 'Barnet kommer skickas till barnteam';
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
          this.store.dispatch(new fromState.CreateConversationMaterial(conversationMaterial));
        }
      });

     }
}

}
