import { Component, OnInit } from '@angular/core';
import { SingleDataSet, Label} from 'ng2-charts';
import { ChartType } from 'chart.js';

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
  public polarAreaChartData: SingleDataSet = [300, 500, 100, 40, 120, 50, 70, 30];
  public polarAreaLegend = true;

  public polarAreaChartType: ChartType = 'polarArea';

  constructor() {}

  ngOnInit(): void {
  }

  public chartClicked({ event, active }: { event: MouseEvent, active: {}[] }): void {
    console.log(event, active);
  }

  public chartHovered({ event, active }: { event: MouseEvent, active: {}[] }): void {
    console.log(event, active);
  }

}
