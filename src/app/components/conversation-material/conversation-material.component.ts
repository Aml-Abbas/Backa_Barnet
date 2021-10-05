import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-conversation-material',
  templateUrl: './conversation-material.component.html',
  styleUrls: ['./conversation-material.component.scss']
})
export class ConversationMaterialComponent implements OnInit {
  care_score: string;
  security_score: string;
  feel_good_score: string;
  free_time_score: string;
  beloning_score: string;
  responsibility_score: string;
  respekt_score: string;
  develop_score: string;

  care_comment: string;
  security_comment: string;
  feel_good_comment: string;
  free_time_comment: string;
  beloning_comment: string;
  responsibility_comment: string;
  respekt_comment: string;
  develop_comment: string;

  saveError='';

  constructor() {}

  ngOnInit(): void {}

  changeCareScore(value: string){
    this.care_score= value;
  }
  changeSecurityScore(value: string){
    this.security_score= value;
  }
  changeFeelGoodScore(value: string){
    this.feel_good_score= value;
  }
  changeFreeTimeScore(value: string){
    this.free_time_score= value;
  }
  changeBeloningScore(value: string){
    this.beloning_score= value;
  }
  changeResponsibilityScore(value: string){
    this.responsibility_score= value;
  }
  changeRespektScore(value: string){
    this.respekt_score= value;
  }
  changeDevelopScore(value: string){
    this.develop_score= value;
  }

  save(): void{
    if (this.care_score==undefined|| this.security_score== undefined
        || this.feel_good_score== undefined || this.free_time_score== undefined
        || this.beloning_score== undefined || this.responsibility_score== undefined
         || this.respekt_score== undefined || this.develop_score== undefined) {
    this.saveError='Du har glömt att välja ett betyg';
    }else{

      this.saveError='';
    }
}

}