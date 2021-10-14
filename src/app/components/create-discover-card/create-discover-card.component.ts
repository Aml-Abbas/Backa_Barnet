import { Component, OnInit } from '@angular/core';
import {MatDialog} from '@angular/material/dialog';
import { CreateDiscoverCardDialogComponent } from './create-discover-card-dialog/create-discover-card-dialog.component';
import * as fromState from '../../state';
import { Store } from '@ngrx/store';
import * as fromRoot from '../../../app/state';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import { MatRadioChange } from '@angular/material/radio';


@Component({
  selector: 'app-create-discover-card',
  templateUrl: './create-discover-card.component.html',
  styleUrls: ['./create-discover-card.component.scss']
})
export class CreateDiscoverCardComponent implements OnInit {
  ELEMENT_DATA = [
    { color: '#ccd8ec', type: 'OMSORG', id: 'care', description: 'Barnet har vuxna i sin närhet som hen kan lita på och vända sig till.', selected:'false'},
    { color: '#dbd9e6',type: 'TRYGGHET',id: 'security', description: 'Barnet skyddas från sådant som kan skada hen i och utanför hemmet.', selected:'false'},
    { color: '#ffdcee',type: 'MÅR BRA',id: 'feel_good', description: 'Barnet har hälsosamma matvanor, god hygien och ett liv fritt från tobak, alkohol och narkotika.', selected:'false'},
    { color: '#fbdae1',type: 'FRITID',id: 'free_time', description: 'Barnet har fritidsintresse med delaktight från vårdnadshavare eller annan trygg person i dess närhet.', selected:'false'},
    { color: '#fee4d7',type: 'TILLHÖRIGHET',id: 'beloning', description: 'Barnet känner tillhörighet och uppskattning av personer som barne möter i sin vardag.', selected:'false'},
    { color: '#fcedd6', type: 'ANSVARSTAGANDE',id: 'responsibility', description: 'Barnet förstår vas som förväntas av det i sin vardag, visar hänsyn och omtanke inför andra och följer givna regler.', selected:'false'},
    { color: '#d9f2e4', type: 'RESPEKTERAS',id: 'respect', description: 'Barnet känner sig sedd, hörd och bekräftad av viktiga personer i sin vardag.', selected:'false'},
    { color: '#d1f3f3',type: 'UTVECKLAS',id: 'develop', description: 'Barnet utvecklas i fas med sin ålder och tar förmågor att klara av det vardagliga livet.', selected:'false'},
    
  ];

  choices=[
    {type:'OMSORG', choice:''},
    {type:'TRYGGHET', choice:''},
    {type:'MÅR BRA', choice:''},
    {type:'FRITID', choice:''},
    {type:'TILLHÖRIGHET', choice:''},
    {type:'ANSVARSTAGANDE', choice:''},
    {type:'RESPEKTERAS', choice:''},
    {type:'UTVECKLAS', choice:''}
  ];
  createDiscoveCardFormGroup: FormGroup;
  saveError='';

  guardianNbr: number=2;
  selected = '2';

  guardians: string[][]=[['','', '', ''],['','','','']];
  comments: string[]=[];

  personCotactName: string;
  situationComment: string;

  isMeasureTaken: boolean;
  isMeasureTakenComment: string;

  constructor(public dialog: MatDialog,
              private store: Store<fromState.State>,
              private _formBuilder: FormBuilder) {}

  ngOnInit(): void {
    this.createDiscoveCardFormGroup = this._formBuilder.group({
      dateControl: ['', Validators.required],
      discovererNameControl: ['', [Validators.required, Validators.minLength(2)]],
      discovererOrganisationControl: ['', Validators.required],
      discovererTitleControl: ['', Validators.required],

      nameControl: ['', [Validators.required, Validators.minLength(2)]],
      personNbrControl: ['', [Validators.required,Validators.minLength(10),Validators.maxLength(10)]],

      situationCommentControl:['', Validators.required],

    }); 

  }

  changeGuardianNbr(nbr: number){
    this.guardianNbr= nbr;
  }

  radioChange(event: MatRadioChange) {
    this.isMeasureTaken = event.value;
}

radioChangeThree(event: MatRadioChange, data) {

  var obj = this.ELEMENT_DATA.filter(x => x.type == data.type)[0];  
  var obj1 = this.choices.filter(x => x.type == data.type)[0];

  obj1.choice= event.value;
  obj.selected = event.value;
}

radioChangefour(event: MatRadioChange, index1: number, index2: number) {
  this.guardians[index1][index2]= event.value;
  console.log(this.guardians);
}

checkChoices(): boolean{
  var emptyChoice = true;
  this.choices.forEach(element => {
    if(element.choice==''){
      emptyChoice= false;
      }    
  });
  return emptyChoice;
}

  openDialog() {
   if(
      this.createDiscoveCardFormGroup.status== "INVALID" ||
      this.isMeasureTaken==undefined ||
      this.checkChoices()==false){
    this.saveError='Du har missat att fylla i saker';

   }else{
    console.log(this.createDiscoveCardFormGroup.value.dateControl.toLocaleDateString());
    console.log(this.createDiscoveCardFormGroup.value.discovererNameControl);
    console.log(this.createDiscoveCardFormGroup.value.discovererOrganisationControl);
    console.log(this.createDiscoveCardFormGroup.value.discovererTitleControl);

    this.saveError='';
    const dialogRef = this.dialog.open(CreateDiscoverCardDialogComponent, {
      data:{
  }
    });

    dialogRef.afterClosed().subscribe(result => {
      if(result){
        this.store.dispatch(new fromRoot.Go({ path: ['discover-card'] }));
      }
    });

   }
    
     }

     save() {
       
     }
}


