import { Component, OnInit } from '@angular/core';


export interface PeriodicElement {
  type: string;
  describtion: string;
}

const ELEMENT_DATA: PeriodicElement[] = [
  { type: 'OMSORG', describtion: 'Barnet har vuxna i sin närhet som hen kan lita på och vända sig till.'},
  { type: 'TRYGGHET', describtion: 'Barnet skyddas från sådant som kan skada hen i och utanför hemmet.'},
  { type: 'MÅR BRA', describtion: 'Barnet har hälsosamma matvanor, god hygien och ett liv fritt från tobak, alkohol och narkotika.'},
  {type: 'FRITID', describtion: 'Barnet har fritidsintresse med delaktight från vårdnadshavare eller annan trygg person i dess närhet.'},
  { type: 'TILLHÖRIGHET',  describtion: 'Barnet känner tillhörighet och uppskattning av personer som barne möter i sin vardag.'},
  { type: 'ANSVARSTAGANDE',  describtion: 'Barnet förstår vas som förväntas av det i sin vardag, visar hänsyn och omtanke inför andra och följer givna regler.'},
  { type: 'RESPEKTERAS',  describtion: 'Barnet känner sig sedd, hörd och bekräftad av viktiga personer i sin vardag.'},
  { type: 'UTVECKLAS',  describtion: 'Barnet utvecklas i fas med sin ålder och tar förmågor att klara av det vardagliga livet.'},
  
];


@Component({
  selector: 'app-create-discover-card',
  templateUrl: './create-discover-card.component.html',
  styleUrls: ['./create-discover-card.component.scss']
})
export class CreateDiscoverCardComponent implements OnInit {
  displayedColumns: string[] = ['type', 'describtion'];
  dataSource = ELEMENT_DATA;

  constructor() { }

  ngOnInit(): void {
  }

}
