import { Component, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import * as fromRoot from '../../../app/state';

export interface PeriodicElement {
  question: string;
  position: number;
  score: number;
  }
  
  const ELEMENT_DATA: PeriodicElement[] = [
    {position: 1, question: 'Hydrogen',score: 1},
    {position: 2, question: 'Helium',score: 1},
    {position: 3, question: 'Lithium',score: 1},
    {position: 4, question: 'Beryllium', score: 1,},
    {position: 5, question: 'Boron', score: 1},
    {position: 6, question: 'Carbon',score: 1},
    {position: 7, question: 'Nitrogen',score: 1},
    {position: 8, question: 'Oxygen',score: 1},
    {position: 9, question: 'Fluorine',score: 1},
    {position: 10, question: 'Neon',score: 1},
    ];


@Component({
  selector: 'app-create-conversation-material',
  templateUrl: './create-conversation-material.component.html',
  styleUrls: ['./create-conversation-material.component.scss']
})
export class CreateConversationMaterialComponent implements OnInit {
  displayedColumns = ['question', 'score', 'position', 'position', 'star'];
  dataSource = ELEMENT_DATA;

/*   care_comment: string='';
  security_comment: string='';
  feel_good_comment: string='';
  free_time_comment: string='';
  beloning_comment: string='';
  responsibility_comment: string='';
  respekt_comment: string='';
  develop_comment: string='';
 */
  saveError='';
/*   scores = [
    { area: "OMSORG", id: "care", question:'Jag har någon som bryr sig om mig', score:'', comment: this.care_comment },
    { area: "TRYGGHET", id: "security", question:'Jag känner mig trygg', score:'', comment: this.security_comment},
    { area: "MÅ BRA", id: "feel_good", question:'Jag mår bra', score:'', comment: this.feel_good_comment},
    { area: "FRITID", id: "free_time", question:'Jag trivs med min fritid', score:'', comment: this.free_time_comment},
    { area: "TILLHÖRIGHET", id: "beloning", question:'Jag får vara med', score:'', comment: this.beloning_comment},
    { area: "ANSVARSTAGANDE", id: "responsibility", question:'Jag tar ansvar för mig själv och andra', score:'', comment: this.responsibility_comment},
    { area: "RESPEKTERAS", id: "respekt", question:'Jag känner mig respekterad', score:'', comment: this.respekt_comment},
    { area: "UTVECKLAS", id: "develop", question:'Jag gör mitt bästa', score:'', comment: this.develop_comment}
  ];
 */
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

}
