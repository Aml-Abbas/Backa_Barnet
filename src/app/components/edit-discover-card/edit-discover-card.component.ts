import { Component, OnInit } from '@angular/core';
import { Card } from 'src/app/models/Card';
import { Observable } from 'rxjs';
import * as fromState from '../../state';
import { Store } from '@ngrx/store';
import { ComponentCanDeactivate } from 'src/app/interfaces/component-can-deactivate';
import { MatRadioChange } from '@angular/material/radio';
import { GetSetService } from '../../services/get-set/get-set.service';
import { MatDialog } from '@angular/material/dialog';
import { Unit } from 'src/app/models/Unit';
import * as fromRoot from '../../../app/state';

@Component({
  selector: 'app-edit-discover-card',
  templateUrl: './edit-discover-card.component.html',
  styleUrls: ['./edit-discover-card.component.scss']
})
export class EditDiscoverCardComponent implements OnInit , ComponentCanDeactivate{
  canDeactivate(): boolean {
    return !this.isDirty;
  }

  current_card$= new Observable<Card | null>();
  card: Card;

  isDirty = false;

  ELEMENT_DATA = [
    { color: '#ccd8ec', type: 'OMSORG', id: 'care', description: 'Barnet har vuxna i sin närhet som hen kan lita på och vända sig till.' },
    { color: '#dbd9e6', type: 'TRYGGHET', id: 'security', description: 'Barnet skyddas från sådant som kan skada hen i och utanför hemmet.' },
    { color: '#ffdcee', type: 'MÅR BRA', id: 'feel_good', description: 'Barnet har hälsosamma matvanor, god hygien och ett liv fritt från tobak, alkohol och narkotika.' },
    { color: '#fbdae1', type: 'FRITID', id: 'free_time', description: 'Barnet har fritidsintresse med delaktight från vårdnadshavare eller annan trygg person i dess närhet.' },
    { color: '#fee4d7', type: 'TILLHÖRIGHET', id: 'beloning', description: 'Barnet känner tillhörighet och uppskattning av personer som barne möter i sin vardag.' },
    { color: '#fcedd6', type: 'ANSVARSTAGANDE', id: 'responsibility', description: 'Barnet förstår vas som förväntas av det i sin vardag, visar hänsyn och omtanke inför andra och följer givna regler.' },
    { color: '#d9f2e4', type: 'RESPEKTERAS', id: 'respect', description: 'Barnet känner sig sedd, hörd och bekräftad av viktiga personer i sin vardag.' },
    { color: '#d1f3f3', type: 'UTVECKLAS', id: 'develop', description: 'Barnet utvecklas i fas med sin ålder och tar förmågor att klara av det vardagliga livet.' },

  ];

  choices = [
    { type: 'OMSORG', choice: 4 },
    { type: 'TRYGGHET', choice: 4 },
    { type: 'MÅR BRA', choice: 4 },
    { type: 'FRITID', choice: 4 },
    { type: 'TILLHÖRIGHET', choice: 4 },
    { type: 'ANSVARSTAGANDE', choice: 4 },
    { type: 'RESPEKTERAS', choice: 4 },
    { type: 'UTVECKLAS', choice: 4 }
  ];
  
/*   saveError = '';
  nameError = '';
  personNbrError = '';
  measureError = '';
  unitError = '';
  situationError = '';
  categoryError = '';
  informMesg = ''; */

  guardianNbr: number = 2;
  selected = '2';
  units$: Observable<Unit[]> = new Observable<Unit[]>();

  // comments: string[] = [];
  guardians = {};
/* 
  guardiansError = [
    { name: '', personNbr: '' },
    { name: '', personNbr: '' },
  ];
 */
  unitNbr: number = -1;
  unitString = '-1';
/* 
  situationComment: string;

  isMeasureTaken: number = 2;
  isMeasureTakenComment: string;

  personNbr: string; */

  constructor(public dialog: MatDialog,
    private store: Store<fromState.State>,
    private getSetService: GetSetService) { }

  ngOnInit(): void {

    this.current_card$ = this.store.select(fromState.getCurrentCard);
    this.current_card$.subscribe(data=>{
      let id: string = data?.id ?? '';
      let gradedOn: string = data?.gradedOn ?? '';
      let userName: string = data?.userName ?? '';
      let userOrg: string = data?.userOrg ?? '';
      let userTitle: string = data?.userTitle ?? '';

      let personName: string = data?.personName ?? '';
      let personNbr: string = data?.personNbr ?? '';

      let guardian1: string = data?.guardian1 ?? '';
      let guardianPersonNbr1: string = data?.guardianPersonNbr1 ?? '';
      let guardian2: string = data?.guardian2 ?? '';
      let guardianPersonNbr2: string = data?.guardianPersonNbr2 ?? '';

      let healthTeam: string = data?.healthTeam ?? '';
      let situation: string = data?.situation ?? '';

      let questions: string[] = data?.questions ?? [];
      let grades: string[] = data?.grades ?? [];
      let comments: string[] = data?.comments ?? [];
      let status: string = data?.status ?? '';

      this.card = new Card(id, gradedOn, userName, userOrg, userTitle, personName, 
        personNbr, guardian1, guardianPersonNbr1, guardian2, guardianPersonNbr2, 
        healthTeam, situation, questions, grades, comments, status);

    });

    this.units$ = this.getSetService.getUnits();
    if(this.card.guardian2=='Dolt'){
      this.selected= '1';
      this.guardianNbr=1;
    }
    this.guardians = [
      { name: this.card.guardian1, personNbr: this.card.guardianPersonNbr1, 
        inform: '0', samtycke: '0' },

      { name: this.card.guardian2, personNbr: this.card.guardianPersonNbr2, 
        inform: '0', samtycke: '0'},
    ];
    
    if(this.card.grades[9]=='1'){
      this.guardians[0].inform='1';
    }
    else if (this.card.grades[9]=='2'){
      this.guardians[0].inform='1';
      this.guardians[1].inform='1';
    }

    if(this.card.grades[10]=='1'){
      this.guardians[0].samtycke='1';
    }
    else if (this.card.grades[9]=='2'){
      this.guardians[0].samtycke='1';
      this.guardians[1].samtycke='1';
    }
    this.unitString = this.card.healthTeam;

    this.units$.subscribe(data=>{
      data.map((unit: Unit)=>{
        if(unit.unitName==this.unitString){
          this.unitNbr = parseInt(unit.unitID);
        }
      })
      
    });

  }

  changeGuardianNbr(nbr: number) {
    this.guardianNbr = nbr;
  }
  changeUnitNbr(name: string, nbr: string) {
    this.unitString = name;
    this.unitNbr = parseInt(nbr);
  }
  radioChange(event: MatRadioChange) {
    this.card.grades[8] = event.value;
  }
  radioChangeThree(event: MatRadioChange, data) {
    var obj1 = this.choices.filter(x => x.type == data.type)[0];
    obj1.choice = parseInt(event.value);
  }
  radioChangeInform(event: MatRadioChange, index1: number) {
    this.guardians[index1].inform = event.value;
  }
  radioChangeSamtycke(event: MatRadioChange, index1: number) {
    this.guardians[index1].samtycke = event.value;
  }
  public goBack(): void {
    this.store.dispatch(new fromRoot.Back());
  }

  send(number: number) {
  }
}
