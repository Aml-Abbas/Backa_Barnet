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
  saveError='';

   scores = [
    { area: "OMSORG", id: "care",class: "care-class", question:'Jag har någon som bryr sig om mig', 
    person_score:'', person_comment: '',
    guardian1_score:'', guardian1_comment: '',
    guardian2_score:'', guardian2_comment: '',
    color: '#003686'},

    { area: "TRYGGHET", id: "security", class:'security-class', question:'Jag känner mig trygg', 
    person_score:'', person_comment:'',
    guardian1_score:'', guardian1_comment: '',
    guardian2_score:'', guardian2_comment: '',
    color: '#353370'},

    { area: "MÅ BRA", id: "feel_good", class:'feel_good-class', question:'Jag mår bra', 
    person_score:'', person_comment: '',
    guardian1_score:'', guardian1_comment: '',
    guardian2_score:'', guardian2_comment: '',
    color: '#e0448c'},

    { area: "FRITID", id: "free_time", class:'free_time-class', question:'Jag trivs med min fritid', 
    person_score:'', person_comment: '',
    guardian1_score:'', guardian1_comment: '',
    guardian2_score:'', guardian2_comment: '',
    color: '#df2d5b'},

    { area: "TILLHÖRIGHET", id: "beloning", class:'beloning-class', question:'Jag får vara med', 
    person_score:'', person_comment: '',
    guardian1_score:'', guardian1_comment: '',
    guardian2_score:'', guardian2_comment: '',
    color: '#eb612d'},

    { area: "ANSVARSTAGANDE", id: "responsibility", class:'responsibility-class', question:'Jag tar ansvar för mig själv och andra', 
    person_score:'', person_comment: '',
    guardian1_score:'', guardian1_comment: '',
    guardian2_score:'', guardian2_comment: '',
    color: '#f79c2e'},

    { area: "RESPEKTERAS", id: "respekt", class:'respekt-class', question:'Jag känner mig respekterad', 
    person_score:'', person_comment: '',
    guardian1_score:'', guardian1_comment: '',
    guardian2_score:'', guardian2_comment: '',
    color: '#4ba562'},

    { area: "UTVECKLAS", id: "develop", class:'develop-class', question:'Jag gör mitt bästa', 
    person_score:'', person_comment: '',
    guardian1_score:'', guardian1_comment: '',
    guardian2_score:'', guardian2_comment: '',
    color: '#31acaf'}
  ];
 
  constructor(private store: Store<fromState.State>) { }

  ngOnInit(): void {
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

  send(nbr: number): void{
     if (!this.checkErroes()) {
    this.saveError='Du har glömt att välja ett betyg';
    }else{ 
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

     }
}

}
