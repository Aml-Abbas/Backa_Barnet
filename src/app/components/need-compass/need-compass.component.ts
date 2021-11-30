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

  dates: string[]=[];

  data_dates: string[]=['2015','2014','2013'];

  constructor(private store: Store<fromState.State>) {
    this.dates=['2021', '2020','2019'];
  }

  ngOnInit(): void {
    this.current_person$ = this.store.select(fromState.getCurrentPerson);
    this.current_person$.subscribe(data=>{
    });

  }

  onTypeChange(){
    console.log('typeChanged');
    this.radarChartData=[];
    
    if(this.selectedType=='2'){
      this.data.forEach(element=>{
        console.log('pushing data');
        this.radarChartData.push(element);
      });
    }
  }

  onDateChange(){

  }

  
}
