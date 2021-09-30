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
    responsive: true,
    scale:{
      gridLines:{
        circular: true,
      }
    },
    elements:{
      line:{
        borderWidth:1,
      }
    },
    scales:{
        }
    
  };

  public radarChartLabels: Label[] = ['OMSORG', 'TRYGGHET', 'MÅR BRA', 
                                      'FRITID', 'TILLHÖRIGHET', 'ANSVARSTAGANDE',
                                      'RESPEKTERAS', 'UTVECKLAS'];

  public radarChartData: ChartDataSets[] = [
    { data: [65, 59, 90, 81, 56, 55, 40, 40], label: 'Anna Eriksson', backgroundColor:'transparent' },
    { data: [28, 48, 40, 19, 96, 27, 100, 100], label: 'Dalia Bagdadi' , backgroundColor:'transparent'},
    { data: [28, 48, 30, 19, 10, 27, 50, 80], label: 'Amina Malak' , backgroundColor:'transparent'}

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
