import { Component, OnInit } from '@angular/core';
import {MatDialog} from '@angular/material/dialog';
import { CreateDiscoverCardDialogComponent } from './create-discover-card-dialog/create-discover-card-dialog.component';
import * as fromState from '../../state';
import { Store } from '@ngrx/store';
import * as fromRoot from '../../../app/state';


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
    { color: '#ccd8ec', type: 'OMSORG', description: 'Barnet har vuxna i sin närhet som hen kan lita på och vända sig till.'},
    { color: '#dbd9e6',type: 'TRYGGHET', description: 'Barnet skyddas från sådant som kan skada hen i och utanför hemmet.'},
    { color: '#ffdcee',type: 'MÅR BRA', description: 'Barnet har hälsosamma matvanor, god hygien och ett liv fritt från tobak, alkohol och narkotika.'},
    {color: '#fbdae1',type: 'FRITID', description: 'Barnet har fritidsintresse med delaktight från vårdnadshavare eller annan trygg person i dess närhet.'},
    { color: '#fee4d7',type: 'TILLHÖRIGHET',  description: 'Barnet känner tillhörighet och uppskattning av personer som barne möter i sin vardag.'},
    {color: '#fcedd6', type: 'ANSVARSTAGANDE',  description: 'Barnet förstår vas som förväntas av det i sin vardag, visar hänsyn och omtanke inför andra och följer givna regler.'},
    {color: '#d9f2e4', type: 'RESPEKTERAS',  description: 'Barnet känner sig sedd, hörd och bekräftad av viktiga personer i sin vardag.'},
    { color: '#d1f3f3',type: 'UTVECKLAS',  description: 'Barnet utvecklas i fas med sin ålder och tar förmågor att klara av det vardagliga livet.'},
    
  ];
  labelPosition: 'before' | 'after' = 'after';

  guardianNbr: number=1;
  selected = '1';

  name = '';
  personNbr = '';
  adress = '';
  guardianName1 = '';

  constructor(public dialog: MatDialog,
              private store: Store<fromState.State>) { 
  }

  ngOnInit(): void {
  }

  changeGuardianNbr(nbr: number){
    this.guardianNbr= nbr;
  }

  openDialog() {
    const dialogRef = this.dialog.open(CreateDiscoverCardDialogComponent, {
      data:{
        name: this.name,
        personNbr: this.personNbr,
        adress: this.adress,
        guardianName1: this.guardianName1
      }
    });

    dialogRef.afterClosed().subscribe(result => {
      if(result){
        this.store.dispatch(new fromRoot.Go({ path: ['discover-card'] }));
      }
    });
  }


}


