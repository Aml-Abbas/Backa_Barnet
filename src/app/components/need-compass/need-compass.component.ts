import { Component, OnInit } from '@angular/core';
import { ChartDataSets, ChartType, RadialChartOptions } from 'chart.js';
import { Label } from 'ng2-charts';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import { Observable } from 'rxjs';
import { Person } from 'src/app/models/Person';
import { ChartOptions } from 'chart.js';
import { BaseChartDirective } from 'ng2-charts';
import { ViewChild } from '@angular/core'
import { __metadata } from 'tslib';
import { GetSetService } from '../../services/get-set/get-set.service';
import { Card } from 'src/app/models/Card';
import { EstimateCard } from 'src/app/models/EstimateCard';
import { CompassDataConversation } from 'src/app/models/CompassDataConversation';
import { CompassDataEstimate } from 'src/app/models/CompassDataEstimate';

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
        borderColor:['pink', 'black']
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
  public colors: string[]=['#003686', '#353370', '#e0448c', '#df2d5b', '#eb612d',
                            '#f79c2e', '#4ba562', '#31acaf', '#A52A2A', '#0000FF',
                            '#2F4F4F', '#228B22', '#FF69B4','#CD853F', '#008080',
                            '#FF6347', '#A0522D', '#808000', '#DAA520', '#B22222',
                           '#D2691E'];

  public radarChartData: ChartDataSets[] = [
    { data: [], label: '', backgroundColor:''},
  ];

  questionIndex = new Map([
    [ '1', 0 ],
    [ "2", 1 ],
    [ "3", 2 ],
    [ '4', 3 ],
    [ "5", 4 ],
    [ "6", 5 ],

    [ '7', 0 ],
    [ "8", 1 ],
    [ "9", 2 ],
    [ '10',3 ],
    [ "11", 4 ],
    [ "12", 5 ],
    [ '59', 6 ],
    [ "60", 7 ],

    [ '13', 0 ],
    [ "14", 1 ],
    [ "15", 2 ],
    [ '16', 3 ],
    [ "17", 4 ],
    [ "18", 5 ],

    [ '19', 0 ],
    [ "20", 1 ],
    [ "21", 2 ],

    [ '22', 0 ],
    [ "23", 1 ],
    [ "24", 2 ],

    [ '25', 0 ],
    [ "26", 1 ],
    [ "27", 2 ],
    [ '28', 3 ],
    [ "29", 4 ],
    [ "30", 5 ],
    [ "61", 6 ],

    [ '31', 0 ],
    [ "32", 1 ],
    [ "33", 2 ],
    [ '34', 3 ],

    [ "35", 0 ],
    [ "36", 1 ],
    [ '37', 2 ],
    [ "38", 3 ],
    [ "39", 4 ],
]);

  public radarChartType: ChartType = 'radar';

  conversationDates: string[]=[];
  estimateDates: string[]=[];
  dates = new Set()

  cards: CompassDataConversation[]= [];
  estimatecards: CompassDataEstimate[]= [];

  grades: number[]= [];
  guardian1_grades: number[]= [];
  guardian2_grades: number[]= [];

  constructor(private store: Store<fromState.State>,
     private getSetService: GetSetService) { }

  ngOnInit(): void {
    this.current_person$ = this.store.select(fromState.getCurrentPerson);
    this.current_person$.subscribe(data=>{
      this.personID= data?.personID?? '';
    });

    this.getSetService.getCompass(this.personID).subscribe(response_data=>{
          response_data.map((card: any)=>{

        let questionID: string = card?.questionID ?? '';
        let questionTypeID: string = card?.questionTypeID ?? '';
        let questionLevelID= parseInt(card.questionLevelID)-1;
        let personID: string = card?.personID ?? '';
        let userID: string = card?.userID ?? '';
        let userName =card?.userName ?? '';;
        let name= userName.split(' ');
        userName= name[0]+ ' '+ name[name.length-1];
        if(userName>19){
          userName= name[name.length-1];
        }
        while(userName.length<18){
          userName+=' ';
        }
        let grade: string = card?.grade ?? '';
        let gradedOn: string = card?.gradedOn ?? '';
        let index= this.questionIndex.get(String(questionID))??0;

        //it is discovercard
        if(questionTypeID=='1'){
          if(!this.containsCard(gradedOn)){
            this.grades.push(parseInt(grade));
             this.cards.push(new CompassDataConversation(gradedOn, userName, 
              this.grades, this.grades, this.grades));
               this.grades= [];
               this.conversationDates.push(gradedOn.slice(0,10));
          }else{
               this.cards.forEach(element => {
                 if(element.gradedOn== gradedOn){
                   element.grades.push(parseInt(grade));
                 }      
               });
           }
        }else{
          let categories_data: any[]=[
            {scores: [] },
            {scores: [] },
            {scores: [] },
            {scores: [] },
            {scores: [] },
            {scores: [] },
            {scores: [] },
            {scores: [] }
          ];
          if(this.containsEstimate(gradedOn)){
            var found= false;
            this.estimatecards.forEach(element => {
              if(element.gradedOn== gradedOn && !false){
                found= true;
                element.grades[questionLevelID].scores[index]= grade;
              }      
            });
          }else{
            categories_data[questionLevelID].scores[0]=grade;
            this.estimatecards.push(new CompassDataEstimate(gradedOn, userName, categories_data));
            this.estimateDates.push(gradedOn.slice(0,10));
          }  
        }
      })
    });
  }

  containsCard(date: string): boolean{
    var found= false;
    this.cards.forEach(element => {
      if(element.gradedOn== date){
        found= true;
      }      
    });
    return found;
  }

  containsEstimate(date: string): boolean{
    var found= false;
    this.estimatecards.forEach(element => {
      if(element.gradedOn== date){
        found= true;
      }      
    });
    return found;
  }

  onTypeChange(){
    this.radarChartData=[];
    var colorIndex=0;

    if(this.selectedType=='2'){
      this.dates.clear();
      this.selectedDate= this.estimateDates[0];
      this.estimateDates.forEach(element=>{
        this.dates.add(element);
      });

      this.estimatecards.forEach(element=>{
        var averageGrades: number[]=[];

        element.grades.forEach(score=>{
          var nbr=0;
          var length=0;

           for(var i=0; i<score.scores.length; i++){
            nbr+= parseInt(score.scores[i]);
            console.log('score is '+score.scores[i]);
            console.log('nbr is '+nbr);
            if(parseInt(score.scores[i])!=0){
              length++;
              console.log('length is '+length);
            }
          }
          if(length==0){
            length=1;
          }
          
        console.log('averageGrades is '+Math.round(nbr/length));
         averageGrades.push(Math.round(nbr/length));
        });
        if(element.gradedOn.slice(0,10)== this.selectedDate && this.radarChartData.length<19){
          console.log(averageGrades);
        this.radarChartData.push({data: averageGrades, label: element.userName, backgroundColor: this.colors[colorIndex]});
        colorIndex++;
        }
    });
    }else{
      this.dates.clear();
      this.selectedDate= this.conversationDates[0];
      this.conversationDates.forEach(element=>{
        this.dates.add(element);
    });
    this.cards.forEach(element=>{  
      if(element.gradedOn.slice(0,10)== this.selectedDate && this.radarChartData.length<19){
      this.radarChartData.push({data: element.grades, label: element.userName, backgroundColor: this.colors[colorIndex]});
      colorIndex++;
      }
    });

  }
  this.onDateChange();
}

  onDateChange(){
    this.radarChartData=[];
    var colorIndex=0;

    if(this.selectedType=='2'){
      this.estimatecards.forEach(element=>{
        var averageGrades: number[]=[];

        element.grades.forEach(score=>{
          var nbr=0;
           for(var i=0; i<score.scores.length; i++){
            nbr+= parseInt(score.scores[i]);
          }
          
         averageGrades.push(Math.round(nbr/score.scores.length));
        });
        if(element.gradedOn.slice(0,10)== this.selectedDate && this.radarChartData.length<19){
          this.radarChartData.push({data: averageGrades, label: element.userName, backgroundColor: this.colors[colorIndex]});
          colorIndex++;  
        }
    });
    }else{
    this.cards.forEach(element=>{
      if(element.gradedOn.slice(0,10)== this.selectedDate && this.radarChartData.length<19){
      this.radarChartData.push({data: element.grades, label: element.userName, backgroundColor: this.colors[colorIndex]});
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
}
