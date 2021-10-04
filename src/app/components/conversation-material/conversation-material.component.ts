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

  constructor() {}

  ngOnInit(): void {}

  changeCareScore(value: string){
    this.care_score= value;
    console.log(this.care_score);

  }

  save(): void{
    console.log(this.care_score);
    console.log(this.security_score);
    console.log(this.feel_good_score);
    console.log(this.free_time_score);
    console.log(this.beloning_score);
    console.log(this.responsibility_score);
    console.log(this.respekt_score);
    console.log(this.develop_score);
  }
}
