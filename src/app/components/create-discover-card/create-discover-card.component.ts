import { Component, OnInit } from '@angular/core';


export interface PeriodicElement {
  type: string;
  description: string;
  color: string;
}




@Component({
  selector: 'app-create-discover-card',
  templateUrl: './create-discover-card.component.html',
  styleUrls: ['./create-discover-card.component.scss']
})
export class CreateDiscoverCardComponent implements OnInit {
  ELEMENT_DATA: PeriodicElement[] = [
    { color: 'LightBlue', type: 'OMSORG', description: 'Barnet har vuxna i sin närhet som hen kan lita på och vända sig till.'},
    { color: 'LightSalmon',type: 'TRYGGHET', description: 'Barnet skyddas från sådant som kan skada hen i och utanför hemmet.'},
    { color: 'LightSeaGreen',type: 'MÅR BRA', description: 'Barnet har hälsosamma matvanor, god hygien och ett liv fritt från tobak, alkohol och narkotika.'},
    {color: 'LightSteelBlue',type: 'FRITID', description: 'Barnet har fritidsintresse med delaktight från vårdnadshavare eller annan trygg person i dess närhet.'},
    { color: 'LightSlateGrey',type: 'TILLHÖRIGHET',  description: 'Barnet känner tillhörighet och uppskattning av personer som barne möter i sin vardag.'},
    {color: 'LightGreen', type: 'ANSVARSTAGANDE',  description: 'Barnet förstår vas som förväntas av det i sin vardag, visar hänsyn och omtanke inför andra och följer givna regler.'},
    {color: 'LightGoldenRodYellow', type: 'RESPEKTERAS',  description: 'Barnet känner sig sedd, hörd och bekräftad av viktiga personer i sin vardag.'},
    { color: 'LightPink',type: 'UTVECKLAS',  description: 'Barnet utvecklas i fas med sin ålder och tar förmågor att klara av det vardagliga livet.'},
    
  ];

  constructor() { }

  ngOnInit(): void {
  }

}
