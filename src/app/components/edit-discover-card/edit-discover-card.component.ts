import { Component, OnInit } from '@angular/core';
import { Card } from 'src/app/models/Card';
import { Observable } from 'rxjs';
import * as fromState from '../../state';
import { Store } from '@ngrx/store';
import { ComponentCanDeactivate } from 'src/app/interfaces/component-can-deactivate';
import { CreateDiscoverCardDialogComponent } from '../create-discover-card/create-discover-card-dialog/create-discover-card-dialog.component';
import { GetSetService } from '../../services/get-set/get-set.service';
import { MatDialog } from '@angular/material/dialog';
import { Unit } from 'src/app/models/Unit';
import * as fromRoot from '../../../app/state';
import { User } from 'src/app/models/User';

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
  
   saveError = '';
  nameError = '';
  personNbrError = '';
  measureError = '';
  unitError = '';
  situationError = '';
  categoryError = '';
  informMesg = '';

  guardianNbr: number = 2;
  selected = '2';
  units$: Observable<Unit[]> = new Observable<Unit[]>();

  // comments: string[] = [];
  guardians = {};
 
  guardiansError = [
    { name: '', personNbr: '' },
    { name: '', personNbr: '' },
  ];
 
  unitNbr: number = -1;
  unitString = '-1';
/* 
  situationComment: string;

  isMeasureTaken: number = 2;
  isMeasureTakenComment: string;

  personNbr: string; */

  current_user$: Observable<User | null> = new Observable<User | null>();
  current_user: User;

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

    this.current_user$ = this.store.select(fromState.getCurrentUser);
    this.current_user$.subscribe(data => {
      let userID: string = data?.userID ?? '';
      let lastName: string = data?.lastName ?? '';
      let firstName: string = data?.firstName ?? '';
      let email: string = data?.email ?? '';
      let roleID: string = data?.roleID ?? '';
      let description: string = data?.description ?? '';

      this.current_user = new User(userID, firstName, lastName,
        email, roleID, description);
    });

  }

  changeGuardianNbr(nbr: number) {
    this.guardianNbr = nbr;
  }


  public goBack(): void {
    this.store.dispatch(new fromRoot.Back());
  }

  send(number: number) {



    var person_name = this.card.personName.split(' ');
    var firstName = person_name[0];
    var lastName = person_name[1];
    var personNbr = this.card.personNbr;

    this.card.guardian1= this.guardians[0].name ?? '0';
    this.card.guardianPersonNbr1= this.guardians[0].name ?? '0';
    this.card.guardian2= this.guardians[1].name ?? '0';
    this.card.guardian1= this.guardians[0].name ?? '0';

   /*  var card = {
      UserID: parseInt(this.current_user.userID) ?? 0,
      PersonLastName: lastName ?? '0',
      PersonFirstName: firstName ?? '0',
      PersonNbr: String(this.createDiscoveCardFormGroup.value.personNbrControl) ?? '0',

      GuardianName1: this.guardians[0].name ?? '0',
      GuardianNbr1: String(this.guardians[0].personNbr) ?? '0',
      GuardianName2: this.guardians[1].name ?? '0',
      GuardianNbr2: String(this.guardians[1].personNbr) ?? '0',

      Unit: this.unitString ?? '0',
      Situation: this.createDiscoveCardFormGroup.value.situationCommentControl ?? '0',

      GradeActions: this.isMeasureTaken,
      CommentActions: this.isMeasureTakenComment ?? '0',

      GradeOmsorg: this.choices[0].choice,
      CommentOmsorg: this.comments[0] ?? '0',
      GradeTrygghet: this.choices[1].choice,
      CommentTrygghet: this.comments[1] ?? '0',
      GradeMarBra: this.choices[2].choice,
      CommentMarBra: this.comments[2] ?? '0',
      GradeFritid: this.choices[3].choice,
      CommentFritid: this.comments[3] ?? '0',
      GradeTillhorighet: this.choices[4].choice,
      CommentTillhorighet: this.comments[4] ?? '0',
      GradeAnsvarstagande: this.choices[5].choice,
      CommentAnsvarstagande: this.comments[5] ?? '0',
      GradeRespekteras: this.choices[6].choice,
      CommentRespekteras: this.comments[6] ?? '0',
      GradeUtvecklas: this.choices[7].choice,
      CommentUtvecklas: this.comments[7] ?? '0',

      GradeUpprattats1: parseInt(this.guardians[0].inform),
      GradeUpprattats2: parseInt(this.guardians[1].inform),
      GradeSamtycke1: parseInt(this.guardians[0].samtycke),
      GradeSamtycke2: parseInt(this.guardians[1].samtycke),
      Status: number,
    };

    console.log(card);

    var isSendAvailable = true;
    console.log('isSendAvailable is true');
    this.nameError = '';
    this.saveError = '';
    this.personNbrError = '';
    this.guardiansError[0].name = '';
    this.guardiansError[1].name = '';
    this.guardiansError[0].personNbr = '';
    this.guardiansError[1].personNbr = '';
    this.measureError = '';

    if (person_name.length != 2) {
      this.nameError = 'För och efternamn behövs, glöm inte mellan slag mellan dem.';
      this.saveError = 'Du har missat att fylla i saker';
      isSendAvailable = false;
    } if (this.createDiscoveCardFormGroup.controls.personNbrControl.status == "INVALID" || this.personNbr.toString().length != 12) {
      this.personNbrError = 'Personnummer ska innehålla 12 siffror';
      this.saveError = 'Du har missat att fylla i saker';
      isSendAvailable = false;
    }
    if (this.createDiscoveCardFormGroup.status == "INVALID") {
      this.saveError = 'Du har missat att fylla i saker';
      isSendAvailable = false;

    } if (this.guardians[0].name == undefined) {
      this.guardiansError[0].name = 'Vårdnadshavares namn ska vara med.'
      this.saveError = 'Du har missat att fylla i saker';
      isSendAvailable = false;
    } if (this.guardians[0].name != undefined) {
      var names1 = String(this.guardians[0].name).split(' ');
      if (names1[1] == '' || names1.length < 2) {
        this.guardiansError[0].name = 'Vårdnadshavares för och efternamn ska vara med.'
        this.saveError = 'Du har missat att fylla i saker';
        isSendAvailable = false;
      }
    } if (this.guardians[1].name == undefined && this.guardianNbr == 2) {
      this.guardiansError[1].name = 'Vårdnadshavares namn ska vara med.'
      this.saveError = 'Du har missat att fylla i saker';
      isSendAvailable = false;
    } if (this.guardians[1].name != undefined && this.guardianNbr == 2) {
      var names2 = String(this.guardians[1].name).split(' ');
      if (names2[1] == '' || names2.length < 2) {
        this.guardiansError[1].name = 'Vårdnadshavares för och efternamn ska vara med.'
        this.saveError = 'Du har missat att fylla i saker';
        isSendAvailable = false;
      }
    } if (!this.isNumeric(this.guardians[0].personNbr)) {
      this.guardiansError[0].personNbr = 'Vårdnadshavares personnummer ska vara 12 siffror.'
      this.saveError = 'Du har missat att fylla i saker';
      isSendAvailable = false;
    } if ((!this.isNumeric(this.guardians[1].personNbr) && this.guardianNbr == 2)) {
      this.guardiansError[1].personNbr = 'Vårdnadshavares personnummer ska vara 12 siffor.'
      this.saveError = 'Du har missat att fylla i saker';
      isSendAvailable = false;
    } if (!(this.unitNbr < 8 && this.unitNbr >= 0)) {
      console.log('enhet is');
      console.log(this.unitNbr);

      this.unitError = 'Du måste välja en enhet';
      this.saveError = 'Du har missat att fylla i saker';
      isSendAvailable = false;
    } if (isSendAvailable) {
      console.log('isSendAvailable');
      console.log(isSendAvailable);

      if (number == 1) {
        console.log('will send kortet');
        console.log(number);
  
        if (!this.checkChoices()) {
          this.categoryError = 'Du har missat att välja JA, NEJ eller VET EJ i någon av kategorierna';
          isSendAvailable = false;
          this.saveError = 'Du har missat att fylla i saker';

        }if (this.isMeasureTaken == 2) {
            this.measureError = 'Du måste välja nej eller ja';
            this.saveError = 'Du har missat att fylla i saker';
            isSendAvailable = false;

          } if (this.createDiscoveCardFormGroup.controls.situationCommentControl.status == "INVALID") {
            this.situationError = 'Du måste beskriva situationen';
            this.saveError = 'Du har missat att fylla i saker';
            isSendAvailable = false;
          } if (isSendAvailable) {
            this.isAnonyms();
            console.log('will open dialog');

            const dialogRef = this.dialog.open(CreateDiscoverCardDialogComponent, {
              data: {
                text: this.informMesg,
              }
            });

            dialogRef.afterClosed().subscribe(result => {
              if (result) {
                if (!this.isAnonyms()) {
                  card.Status = 0;

                  card.PersonLastName = '0';
                  card.PersonFirstName = '0';
                  card.PersonNbr = '0';

                  card.GuardianName1 = '0';
                  card.GuardianNbr1 = '0';
                  card.GuardianName2 = '0';
                  card.GuardianNbr2 = '0';

                }
                this.isDirty = false;
                this.store.dispatch(new fromState.CreateDiscoverCard(card));
              }
            });
          }
        }
        else {
          console.log('will save kortet');
          console.log(number);

          const dialogRef = this.dialog.open(CreateDiscoverCardDialogComponent, {
            data: {
              text: 'Kortet kommer att sparas',
            }
          });

          dialogRef.afterClosed().subscribe(result => {
            if (result) {
              this.isDirty = false;
              this.store.dispatch(new fromState.CreateDiscoverCard(card));
            }
          });
        }
      } 
    }
 */


  }
}
