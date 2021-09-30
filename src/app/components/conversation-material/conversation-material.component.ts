import { Component, OnInit } from '@angular/core';
import { SingleDataSet, Label} from 'ng2-charts';
import { ChartType, RadialChartOptions, ChartDataSets } from 'chart.js';

@Component({
  selector: 'app-conversation-material',
  templateUrl: './conversation-material.component.html',
  styleUrls: ['./conversation-material.component.scss']
})
export class ConversationMaterialComponent implements OnInit {
  public polarAreaChartLabels: Label[] = ['OMSORG', 'TRYGGHET',
                                             'MÅR BRA', 'FRITID',
                                              'TILLHÖRIGHET', 'ANSVARSTAGANDE',
                                              'RESPEKTERAS', 'UTVECKLAS'];
  public polarAreaChartData: SingleDataSet = [300, 500, 100, 400, 120, 500, 700, 300];
  public polarAreaLegend = true;

  public radarChartData: ChartDataSets[] = [
    { data: [300, 500, 100, 400, 120, 500, 700, 300],
      
      backgroundColor: [
        'rgba(255, 99, 132, 0.3)',
        'rgba(54, 162, 235, 0.3)',
        'rgba(255, 206, 86, 0.3)',
        'rgba(75, 192, 192, 0.3)',
        'rgba(153, 102, 255, 0.3)',
        'rgba(255, 100, 64, 0.3)',
        'rgba(153, 50, 255, 0.3)',
        'rgba(255, 70, 64, 0.3)' ],
      
      borderColor: [
        'rgba(255, 99, 132, 1)',
        'rgba(54, 162, 235, 1)',
        'rgba(255, 206, 86, 1)',
        'rgba(75, 192, 192, 1)',
        'rgba(153, 102, 255, 1)',
        'rgba(255, 100, 64, 1)',
        'rgba(153, 50, 255, 1)',
        'rgba(255, 70, 64, 1)' ]
      }
  ];

  public polarAreaChartType: ChartType = 'polarArea';
  public radarChartOptions: RadialChartOptions = {
    scale: {
      ticks: {
        backdropColor: 'transparent',
      }
  },
  elements:{
    
  }
  };

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
