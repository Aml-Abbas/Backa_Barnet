import { Component, OnInit } from '@angular/core';
import { ChartDataSets, ChartType, RadialChartOptions } from 'chart.js';
import { Label } from 'ng2-charts';

@Component({
  selector: 'app-need-compass',
  templateUrl: './need-compass.component.html',
  styleUrls: ['./need-compass.component.scss']
})
export class NeedCompassComponent implements OnInit {
  public radarChartOptions: RadialChartOptions = {
    responsive: true ,
    title:{
display: true,
//text:'helllo'
    },
       scale:{
      gridLines:{
        circular: true,
        color: 'black'

      },
       angleLines: {
            display: true,
            color: 'black'
        },
        ticks: {
          min: 0,
          max: 5,
          maxTicksLimit: 6,
          fontSize: 15,
    }
    },
    elements:{
      rectangle:{
        borderWidth:50,
        backgroundColor:'pink'
      },point:{
       // borderWidth: 30,
      }, line:{
        borderWidth:1,
        tension: 0.15,
        fill: false
      },
    },
    legend:{
      labels:{
        fontSize: 15,
      }, 
    }
  };

  public radarChartLabels: Label[] = ['OMSORG', 'TRYGGHET', 'MÅR BRA', 
                                      'FRITID', 'TILLHÖRIGHET', 'ANSVARSTAGANDE',
                                      'RESPEKTERAS', 'UTVECKLAS'];

  public radarChartData: ChartDataSets[] = [
    { data: [1, 4, 0, 4, 1, 4, 5, 0], label: 'Anna Eriksson'},
    { data: [3, 3, 1, 2, 1, 3, 4, 4], label: 'Dalia Bagdadi'},
    { data: [4, 1, 2, 1, 1, 2, 3, 3], label: 'Amina Malak'}
  ];
  public radarChartType: ChartType = 'radar';

  constructor() {
    
  }

  ngOnInit(): void {
  }

  public chartClicked({ event, active }: { event: MouseEvent, active: {}[] }): void {
    console.log(event, active);
  }

  public chartHovered({ event, active }: { event: MouseEvent, active: {}[] }): void {
    console.log(event, active);
  }

}
