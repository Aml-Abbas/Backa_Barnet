import { Component, OnInit } from '@angular/core';
import { ChartDataSets, ChartType, RadialChartOptions } from 'chart.js';
import { Label } from 'ng2-charts';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import { Observable } from 'rxjs';
import { Person } from 'src/app/models/Person';
import { BaseChartDirective } from 'ng2-charts';
import { ViewChild } from '@angular/core'
import { __metadata } from 'tslib';
import { GetSetService } from '../../services/get-set/get-set.service';
import { CompassDataConversation } from 'src/app/models/CompassDataConversation';
import { ConversationCard } from 'src/app/models/ConversationCard';
import { EstimateCard } from 'src/app/models/EstimateCard';
import * as fromRouter from '../../state/reducers/index';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-need-compass',
  templateUrl: './need-compass.component.html',
  styleUrls: ['./need-compass.component.scss']
})
export class NeedCompassComponent implements OnInit {
  @ViewChild(BaseChartDirective) chart: BaseChartDirective;

  current_person$= new Observable<Person | null>();

  selectedType='0';
  selectedDate= '0';
  
  personID: string;
  personName: string;
  guardian1: string;
  guardian2: string;

  public radarChartOptions: RadialChartOptions = {
    responsive:true,
    maintainAspectRatio: false,

    title:{
      display: true,
      text:''
    },
       scale:{
      gridLines:{
        circular: true,
        color: 'transparent'

      },
       angleLines: {
            display: true,
            color: 'transparent'
        },
        ticks: {
          min: 0,
          max: 5,
          maxTicksLimit: 6,
          fontSize: 15,
          fontColor:'transparent',
          backdropColor:'transparent'
    }
    },
    elements:{
      rectangle:{
        borderWidth:50,
        backgroundColor:'pink'
      },point:{
       // borderWidth: 30,
      }, line:{
        borderWidth:2,
        tension: 0.15,
        fill: false,
      },
    },
    legend:{
      display: true,
      position:'right',
      fullWidth: true,
      labels:{
        boxWidth:20,
        fontSize: 15,
        usePointStyle: false,
      }, 
    }
  };



  public radarChartLabels: Label[] = ['', '', '', 
                                      '', '', '',
                                      '', ''];
  public colors: string[]=['rgb(0,54,134)', '#353370', '#e0448c', '#5BDF2D', '#eb612d',
                            '#f79c2e', '#4ba562', '#31acaf', '#A52A2A', '#0000FF',
                            '#2F4F4F', '#228B22', '#FF69B4','#CD853F', '#008080',
                            '#FF6347', '#A0522D', '#808000', '#DAA520', '#B22222',
                           '#D2691E'];

  public radarChartData: ChartDataSets[] = [
    { data: [], label: '', backgroundColor:''},
  ];

  public radarChartType: ChartType = 'radar';

  conversationDates: string[]=[];
  estimateDates: string[]=[];
  dates = new Set()

  cards: CompassDataConversation[]= [];

  grades: number[]= [];
  guardian1_grades: number[]= [];
  guardian2_grades: number[]= [];

  pcards: Promise<ConversationCard[]>= new Promise((resolve, reject) => { });
  ConversationCards: ConversationCard[]= [];

  ecards: Promise<EstimateCard[]>= new Promise((resolve, reject) => { });
  estimatecards: EstimateCard[]= [];

  state$: Observable<any> = new Observable<any>();

  constructor(private store: Store<fromState.State>,
     private getSetService: GetSetService,
     private route: ActivatedRoute) { 
     }

  ngOnInit(): void {
      this.selectedType= this.route.snapshot.queryParams[0];
      this.selectedDate= this.route.snapshot.queryParams[1];
      
    this.current_person$ = this.store.select(fromState.getCurrentPerson);
    this.current_person$.subscribe(data=>{
      this.personID= data?.personID?? '';

      this.personName= data?.name?? '';
      this.guardian1= data?.guardian1?? '';
      this.guardian2= data?.guardian2?? '';

      let name= this.personName.split(' ');
      this.personName= name[0]+ ' '+ name[name.length-1];
      if(this.personName.length>19){
        this.personName= name[name.length-1];
      }
      while(this.personName.length<18){
        this.personName+=' ';
      }


/* 
      name= this.guardian1.split(' ');
      this.guardian1= name[0]+ ' '+ name[name.length-1];
      if(this.guardian1.length>19){
        this.guardian1= name[name.length-1];
      }
      while(this.guardian1.length<18){
        this.guardian1+=' ';
      }

      name= this.guardian2.split(' ');
      this.guardian2= name[0]+ ' '+ name[name.length-1];
      if(this.guardian2.length>19){
        this.guardian2= name[name.length-1];
      }
      if(this.guardian2='0 0'){
        this.guardian2='Dolt';
      }
      while(this.guardian2.length<18){
        this.guardian2+=' ';
      } */

      this.pcards= this.getSetService.getConversationMaterial(this.personID);
      let cards= this.ConversationCards;
      this.pcards.then(function (response) {
      
        response.forEach((card: ConversationCard)=>{
          cards.push(card);
      });
      });
      cards.forEach(element=>{
        this.ConversationCards.push(element);
      });
  
      this.ecards= this.getSetService.getEstimate(this.personID);
      let estimatecards= this.estimatecards;
      this.ecards.then(function (response) {
        response.forEach((card: EstimateCard)=>{
          estimatecards.push(card); 
        });
      });
    
      estimatecards.forEach(element=>{
        this.estimatecards.push(element);
      });
  
    });
    this.onTypeChange();

  }

  onTypeChange(){
    this.radarChartData=[];
    this.dates.clear();

    if(this.selectedType=='2' && this.selectedDate=='0'){
      this.selectedDate= this.estimatecards[0].gradedOn.slice(0,10);
    }else{
      if(this.selectedDate=='0'){
        this.selectedDate= this.ConversationCards[0].gradedOn.slice(0,10);
      }
  }
}

  onDateChange(){
    this.radarChartData=[];
    var colorIndex=0;

    if(this.selectedType=='2'){
      this.estimatecards.forEach(element=>{  
        this.dates.add(element.gradedOn.slice(0,10));
        if(element.gradedOn.slice(0,10)== this.selectedDate && this.radarChartData.length<19){
          this.radarChartData.push({data: element.average, label: this.getName(element.userName), backgroundColor: this.colors[colorIndex], pointBackgroundColor: this.colors[colorIndex]});
          colorIndex++;
        }
      });
    }else{
      this.ConversationCards.forEach(element=>{  
        this.dates.add(element.gradedOn.slice(0,10));
      if(element.gradedOn.slice(0,10)== this.selectedDate && this.radarChartData.length<17){
        var grades: number[]=[];
        element.person_scores.forEach(score=>{
          grades.push(parseInt(score));
        });
        this.radarChartData.push({data: grades, label: this.personName, borderColor: this.colors[colorIndex], pointBackgroundColor: this.colors[colorIndex]});
        colorIndex++;
        var grades: number[]=[];
        element.guardian1_scores.forEach(score=>{
          grades.push(parseInt(score));
        });
        this.radarChartData.push({data: grades, label: 'Vårdnadshavare 1 ', borderColor: this.colors[colorIndex], pointBackgroundColor: this.colors[colorIndex]});
        colorIndex++;
        var grades: number[]=[];
        element.guardian2_scores.forEach(score=>{
          grades.push(parseInt(score));
        });
        this.radarChartData.push({data: grades, label: 'Vårdnadshavare 2 ', borderColor: this.colors[colorIndex], pointBackgroundColor: this.colors[colorIndex]});
        colorIndex++;
      }
  });
    }
  }

  toggle(){
    this.chart.datasets.forEach(function(e,i){
      e.hidden= !e.hidden;
    });
    this.chart.update();
  }

  getName(userName: string): string {
    let name= userName.split(' ');
    var pName= name[0]+ ' '+ name[name.length-1];
    if(pName.length>19){
      pName= name[name.length-1];
    }
    while(pName.length<18){
      pName+=' ';
    }
    return pName;
}
}



