import { Component, OnInit } from '@angular/core';
import { ChartDataSets, ChartType, RadialChartOptions } from 'chart.js';
import { defaultColors, Label } from 'ng2-charts';

@Component({
  selector: 'app-need-compass',
  templateUrl: './need-compass.component.html',
  styleUrls: ['./need-compass.component.scss']
})
export class NeedCompassComponent implements OnInit {
  selectedType=1;
  selectedDate= 0;
  
  public radarChartOptions: RadialChartOptions = {
    
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
      labels:{
        fontSize: 15
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
    { data: [1, 4, 0, 4, 1, 4, 5, 0], label: 'Anna Eriksson'},
    { data: [3, 3, 1, 2, 1, 3, 4, 4], label: 'Dalia Bagdadi'},
    { data: [4, 1, 2, 1, 1, 2, 3, 3], label: 'Amina Malak'},
    { data: [1, 4, 0, 4, 1, 4, 5, 0], label: 'Nina Larsson'},
    { data: [1, 4, 0, 4, 1, 4, 5, 0], label: 'Baraa Lund'},
    { data: [1, 4, 0, 4, 1, 4, 5, 0], label: 'Maria Erik'},
    { data: [1, 4, 0, 4, 1, 4, 5, 0], label: 'Lama Lila'},
    { data: [1, 4, 0, 4, 1, 4, 5, 0], label: 'Anna Eriksson'},
    { data: [3, 3, 1, 2, 1, 3, 4, 4], label: 'Dalia Bagdadi'},
    { data: [4, 1, 2, 1, 1, 2, 3, 3], label: 'Amina Malak'},


  ];
  public radarChartType: ChartType = 'radar';

  dates: string[]=[];

  constructor() {
    this.dates=['2021', '2020','2019'];
  }

  ngOnInit(): void {
  }

}
