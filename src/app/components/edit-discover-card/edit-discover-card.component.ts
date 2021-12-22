import { Component, OnInit } from '@angular/core';
import { Card } from 'src/app/models/Card';
import { Observable } from 'rxjs';
import * as fromState from '../../state';
import { Store } from '@ngrx/store';
import { ComponentCanDeactivate } from 'src/app/interfaces/component-can-deactivate';
import { DialogComponent } from '../dialog/dialog.component';
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
export class EditDiscoverCardComponent implements OnInit, ComponentCanDeactivate {
  canDeactivate(): boolean {
    return !this.isDirty;
  }

  current_card$ = new Observable<Card | null>();
  card: Card;

  isDirty = false;

  // an array which have the different categories and questions to be displayed in the page
  ELEMENT_DATA = [
    {
      color: '#ccd8ec', type: 'OMSORG', id: 'care',
      description: 'Barnet har vuxna i sin närhet som hen kan lita på och vända sig till.',
      helpText: ['Barnet har någon att lita på och vända sig till när det behövs',
        'Barnet har tillgängliga vuxna som uppmuntrar och uppmärksammar det',
        'Barnet får kognitiv stimulans av vuxna i sin närhet',
        'Barnet får extra stöd och vård när det behövs',
        'Barnet bor i en miljö som är anpassad efter barnets behov samt främjar dess utveckling',
        'Barnet har någon som ser till att hen är ren och lämpligt klädd efter årstid']
    },

    {
      color: '#dbd9e6', type: 'TRYGGHET', id: 'security',
      description: 'Barnet skyddas från sådant som kan skada hen i och utanför hemmet.',
      helpText: ['Barnet känner sig trygg hemma, i skolan, på nätet och i sin närmiljö',
        'Barnet skyddas från kränkningar',
        'Barnet skyddas från fysiska faror och hälsofaror i och utanför hemmet',
        'Barnet visar förmåga att bedöma och hantera situationer som kan innebära en risk både för barnet själv och andra',
        'Barnet litar på de som finns i dess närhet, såväl barn som vuxna',
        'Barnet skyddas från att bli utnyttjat av andra',
        'Barnet skyddas från kriminalitet och olaglig verksamhet',
        'Barnet lever i en hemmiljö som är fri från missbruk, våld, försummelse och utnyttjande']
    },

    {
      color: '#ffdcee', type: 'MÅR BRA', id: 'feel_good',
      description: 'Barnet har hälsosamma matvanor, god hygien och ett liv fritt från tobak, alkohol och narkotika.',
      helpText: ['Barnet är frisk och upprätthåller god fysisk och psykisk hälsa',
        'Barnet deltar vid kontroller/besök som ska ge barnet stöd/hjälp',
        'Barnet har en hälsosam livsstil',
        'Barnet mår bra och ser positivt på framtiden',
        'Barnet kan hantera svårigheter och problem',
        'Barnet uppvisar inte negativt eller destruktivt beteende']
    },

    {
      color: '#fbdae1', type: 'FRITID', id: 'free_time',
      description: 'Barnet har fritidsintresse med delaktight från vårdnadshavare eller annan trygg person i dess närhet.',
      helpText: ['Barnet och familjen är aktiva tillsammans och gör saker som barnet tycker är roligt',
        'Barnet uppmuntras att vara aktiv utifrån sin förmåga, t ex deltar i lek, friluftsliv och idrottsaktiviteter',
        'Barnet uppmuntras och ges förutsättningar för att utveckla egna intressen och att delta i aktiviteter som är stimulerande']
    },

    {
      color: '#fee4d7', type: 'TILLHÖRIGHET', id: 'beloning',
      description: 'Barnet känner tillhörighet och uppskattning av personer som barne möter i sin vardag.',
      helpText: ['Barnet känner sig viktig och uppskattad av de som tar hand om hen',
        'Barnet känner sig viktig och uppskattad av barn och vuxna som finns i dess närhet',
        'Familjen har ett socialt nätverk som deltar aktivt i barnets liv']
    },

    {
      color: '#fcedd6', type: 'ANSVARSTAGANDE', id: 'responsibility',
      description: 'Barnet förstår vas som förväntas av det i sin vardag, visar hänsyn och omtanke inför andra och följer givna regler.',
      helpText: ['Barnet deltar i undervisningen i skolan',
        'Barnet vet vad som är rätt och fel och agerar utifrån det',
        'Barnet tar ansvar för sina handlingar',
        'Barnet förstår vad som förväntas av hen och tar ansvar hemma, i skolan och i närmiljön',
        'Barnet visar hänsyn och omtanke om andra',
        'Barnet kan förstå och följa regler',
        'Barnet har bra förebilder i sin närhet']
    },

    {
      color: '#d9f2e4', type: 'RESPEKTERAS', id: 'respect',
      description: 'Barnet känner sig sedd, hörd och bekräftad av viktiga personer i sin vardag.',
      helpText: ['Barnet känner sig lyssnad till, tagen på allvar och är delaktig i viktiga vardagsbeslut',
        'Barnet har en bra självkänsla och ser sig själv som värdefull',
        'Barnet känner att vänner och andra tror på dess förmåga och stöttar hen',
        'Barnet känner sig inte retad, utsatt/utstött eller kränkt av andra']
    },

    {
      color: '#d1f3f3', type: 'UTVECKLAS', id: 'develop',
      description: 'Barnet utvecklas i fas med sin ålder och tar förmågor att klara av det vardagliga livet.',
      helpText: ['Barnet utvecklas och lär sig nya saker i olika miljöer',
        'Barnet är nyfiket och motiverat till att lära sig nya saker',
        'Barnet uppnår kunskapskraven för sin ålder',
        'Barnet har utvecklat förmågor för att klara av och hantera sin vardag',
        'Barnet har engagerade vuxna i sin närhet som stöttar hen i sin utveckling och i sitt lärande']
    },

  ];

  // the error msgs to be shown to the user
  saveError = '';
  measureError = '';
  unitError = '';
  situationError = '';
  categoryError = '';
  informMesg = '';

  guardianNbr: number = 2;
  selected = '2';
  units$: Observable<Unit[]> = new Observable<Unit[]>();
  guardians = {};

  unitNbr: number = -1;
  unitString = '-1';

  current_user$: Observable<User | null> = new Observable<User | null>();
  current_user: User;

  grades: string[] = [];
  comments: string[] = [];

  constructor(public dialog: MatDialog,
    private store: Store<fromState.State>,
    private getSetService: GetSetService) { }

  ngOnInit(): void {

    this.current_card$ = this.store.select(fromState.getCurrentCard);
    this.current_card$.subscribe(data => {
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
      let personID: string = data?.personID ?? '';


      this.card = new Card(id, gradedOn, userName, userOrg, userTitle, personName,
        personNbr, guardian1, guardianPersonNbr1, guardian2, guardianPersonNbr2,
        healthTeam, situation, questions, grades, comments, status, personID);

    });

    this.units$ = this.getSetService.getUnits();
    if (this.card.guardian2 == 'Dolt') {
      this.selected = '1';
      this.guardianNbr = 1;
    }
    this.guardians = [
      {
        name: this.card.guardian1, personNbr: this.card.guardianPersonNbr1,
        inform: '0', samtycke: '0'
      },

      {
        name: this.card.guardian2, personNbr: this.card.guardianPersonNbr2,
        inform: '0', samtycke: '0'
      },
    ];

    if (this.card.grades[9] == '1') {
      this.guardians[0].inform = '1';
    }
    else if (this.card.grades[9] == '2') {
      this.guardians[0].inform = '1';
      this.guardians[1].inform = '1';
    }

    if (this.card.grades[10] == '1') {
      this.guardians[0].samtycke = '1';
    }
    else if (this.card.grades[9] == '2') {
      this.guardians[0].samtycke = '1';
      this.guardians[1].samtycke = '1';
    }
    this.unitString = this.card.healthTeam;

    this.units$.subscribe(data => {
      data.map((unit: Unit) => {
        if (unit.unitName == this.unitString) {
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
      let organisation: string = data?.organisaton ?? '';
      let name: string = data?.name ?? '';
      let units: Unit[] = data?.units ?? [];

      this.current_user = new User(userID, firstName, lastName,
        email, roleID, description, organisation, name, units);
    });

    var index = 0;

    this.card.comments.forEach(element => {
      this.comments[index] = element;
      index++;
    });
    index = 0;
    this.card.grades.forEach(element => {
      this.grades[index] = element;
      index++;
    });
  }

  public goBack(): void {
    this.store.dispatch(new fromRoot.Back());
  }

  isNumeric(str: any): boolean {
    if (str == undefined) {
      return false;
    } else {
      return Number.isInteger(str) && str.toString().length == 12;
    }
  }

  // this function called on mat-select to change the unit 
  changeUnitNbr(unitID: string, unitName: string) {
    this.unitNbr = parseInt(unitID);
    this.card.healthTeam = unitName;
    this.isDirty = true;
  }

  // check that the user doesn't miss to choose a value
  checkChoices(): boolean {
    var emptyChoice = true;
    this.grades.forEach(element => {
      if (element != '0' && element != '1' && element != '2') {
        emptyChoice = false;
      }
    });
    return emptyChoice;
  }

  // check that the user has the permissions, otherwhise the card will be anonymous
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

  // check if the card will be anonymous and create the confirmationmsg to be shown to the user
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

  // send the request to update the discover card 
  send(number: number) {

    // the json vaiable to be send with the request
    var current_card = {
      UserID: parseInt(this.current_user.userID) ?? 0,
      PersonNbr: this.card.personNbr ?? '0',

      Unit: this.card.healthTeam ?? '0',
      GradedOn: this.card.gradedOn ?? '0',
      Situation: this.card.situation ?? '0',
      GradeActions: this.grades[8],
      CommentActions: this.comments[8] ?? '0',

      GradeOmsorg: this.grades[0],
      CommentOmsorg: this.comments[0] ?? '0',
      GradeTrygghet: this.grades[1],
      CommentTrygghet: this.comments[1] ?? '0',
      GradeMarBra: this.grades[2],
      CommentMarBra: this.comments[2] ?? '0',
      GradeFritid: this.grades[3],
      CommentFritid: this.comments[3] ?? '0',
      GradeTillhorighet: this.grades[4],
      CommentTillhorighet: this.comments[4] ?? '0',
      GradeAnsvarstagande: this.grades[5],
      CommentAnsvarstagande: this.comments[5] ?? '0',
      GradeRespekteras: this.grades[6],
      CommentRespekteras: this.comments[6] ?? '0',
      GradeUtvecklas: this.grades[7],
      CommentUtvecklas: this.comments[7] ?? '0',

      GradeUpprattats1: parseInt(this.guardians[0].inform),
      GradeUpprattats2: parseInt(this.guardians[1].inform),
      GradeSamtycke1: parseInt(this.guardians[0].samtycke),
      GradeSamtycke2: parseInt(this.guardians[1].samtycke),
      Status: number,
      PersonID: parseInt(this.card.personID) ?? 0,
    };

    var isSendAvailable = true;
    this.saveError = '';
    this.measureError = '';
    this.unitError = '';
    this.situationError = '';
    this.categoryError = '';
    this.informMesg = '';

    // check for errors before sending the request
    if (this.unitNbr == -1) {
      this.unitError = 'Du måste välja en enhet';
      this.saveError = 'Du har missat att fylla i saker';
      isSendAvailable = false;
    }
    // if there is no error then send the request
    if (isSendAvailable) {
      if (number == 1) {
        // if the card will be s end, check for more errors and missed inputs
        if (!this.checkChoices()) {
          this.categoryError = 'Du har missat att välja JA, NEJ eller VET EJ i någon av Behovsområden';
          isSendAvailable = false;
          this.saveError = 'Du har missat att fylla i saker';

        } if (this.grades[8] != '0' && this.grades[8] != '1') {
          this.measureError = 'Du måste välja nej eller ja';
          this.saveError = 'Du har missat att fylla i saker';
          isSendAvailable = false;

        } if (this.card.situation == "") {
          this.situationError = 'Du måste beskriva situationen';
          this.saveError = 'Du har missat att fylla i saker';
          isSendAvailable = false;
        } if (isSendAvailable) {
          this.isAnonyms();

          // show a confirmation window for the user
          const dialogRef = this.dialog.open(DialogComponent, {
            data: {
              title: 'Ändra upptäckarkort',
              text: this.informMesg,
            }
          });

          // after the confirmation send the request to UpdateDiscoverCard action to update the card
          dialogRef.afterClosed().subscribe(result => {
            if (result) {
              if (!this.isAnonyms()) {
                current_card.Status = 0;
              }

              this.isDirty = false;
              this.store.dispatch(new fromState.UpdateDiscoverCard(current_card));
            }
          });
        }
      }
      else {
        // show a confirmation window for the user
        const dialogRef = this.dialog.open(DialogComponent, {
          data: {
            title: 'Ändra upptäckarkort',
            text: 'Kortet kommer att sparas',
          }
        });

        // after the confirmation send the request to UpdateDiscoverCard action the update the card
        dialogRef.afterClosed().subscribe(result => {
          if (result) {
            this.isDirty = false;
            this.store.dispatch(new fromState.UpdateDiscoverCard(current_card));
          }
        });
      }
    }
  }


}
