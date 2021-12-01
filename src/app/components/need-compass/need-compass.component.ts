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

  selectedType='1';
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
    { data: [0, 4, 0, 4, 1, 4, 5, 0], label: 'Anna Lundberg', backgroundColor:'#003686'},
    { data: [3, 3, 1, 2, 1, 3, 4, 4], label: 'Dalia Sundberg', backgroundColor:'#353370'},
    { data: [4, 1, 2, 1, 1, 2, 3, 3], label: 'Amina Lundberg', backgroundColor:'#e0448c'},
    { data: [0, 4, 0, 4, 1, 4, 5, 0], label: 'Hanna Lundberg', backgroundColor:'#df2d5b'},
    { data: [3, 3, 1, 2, 1, 3, 4, 4], label: 'Dalia Lundberg', backgroundColor:'#eb612d'},
    { data: [4, 1, 2, 1, 1, 2, 3, 3], label: 'Amina Lundberg', backgroundColor:'#f79c2e'},

  ];

  public data: ChartDataSets[]=[
    
    { data: [0, 4, 0, 4, 1, 4, 5, 0], label: 'Karl Sundberg', backgroundColor:'#4ba562'},
    { data: [1, 3, 1, 3, 1, 3, 1, 3], label: 'Gustav Sundberg', backgroundColor:'#31acaf'},
    { data: [4, 1, 2, 1, 1, 2, 3, 3], label: 'Elin Sundberg', backgroundColor:'#2F4F4F'},
    { data: [4, 4, 4, 4, 4, 4, 5, 5], label: 'Tony Sundberg', backgroundColor:'#228B22'},
    { data: [0, 0, 1, 1, 1, 1, 1, 4], label: 'Adnan Sundberg', backgroundColor:'#FF69B4'},
    { data: [4, 1, 2, 1, 1, 2, 3, 3], label: 'Maha Sundberg', backgroundColor:'#CD853F'},

    { data: [1, 2, 3, 4, 5, 0, 1, 2], label: 'Luna Svensson', backgroundColor:'#008080'},
    { data: [3, 3, 1, 1, 1, 1, 4, 4], label: 'Mia Svensson', backgroundColor:'#FF6347'},
    { data: [1, 1, 1, 1, 1, 1, 1, 1], label: 'Maram Svensson', backgroundColor:'#A0522D'},
    { data: [0, 4, 0, 4, 0, 4, 0, 4], label: 'Manal Svensson', backgroundColor:'#808000'},
    { data: [3, 3, 3, 2, 3, 3, 4, 4], label: 'Lama Svensson', backgroundColor:'#DAA520'},
    { data: [4, 4, 2, 4, 1, 4, 3, 4], label: 'Nina Svensson', backgroundColor:'#B22222'},
    { data: [5, 4, 5, 4, 5, 4, 5, 5], label: 'Kalle Svensson', backgroundColor:'#D2691E'},

  ];

  public radarChartType: ChartType = 'radar';

  conversationDates: string[]=[];
  estimateDates: string[]=[];
  dates: string[];

  cards: CompassDataConversation[]= [];
  estimatecards: CompassDataEstimate[]= [];

  grades: number[]= [];

  constructor(private store: Store<fromState.State>,
     private getSetService: GetSetService) { }

  ngOnInit(): void {
    this.current_person$ = this.store.select(fromState.getCurrentPerson);
    this.current_person$.subscribe(data=>{
      this.personID= data?.personID?? '';
    });

    this.getSetService.getCompass(this.personID).subscribe(data=>{
        this.data.map((card: any)=>{
        let questionID: string = card?.questionID ?? '';
        let questionTypeID: string = card?.questionTypeID ?? '';
        let questionLevelID: string = card?.questionLevelID ?? '';
        let personID: string = card?.personID ?? '';
        let userID: string = card?.userID ?? '';
        let grade: string = card?.grade ?? '';
        let comment: string = card?.comment ?? '';
        let gradedOn: string = card?.gradedOn ?? '';

        //it is discovercard
        if(questionTypeID=='1'){
          if(!this.containsCard(gradedOn)){
            this.grades.push(parseInt(grade));
             this.cards.push(new CompassDataConversation(gradedOn, userID, this.grades));
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
            {scores: {}},
            {scores:{}},
            {scores:{}},
            {scores:{}},
            {scores: {}},
            {scores: {}},
            {scores: {}},
            {scores: {}}
          ];
          if(this.containsEstimate(gradedOn)){
            var found= false;
            this.estimatecards.forEach(element => {
              if(element.gradedOn== gradedOn && !false){
                found= true;
                element.grades[questionLevelID].scores.push(grade);
              }      
            });
          }else{
            categories_data[questionLevelID].scores[0]= grade;
            this.estimatecards.push(new CompassDataEstimate(gradedOn, userID, categories_data));
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
      this.dates=[];
      this.estimateDates.forEach(element=>{
        this.dates.push(element);
      });

      this.estimatecards.forEach(element=>{
        var averageGrades: number[]=[];

        element.grades.forEach(scores=>{
          var nbr=0;
          scores.forEach(number => {
            nbr+= number;
          });
          averageGrades.push(nbr/scores.length);
        });

        this.radarChartData.push({data: averageGrades, label: element.userName, backgroundColor: this.colors[colorIndex]});
        colorIndex++;
    });
    }else{
      this.dates=[];
      this.conversationDates.forEach(element=>{
        this.dates.push(element);
    });
    this.cards.forEach(element=>{
      this.radarChartData.push({data: element.grades, label: element.userName, backgroundColor: this.colors[colorIndex]});
      colorIndex++;
    });

  }
}

  onDateChange(){

  }

  toggle(){
    console.log('in the disable');
    this.chart.datasets.forEach(function(e,i){
      e.hidden= !e.hidden;
    });
    
    this.chart.update();
  }
}
