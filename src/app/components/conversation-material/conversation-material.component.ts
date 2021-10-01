import { Component, OnInit } from '@angular/core';
import { SingleDataSet, Label} from 'ng2-charts';
import { ChartType, RadialChartOptions, ChartDataSets, Chart } from 'chart.js';

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
  public polarAreaChartData: SingleDataSet = [3, 5, 1, 4, 1, 4, 2, 1];
  public polarAreaLegend = true;

/*   public radarChartData: ChartDataSets[] = [
    { data: [3, 5, 1, 4, 1, 4, 2, 1], 

      borderAlign: 'center',

      backgroundColor: [
        'rgba(255, 99, 132, 0.2)',
        'rgba(54, 162, 235, 0.2)',
        'rgba(255, 206, 86, 0.2)',
        'rgba(75, 192, 192, 0.2)',
        'rgba(153, 102, 255, 0.2)',
        'rgba(255, 100, 64, 0.2)',
        'rgba(153, 50, 255, 0.2)',
        'rgba(255, 70, 64, 0.2)' ],
      
      borderColor: [
        'rgba(255, 99, 132, 1)',
        'rgba(54, 162, 235, 1)',
        'rgba(255, 206, 86, 1)',
        'rgba(75, 192, 192, 1)',
        'rgba(153, 102, 255, 1)',
        'rgba(255, 100, 64, 1)',
        'rgba(153, 50, 255, 1)',
        'rgba(255, 70, 64, 1)' ]
      },
    
  ];
 */
  public polarAreaChartType: ChartType = 'polarArea';
  public radarChartOptions: RadialChartOptions = {
    
    scale: {
      angleLines: {
        display: true,  
        //color: 'black'
        
    },
    gridLines:{
      //color: 'black'
      
    },
      ticks: {
        min: 0,
        max: 5,
        maxTicksLimit: 6,
        fontSize: 15,
        
  },
  },
  title:{
    display: true,
    //position:'bottom'
  },
  legend:{
  },


  };


  selected:string='';

  constructor() {
    
  }

  ngOnInit(): void {
  }

  public chartClicked({ event, active }: { event: MouseEvent, active: {}[] }): void {
    console.log(event, active);
    this.selected='chartClicked';
  }

  public chartHovered({ event, active }: { event: MouseEvent, active: {}[] }): void {
    console.log(event, active);
    this.selected='chartHovered';

  }

}
