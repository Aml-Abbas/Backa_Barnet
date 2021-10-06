import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-conversation-material',
  templateUrl: './conversation-material.component.html',
  styleUrls: ['./conversation-material.component.scss']
})
export class ConversationMaterialComponent implements OnInit {

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
    { area: "OMSORG", id: "care", question:'Jag har någon som bryr sig om mig', score:'', comment: this.care_comment },
    { area: "TRYGGHET", id: "security", question:'Jag känner mig trygg', score:'', comment: this.security_comment},
    { area: "MÅ BRA", id: "feel_good", question:'Jag mår bra', score:'', comment: this.feel_good_comment},
    { area: "FRITID", id: "free_time", question:'Jag trivs med min fritid', score:'', comment: this.free_time_comment},
    { area: "TILLHÖRIGHET", id: "beloning", question:'Jag får vara med', score:'', comment: this.beloning_comment},
    { area: "ANSVARSTAGANDE", id: "responsibility", question:'Jag tar ansvar för mig själv och andra', score:'', comment: this.responsibility_comment},
    { area: "RESPEKTERAS", id: "respekt", question:'Jag känner mig respekterad', score:'', comment: this.respekt_comment},
    { area: "UTVECKLAS", id: "develop", question:'Jag gör mitt bästa', score:'', comment: this.develop_comment}
  ];

  constructor() {}

  ngOnInit(): void {}

  changeScore(value: string, index: number){
    this.scores[index].score= value;
    }


  save(): void{
    if (this.scores[0].score==''|| this.scores[1].score==''||
      this.scores[2].score==''|| this.scores[3].score==''||
      this.scores[4].score==''|| this.scores[5].score==''||
      this.scores[6].score==''|| this.scores[7].score=='') {
    this.saveError='Du har glömt att välja ett betyg';
    }else{
      this.saveError='';
    }
}

}