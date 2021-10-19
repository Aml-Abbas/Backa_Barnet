import { Component, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import * as fromRoot from '../../../app/state';


@Component({
  selector: 'app-create-conversation-material',
  templateUrl: './create-conversation-material.component.html',
  styleUrls: ['./create-conversation-material.component.scss']
})
export class CreateConversationMaterialComponent implements OnInit {

  guardianNbr: number=2;
  selected = '2';


  care_comment: string='';
  security_comment: string='';
  feel_good_comment: string='';
  free_time_comment: string='';
  beloning_comment: string='';
  responsibility_comment: string='';
  respekt_comment: string='';
  develop_comment: string='';
 
  saveError='';
   scores = [
    { area: "OMSORG", id: "care",class: "care-class", question:'Jag har någon som bryr sig om mig', 
    person_score:'', person_comment: this.care_comment,
    guardian1_score:'', guardian1_comment: this.care_comment,
    guardian2_score:'', guardian2_comment: this.care_comment,
    color: '#003686'},

    { area: "TRYGGHET", id: "security", class:'security-class', question:'Jag känner mig trygg', 
    person_score:'', person_comment: this.security_comment,
    guardian1_score:'', guardian1_comment: this.care_comment,
    guardian2_score:'', guardian2_comment: this.care_comment,
    color: '#353370'},

    { area: "MÅ BRA", id: "feel_good", class:'feel_good-class', question:'Jag mår bra', 
    person_score:'', person_comment: this.feel_good_comment,
    guardian1_score:'', guardian1_comment: this.care_comment,
    guardian2_score:'', guardian2_comment: this.care_comment,
    color: '#e0448c'},

    { area: "FRITID", id: "free_time", class:'free_time-class', question:'Jag trivs med min fritid', 
    person_score:'', person_comment: this.free_time_comment,
    guardian1_score:'', guardian1_comment: this.care_comment,
    guardian2_score:'', guardian2_comment: this.care_comment,
    color: '#df2d5b'},

    { area: "TILLHÖRIGHET", id: "beloning", class:'beloning-class', question:'Jag får vara med', 
    person_score:'', person_comment: this.beloning_comment,
    guardian1_score:'', guardian1_comment: this.care_comment,
    guardian2_score:'', guardian2_comment: this.care_comment,
    color: '#eb612d'},

    { area: "ANSVARSTAGANDE", id: "responsibility", class:'responsibility-class', question:'Jag tar ansvar för mig själv och andra', 
    person_score:'', person_comment: this.responsibility_comment,
    guardian1_score:'', guardian1_comment: this.care_comment,
    guardian2_score:'', guardian2_comment: this.care_comment,
    color: '#f79c2e'},

    { area: "RESPEKTERAS", id: "respekt", class:'respekt-class', question:'Jag känner mig respekterad', 
    person_score:'', person_comment: this.respekt_comment,
    guardian1_score:'', guardian1_comment: this.care_comment,
    guardian2_score:'', guardian2_comment: this.care_comment,
    color: '#4ba562'},

    { area: "UTVECKLAS", id: "develop", class:'develop-class', question:'Jag gör mitt bästa', 
    person_score:'', person_comment: this.develop_comment,
    guardian1_score:'', guardian1_comment: this.care_comment,
    guardian2_score:'', guardian2_comment: this.care_comment,
    color: '#31acaf'}
  ];
 
  constructor(private store: Store<fromState.State>) { }

  ngOnInit(): void {
  }

/*   changeScore(value: string, index: number){
    this.scores[index].score= value;
    }
 */

  send(nbr: number): void{
  /*   if (this.scores[0].score==''|| this.scores[1].score==''||
      this.scores[2].score==''|| this.scores[3].score==''||
      this.scores[4].score==''|| this.scores[5].score==''||
      this.scores[6].score==''|| this.scores[7].score=='') {
    this.saveError='Du har glömt att välja ett betyg';
    }else{ */
      console.log(this.scores);
      this.saveError='';
      if(nbr==1){
        console.log(nbr +" nbr is 1");
      }else if(nbr==2){
        console.log(nbr +" nbr is 2");

      }else{
        console.log(nbr +" nbr is 3");

      }
      this.store.dispatch(new fromRoot.Go({ path: ['/conversation-material'] }));

    // }
}

changeGuardianNbr(nbr: number){
  this.guardianNbr= nbr;
}
changePersonScore(nbr: number, i: number){
  this.scores[i].person_score= String(nbr);
}

changeGuardian1Score(nbr: number, i: number){
  this.scores[i].guardian1_score= String(nbr);
}
changeGuardian2Score(nbr: number, i: number){
  this.scores[i].guardian2_score= String(nbr);
}

}
