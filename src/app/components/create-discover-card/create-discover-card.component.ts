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
import { User } from 'src/app/models/User';


@Component({
  selector: 'app-create-discover-card',
  templateUrl: './create-discover-card.component.html',
  styleUrls: ['./create-discover-card.component.scss']
})
export class CreateDiscoverCardComponent implements OnInit {
  ELEMENT_DATA = [
    { color: '#ccd8ec', type: 'OMSORG', id: 'care', description: 'Barnet har vuxna i sin närhet som hen kan lita på och vända sig till.'},
    { color: '#dbd9e6',type: 'TRYGGHET',id: 'security', description: 'Barnet skyddas från sådant som kan skada hen i och utanför hemmet.'},
    { color: '#ffdcee',type: 'MÅR BRA',id: 'feel_good', description: 'Barnet har hälsosamma matvanor, god hygien och ett liv fritt från tobak, alkohol och narkotika.'},
    { color: '#fbdae1',type: 'FRITID',id: 'free_time', description: 'Barnet har fritidsintresse med delaktight från vårdnadshavare eller annan trygg person i dess närhet.'},
    { color: '#fee4d7',type: 'TILLHÖRIGHET',id: 'beloning', description: 'Barnet känner tillhörighet och uppskattning av personer som barne möter i sin vardag.'},
    { color: '#fcedd6', type: 'ANSVARSTAGANDE',id: 'responsibility', description: 'Barnet förstår vas som förväntas av det i sin vardag, visar hänsyn och omtanke inför andra och följer givna regler.'},
    { color: '#d9f2e4', type: 'RESPEKTERAS',id: 'respect', description: 'Barnet känner sig sedd, hörd och bekräftad av viktiga personer i sin vardag.'},
    { color: '#d1f3f3',type: 'UTVECKLAS',id: 'develop', description: 'Barnet utvecklas i fas med sin ålder och tar förmågor att klara av det vardagliga livet.'},
    
  ];

  choices=[
    {type:'OMSORG', choice: 0},
    {type:'TRYGGHET', choice: 0},
    {type:'MÅR BRA', choice:0},
    {type:'FRITID', choice:0},
    {type:'TILLHÖRIGHET', choice:0},
    {type:'ANSVARSTAGANDE', choice:0},
    {type:'RESPEKTERAS', choice:0},
    {type:'UTVECKLAS', choice:0}
  ];
  createDiscoveCardFormGroup: FormGroup;
  saveError='';

  guardianNbr: number=2;
  selected = '2';

  guardians: string[][]=[['','', '0', '0'],['','','0','0']];
  comments: string[]=['','','','','','','',''];

  unitNbr: number=0;
  unitString = '0';

  situationComment: string= '';

  isMeasureTaken: number=0;
  isMeasureTakenComment: string='';
  units$: Observable<Unit[]> = new Observable<Unit[]>();
  current_user$: Observable<User | null> = new Observable<User | null>();
  current_user: User;


  constructor(public dialog: MatDialog,
              private store: Store<fromState.State>,
              private _formBuilder: FormBuilder,
              private contactGuardianService: ContactGuardianService) {}

  ngOnInit(): void {
    this.units$= this.contactGuardianService.getUnits();
    this.current_user$= this.store.select(fromState.getCurrentUser);
      this.current_user$.subscribe(data=>{
        let userID:string = data?.userID ?? '';
        let lastName:string = data?.lastName ?? '';
        let firstName:string = data?.firstName ?? '';
        let email:string = data?.email ?? '';
        let roleID:string = data?.roleID ?? '';
        let description:string = data?.description ?? '';

        this.current_user= new User(userID, firstName, lastName,
                                    email, roleID, description);
      });  
    
    this.createDiscoveCardFormGroup = this._formBuilder.group({
      nameControl: ['', [Validators.required, Validators.minLength(2)]],
      personNbrControl: ['', [Validators.required, Validators.minLength(12),Validators.maxLength(12), Validators.pattern("^[0-9]*$"),]],
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
  var obj1 = this.choices.filter(x => x.type == data.type)[0];
  obj1.choice= parseInt(event.value);
}

radioChangefour(event: MatRadioChange, index1: number, index2: number) {
  this.guardians[index1][index2]= event.value;
}

checkChoices(): boolean{
  var emptyChoice = true;
  this.choices.forEach(element => {
    if(element.choice==0){
      emptyChoice= false;
      }    
  });
  return emptyChoice;
}

isAnonyms(): boolean{
  if(this.unitNbr==7){
    return false;
  } else if(this.guardianNbr==2 &&
    (this.guardians[0][3]!='1'||this.guardians[1][3]!='1'||
    this.guardians[0][2]!='1'||this.guardians[1][2]!='1')){
    return false;
  }else if(this.guardianNbr==1 &&
    (this.guardians[0][3]!='1'|| this.guardians[0][2]!='1')){
    return false;
  }
  return true;
}

     public goBack(): void {
      this.store.dispatch(new fromRoot.Back());
    }
  
     send(number: number) {

/*     --status 0 = anonymisera
      --status 1 = skicka in
      --status 2 = spara
      
 */      
      var names = this.createDiscoveCardFormGroup.value.nameControl.split(' ');
      var firstName = names[0];
      var lastName = names[1];

      var card= {
        UserID: parseInt(this.current_user.userID),
        PersonLastName: lastName,
        PersonFirstName: firstName,
        PersonNbr: String(this.createDiscoveCardFormGroup.value.personNbrControl),

        GuardianName1: this.guardians[0][0],
        GuardianNbr1: String(this.guardians[0][1]),
        GuardianName2: this.guardians[1][0],
        GuardianNbr2: String(this.guardians[1][1]),

        Unit: this.unitString,
        Situation: this.createDiscoveCardFormGroup.value.situationCommentControl,

        GradeActions: this.isMeasureTaken,
        CommentActions: this.isMeasureTakenComment,

        GradeOmsorg: this.choices[0].choice,
        CommentOmsorg: this.comments[0],
        GradeTrygghet: this.choices[1].choice,
        CommentTrygghet: this.comments[1],
        GradeMarBra: this.choices[2].choice,
        CommentMarBra: this.comments[2],
        GradeFritid: this.choices[3].choice,
        CommentFritid: this.comments[3],
        GradeTillhorighet: this.choices[4].choice,
        CommentTillhorighet: this.comments[4],
        GradeAnsvartagande: this.choices[5].choice,
        CommentAnsvartagande: this.comments[5],
        GradeRespekteras: this.choices[6].choice,
        CommentRespekteras: this.comments[6],
        GradeUtvecklas: this.choices[7].choice,
        CommentUtvecklas: this.comments[7],

        GradeUpprattats1: parseInt(this.guardians[0][2]),
        GradeUpprattats2: parseInt(this.guardians[0][3]),
        GradeSamtycke1: parseInt(this.guardians[1][2]),
        GradeSamtycke2: parseInt(this.guardians[1][3]),
        Status: number,

      };

      console.log(card);

       if(number==1){

        if( this.createDiscoveCardFormGroup.status== "INVALID" 
        || this.isMeasureTaken==0 || !this.checkChoices()){
          
          this.saveError='Du har missat att fylla i saker';
     }else{ 
      this.saveError='';

      const dialogRef = this.dialog.open(CreateDiscoverCardDialogComponent, {
        data:{
          isAnonyms: this.isAnonyms(),
       }
      });
  
      dialogRef.afterClosed().subscribe(result => {
        if(result){
          console.log('Hello');

        if(!this.isAnonyms()){
          // barnet namn och föräldrarnas namn inte med
          // barnet personnummer och föräldrarnas personnummer inte med
          card.Status= 0;
          card.PersonLastName= '0';
          card.PersonFirstName= '0';
          card.PersonNbr= '0';

          card.GuardianName1= '0';
          card.GuardianNbr1= '0';
          card.GuardianName2= '0';
          card.GuardianNbr2= '0';

        }
        this.store.dispatch(new fromState.CreateDiscoverCard(card));
        }
      });
     }
       }else{
        this.store.dispatch(new fromState.CreateDiscoverCard(card));
       }
    }
}


