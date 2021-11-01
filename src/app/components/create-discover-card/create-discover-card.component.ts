import { Component, OnInit } from '@angular/core';
import {MatDialog} from '@angular/material/dialog';
import { CreateDiscoverCardDialogComponent } from './create-discover-card-dialog/create-discover-card-dialog.component';
import * as fromState from '../../state';
import { Store } from '@ngrx/store';
import * as fromRoot from '../../../app/state';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import { MatRadioChange } from '@angular/material/radio';
import { ContactGuardianService } from '../../services/contact-guardian/contact-guardian.service';
import { Observable } from 'rxjs';
import { Unit } from 'src/app/models/Unit';


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

  unitNbr: number=0;
  unitString = '0';

  situationComment: string;

  isMeasureTaken: boolean;
  isMeasureTakenComment: string;
  units$: Observable<Unit[]> = new Observable<Unit[]>();

/*
Hämtas automatisk, kalla på ett API för att hämta dem   
  discovererNameControl: string='';
  discovererOrganisationControl: string='';
  discovererTitleControl: string=''; */


  constructor(public dialog: MatDialog,
              private store: Store<fromState.State>,
              private _formBuilder: FormBuilder,
              private contactGuardianService: ContactGuardianService) {}

  ngOnInit(): void {
    this.units$= this.contactGuardianService.getUnits();

    this.createDiscoveCardFormGroup = this._formBuilder.group({
      dateControl: ['', Validators.required],
    /*   discovererNameControl: ['', [Validators.required, Validators.minLength(2)]],
      discovererOrganisationControl: ['', Validators.required],
      discovererTitleControl: ['', Validators.required], */

      nameControl: ['', [Validators.required, Validators.minLength(2)]],
      personNbrControl: ['', [Validators.required,Validators.minLength(10),Validators.maxLength(10)]],
      unitStringControl:['', Validators.required],

      situationCommentControl:['', Validators.required],

    }); 

  }

  changeGuardianNbr(nbr: number){
    this.guardianNbr= nbr;
  }
  changeUnitNbr(name: string, nbr: string){
    this.unitString= name;
    this.unitNbr= parseInt(nbr);

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

isAnonyms(): boolean{
  //eller om enheten är Annat, då kommer kortet att anonymiseras
  if(this.guardians[0][3]=='2'||this.guardians[1][3]=='2'){
    return false;
    // this.text= 'kortet kommer att annomineras för det saknas samtycke';
  }else if(this.unitNbr==7){
    return false;
  }
    // this.text= 'kortet kommer att skickas in';
  return true;
}
  openDialog() {
   if(
      this.createDiscoveCardFormGroup.status== "INVALID" ||
      this.isMeasureTaken==undefined ||
      this.checkChoices()==false){
    this.saveError='Du har missat att fylla i saker';

   }else{
    console.log(this.createDiscoveCardFormGroup.value.dateControl.toLocaleDateString());
   /*  console.log(this.createDiscoveCardFormGroup.value.discovererNameControl);
    console.log(this.createDiscoveCardFormGroup.value.discovererOrganisationControl);
    console.log(this.createDiscoveCardFormGroup.value.discovererTitleControl); */

    this.saveError='';
  
    const dialogRef = this.dialog.open(CreateDiscoverCardDialogComponent, {
      data:{
        isAnonyms: this.isAnonyms(),
     }
    });

    dialogRef.afterClosed().subscribe(result => {
      if(result){

      if(this.isAnonyms()){
        //instructions -> 1 create, 2 spara, 3 anonymisera
        //Här kommer vi anonymisera kortet
        // barnet namn och föräldrarnas namn inte med
        // barnet personnummer och föräldrarnas personnummer inte med

      }else{
        //Här kommer vi skicka in kortet

      }
        this.store.dispatch(new fromRoot.Go({ path: ['discover-card'] }));
      }
    });

   }
    
     }

     save() {
       /* spara för sen */
       console.log(this.unitNbr);
     }
}


