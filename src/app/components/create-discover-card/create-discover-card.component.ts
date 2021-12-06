import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { DialogComponent } from '../dialog/dialog.component';
import * as fromState from '../../state';
import { Store } from '@ngrx/store';
import * as fromRoot from '../../../app/state';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatRadioChange } from '@angular/material/radio';
import { GetSetService } from '../../services/get-set/get-set.service';
import { Observable } from 'rxjs';
import { Unit } from 'src/app/models/Unit';
import { User } from 'src/app/models/User';
import { ComponentCanDeactivate } from 'src/app/interfaces/component-can-deactivate';



@Component({
  selector: 'app-create-discover-card',
  templateUrl: './create-discover-card.component.html',
  styleUrls: ['./create-discover-card.component.scss']
})
export class CreateDiscoverCardComponent implements OnInit, ComponentCanDeactivate {
  canDeactivate(): boolean {
    return !this.isDirty;
  }

  isDirty = false;

  ELEMENT_DATA = [
    { color: '#ccd8ec', type: 'OMSORG', id: 'care', 
    description: 'Barnet har vuxna i sin närhet som hen kan lita på och vända sig till.',  
    helpText:['Barnet har någon att lita på och vända sig till när det behövs',
      'Barnet har tillgängliga vuxna som uppmuntrar och uppmärksammar det',
     'Barnet får kognitiv stimulans av vuxna i sin närhet',
      'Barnet får extra stöd och vård när det behövs',
      'Barnet bor i en miljö som är anpassad efter barnets behov samt främjar dess utveckling',
      'Barnet har någon som ser till att hen är ren och lämpligt klädd efter årstid']},  

    { color: '#dbd9e6', type: 'TRYGGHET', id: 'security', 
    description: 'Barnet skyddas från sådant som kan skada hen i och utanför hemmet.', 
    helpText:['Barnet känner sig trygg hemma, i skolan, på nätet och i sin närmiljö',
      'Barnet skyddas från kränkningar',
     'Barnet skyddas från fysiska faror och hälsofaror i och utanför hemmet',
      'Barnet visar förmåga att bedöma och hantera situationer som kan innebära en risk både för barnet själv och andra',
      'Barnet litar på de som finns i dess närhet, såväl barn som vuxna',
      'Barnet skyddas från att bli utnyttjat av andra',
      'Barnet skyddas från kriminalitet och olaglig verksamhet',
      'Barnet lever i en hemmiljö som är fri från missbruk, våld, försummelse och utnyttjande']},

    { color: '#ffdcee', type: 'MÅR BRA', id: 'feel_good', 
    description: 'Barnet har hälsosamma matvanor, god hygien och ett liv fritt från tobak, alkohol och narkotika.', 
    helpText:['Barnet är frisk och upprätthåller god fysisk och psykisk hälsa',
      'Barnet deltar vid kontroller/besök som ska ge barnet stöd/hjälp',
      'Barnet har en hälsosam livsstil',
      'Barnet mår bra och ser positivt på framtiden',
      'Barnet kan hantera svårigheter och problem',
      'Barnet uppvisar inte negativt eller destruktivt beteende']},

    { color: '#fbdae1', type: 'FRITID', id: 'free_time', 
    description: 'Barnet har fritidsintresse med delaktighet från vårdnadshavare eller annan trygg person i dess närhet.', 
    helpText:['Barnet och familjen är aktiva tillsammans och gör saker som barnet tycker är roligt',
      'Barnet uppmuntras att vara aktiv utifrån sin förmåga, t ex deltar i lek, friluftsliv och idrottsaktiviteter',
      'Barnet uppmuntras och ges förutsättningar för att utveckla egna intressen och att delta i aktiviteter som är stimulerande']},

    { color: '#fee4d7', type: 'TILLHÖRIGHET', id: 'beloning', 
    description: 'Barnet känner tillhörighet och uppskattning av personer som barnet möter i sin vardag.', 
    helpText:['Barnet känner sig viktig och uppskattad av de som tar hand om hen',
      'Barnet känner sig viktig och uppskattad av barn och vuxna som finns i dess närhet',
     'Familjen har ett socialt nätverk som deltar aktivt i barnets liv'] },

    { color: '#fcedd6', type: 'ANSVARSTAGANDE', id: 'responsibility', 
    description: 'Barnet förstår vad som förväntas av hen i sin vardag, visar hänsyn och omtanke inför andra och följer givna regler.', 
    helpText:['Barnet deltar i undervisningen i skolan',
      'Barnet vet vad som är rätt och fel och agerar utifrån det',
      'Barnet tar ansvar för sina handlingar',
      'Barnet förstår vad som förväntas av hen och tar ansvar hemma, i skolan och i närmiljön',
      'Barnet visar hänsyn och omtanke om andra',
      'Barnet kan förstå och följa regler',
      'Barnet har bra förebilder i sin närhet'] },

    { color: '#d9f2e4', type: 'RESPEKTERAS', id: 'respect', 
    description: 'Barnet känner sig sedd, hörd och bekräftad av viktiga personer i sin vardag.', 
    helpText:['Barnet känner sig lyssnad till, tagen på allvar och är delaktig i viktiga vardagsbeslut',
      'Barnet har en bra självkänsla och ser sig själv som värdefull',
      'Barnet känner att vänner och andra tror på dess förmåga och stöttar hen',
      'Barnet känner sig inte retad, utsatt/utstött eller kränkt av andra']},

    { color: '#d1f3f3', type: 'UTVECKLAS', id: 'develop', 
    description: 'Barnet utvecklas i fas med sin ålder och har förmågor att klara av det vardagliga livet.', 
    helpText:['Barnet utvecklas och lär sig nya saker i olika miljöer',
      'Barnet är nyfiket och motiverat till att lära sig nya saker',
      'Barnet uppnår kunskapskraven för sin ålder',
      'Barnet har utvecklat förmågor för att klara av och hantera sin vardag',
      'Barnet har engagerade vuxna i sin närhet som stöttar hen i sin utveckling och i sitt lärande']},

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

  createDiscoveCardFormGroup: FormGroup;
  saveError = '';
  firstNameError = '';
  lastNameError = '';
  personNbrError = '';
  measureError = '';
  unitError = '';
  situationError = '';
  categoryError = '';
  informMesg = '';

  guardianNbr: number = 2;
  selected = '2';

  comments: string[] = [];
  guardians = [
    { name: '', personNbr: '', inform: '0', samtycke: '0' },
    { name: '', personNbr: '', inform: '0', samtycke: '0' },
  ];

  guardiansError = [
    { name: '', personNbr: '' },
    { name: '', personNbr: '' },
  ];

  unitNbr: number = -1;
  unitString = '-1';

  situationComment: string;

  isMeasureTaken: number = 2;
  isMeasureTakenComment: string;

  units$: Observable<Unit[]> = new Observable<Unit[]>();
  current_user$: Observable<User | null> = new Observable<User | null>();
  current_user: User;
  personNbr: string;

  constructor(public dialog: MatDialog,
    private store: Store<fromState.State>,
    private _formBuilder: FormBuilder,
    private getSetService: GetSetService) { }

  ngOnInit(): void {
    this.units$ = this.getSetService.getUnits();
    this.current_user$ = this.store.select(fromState.getCurrentUser);
    this.current_user$.subscribe(data => {
      let userID: string = data?.userID ?? '';
      let lastName: string = data?.lastName ?? '';
      let firstName: string = data?.firstName ?? '';
      let email: string = data?.email ?? '';
      let roleID: string = data?.roleID ?? '';
      let description: string = data?.description ?? '';
      this.store.dispatch(new fromState.LoadDiscoverCard(userID));

      this.current_user = new User(userID, firstName, lastName,
        email, roleID, description);
    });

    this.createDiscoveCardFormGroup = this._formBuilder.group({
      firstNameControl: ['', [Validators.required, Validators.minLength(2)]],
      lastNameControl: ['', [Validators.required, Validators.minLength(2)]],
      personNbrControl: ['', [Validators.required, Validators.pattern("^[0-9]*$")]],
      situationCommentControl: ['', Validators.required],

    });

  }

  isNumeric(str: any): boolean {
      return this.isInteger(str) && str.trim().toString().length == 12;
  }

  isInteger(str: string){
    var isNbr= true;
        for (var i = 0; i < str.length; i++) {
            if (str.charAt(i) < '0' || str.charAt(i) > '9') {
                isNbr= false;
            }
        }
        return isNbr;
    }
  

  changeGuardianNbr(nbr: number) {
    this.guardianNbr = nbr;
  }
  changeUnitNbr(unitID: string, unitName: string) {
    this.unitString = unitName;
    this.unitNbr = parseInt(unitID);
  }

  radioChange(event: MatRadioChange) {
    this.isMeasureTaken = parseInt(event.value);
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

  checkChoices(): boolean {
    var emptyChoice = true;
    this.choices.forEach(element => {
      if (element.choice == 4) {
        emptyChoice = false;
      }
    });
    return emptyChoice;
  }

  missCosent(): boolean {
    if (this.guardianNbr == 2 &&
      (this.guardians[0].samtycke != '1' || this.guardians[1].samtycke != '1' ||
        this.guardians[0].inform != '1' || this.guardians[1].inform != '1')) {
      return false;
    } else if (this.guardianNbr == 1 &&
      (this.guardians[0].samtycke != '1' || this.guardians[0].inform != '1')) {
      return false;
    }
    return true;
  }

  isAnonyms(): boolean {
    if (this.unitNbr == 7 && !this.missCosent()) {
      this.informMesg = 'kortet kommer att anonymiseras för barnet tillhör annat enhet än Ystad och samtycke av föräldrar saknas';
      return false;
    }
    else if (this.unitNbr == 7) {
      this.informMesg = 'kortet kommer att anonymiseras för barnet tillhör annat enhet än Ystad';
      return false;
    } else if (!this.missCosent()) {
      this.informMesg = 'kortet kommer att anonymiseras för samtycke av föräldrar saknas';
      return false;
    }
    this.informMesg = 'kortet kommer att skickas in';
    return true;
  }

  public goBack(): void {
    this.store.dispatch(new fromRoot.Back());
  }

  send(number: number) {
    this.personNbr = this.createDiscoveCardFormGroup.value.personNbrControl;

    var GuardianName2= this.guardians[1].name;
    if(this.guardians[1].name==''){
      GuardianName2='0';
    }
    var GuardianNbr2= this.guardians[1].personNbr;
    if(this.guardians[1].personNbr==''){
      GuardianNbr2='0';
    }

    var card = {
      UserID: parseInt(this.current_user.userID) ?? 0,
      PersonLastName: this.createDiscoveCardFormGroup.value.lastNameControl.trim() ?? '0',
      PersonFirstName: this.createDiscoveCardFormGroup.value.firstNameControl.trim() ?? '0',
      PersonNbr: String(this.createDiscoveCardFormGroup.value.personNbrControl) ?? '0',

      GuardianName1: this.guardians[0].name ?? '0',
      GuardianNbr1: String(this.guardians[0].personNbr) ?? '0',
      GuardianName2: GuardianName2 ?? '0',
      GuardianNbr2: GuardianNbr2 ?? '0',

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

    var isSendAvailable = true;
    this.firstNameError = '';
    this.lastNameError = '';
    this.saveError = '';
    this.personNbrError = '';
    this.guardiansError[0].name = '';
    this.guardiansError[1].name = '';
    this.guardiansError[0].personNbr = '';
    this.guardiansError[1].personNbr = '';
    this.measureError = '';
    this.unitError = '';
    this.situationError = '';
    this.categoryError = '';
    this.informMesg = '';
  
    if (this.createDiscoveCardFormGroup.controls.firstNameControl.status == "INVALID") {
      this.firstNameError = 'Förnamn behövs, kan ej vara mondre än 2 bokstäver';
      this.saveError = 'Du har missat att fylla i saker';
      isSendAvailable = false;
    } if (this.createDiscoveCardFormGroup.controls.lastNameControl.status == "INVALID") {
      this.lastNameError = 'efternamn behövs, kan ej vara mondre än 2 bokstäver';
      this.saveError = 'Du har missat att fylla i saker';
      isSendAvailable = false;
    }  if (this.createDiscoveCardFormGroup.controls.personNbrControl.status == "INVALID" || this.personNbr.toString().trim().length != 12) {
      this.personNbrError = 'Personnummer ska innehålla 12 siffror';
      this.saveError = 'Du har missat att fylla i saker';
      isSendAvailable = false;
    }
    if (this.createDiscoveCardFormGroup.status == "INVALID") {
      this.saveError = 'Du har missat att fylla i saker';
      isSendAvailable = false;

    } if (this.createDiscoveCardFormGroup.controls.situationCommentControl.status == "INVALID") {
      this.situationError = 'Du måste beskriva situationen';
      this.saveError = 'Du har missat att fylla i saker';
      isSendAvailable = false;
    } if (this.guardians[0].name == '') {
      this.guardiansError[0].name = 'Vårdnadshavares namn ska vara med.'
      this.saveError = 'Du har missat att fylla i saker';
      isSendAvailable = false;
    } if (this.guardians[0].name != '') {
      var names1 = String(this.guardians[0].name).trim().split(' ');
      if (names1[1] == '' || names1.length < 2) {
        this.guardiansError[0].name = 'Vårdnadshavares för och efternamn ska vara med.'
        this.saveError = 'Du har missat att fylla i saker';
        isSendAvailable = false;
      }
    } if (this.guardians[1].name == '' && this.guardianNbr == 2) {
      this.guardiansError[1].name = 'Vårdnadshavares namn ska vara med.'
      this.saveError = 'Du har missat att fylla i saker';
      isSendAvailable = false;
    } if (this.guardians[1].name != '' && this.guardianNbr == 2) {
      var names2 = String(this.guardians[1].name).trim().split(' ');
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
    } if (this.unitNbr == -1) {
      this.unitError = 'Du måste välja en enhet';
      this.saveError = 'Du har missat att fylla i saker';
      isSendAvailable = false;
    } if (isSendAvailable) {
      if (number == 1) {  
        if (!this.checkChoices()) {
          this.categoryError = 'Du har missat att välja JA, NEJ eller VET EJ i någon av kategorierna';
          isSendAvailable = false;
          this.saveError = 'Du har missat att fylla i saker';

        }if (this.isMeasureTaken == 2) {
            this.measureError = 'Du måste välja nej eller ja';
            this.saveError = 'Du har missat att fylla i saker';
            isSendAvailable = false;

          } if (isSendAvailable) {
            this.isAnonyms();

            const dialogRef = this.dialog.open(DialogComponent, {
              data: {
                title: 'Skapa upptäckarkort',
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
          const dialogRef = this.dialog.open(DialogComponent, {
            data: {
              title: 'Skapa upptäckarkort',
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

  
}


