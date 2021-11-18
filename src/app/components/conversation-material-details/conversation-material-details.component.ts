import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-conversation-material-details',
  templateUrl: './conversation-material-details.component.html',
  styleUrls: ['./conversation-material-details.component.scss']
})
export class ConversationMaterialDetailsComponent implements OnInit {
  selected='2';

  scores = [
    { area: "OMSORG", id: "care",class: "care-class", question:'Jag har någon som bryr sig om mig', 
    person_score:'3', person_comment: 'h',
    guardian1_score:'3', guardian1_comment: 'h',
    guardian2_score:'3', guardian2_comment: 'h',
    color: '#003686'},

    { area: "TRYGGHET", id: "security", class:'security-class', question:'Jag känner mig trygg', 
    person_score:'2', person_comment:'a',
    guardian1_score:'2', guardian1_comment: 'a',
    guardian2_score:'2', guardian2_comment: 'a',
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
    person_score:'1', person_comment: 'i',
    guardian1_score:'1', guardian1_comment: 'i',
    guardian2_score:'1', guardian2_comment: 'i',
    color: '#31acaf'}
  ];


  constructor() { }

  ngOnInit(): void {
  }

}
