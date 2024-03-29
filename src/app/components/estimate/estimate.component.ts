import { Component, OnInit } from '@angular/core';
import { STEPPER_GLOBAL_OPTIONS } from '@angular/cdk/stepper';
import * as fromRoot from '../../state';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import { Observable } from 'rxjs';
import { Person } from 'src/app/models/Person';
import { User } from 'src/app/models/User';
import { ComponentCanDeactivate } from 'src/app/interfaces/component-can-deactivate';
import { EstimateCard } from 'src/app/models/EstimateCard';
import { GetSetService } from '../../services/get-set/get-set.service';
import { Actions, ofType } from '@ngrx/effects';
import * as estimateAction from '../../state/actions/estimate.action';
import { tap } from 'rxjs/operators';
import { DialogComponent } from '../../components/dialog/dialog.component';
import { MatDialog } from '@angular/material/dialog';

@Component({
  selector: 'app-estimate',
  templateUrl: './estimate.component.html',
  styleUrls: ['./estimate.component.scss'],
  providers: [{
    provide: STEPPER_GLOBAL_OPTIONS, useValue: { showError: true }
  }]

})
export class EstimateComponent implements OnInit, ComponentCanDeactivate {
  canDeactivate(): boolean {
    return !this.isDirty;
  }

  isDirty = false;
  current_person$ = new Observable<Person | null>();
  current_user$ = new Observable<User | null>();

  //save all the estimates in this array
  estimatecards: EstimateCard[] = [];

  // save only the estimates which has "spara" status
  savedEstimatecards: EstimateCard[] = [];

  userRoleId: string;
  msgError: string = '';

  personID: string;
  userID: string;

  //save only the current estimate if it is created, otherwhise empty
  currentSavedEstimate: EstimateCard[] = [];

  pcards: Promise<EstimateCard[]> = new Promise((resolve, reject) => { });

  // an array with the information about the different categores and questions
  // to be displayed on the page
  categories = [
    {
      area: "OMSORG", id: "care", class: "care-class",
      questions: [
        { text: 'Barnet bor i en miljö som är anpassad efter barnets behov samt främjar dess utveckling', score: '' },
        { text: 'Barnet får extra stöd och vård när det behövs', score: '' },
        { text: 'Barnet har någon att lita på och vända sig till när det behövs', score: '' },
        { text: 'Barnet har någon som ser till att hen är ren och lämpligt klädd efter årstid', score: '' },
        { text: 'Barnet har tillgängliga vuxna som uppmuntrar och uppmärksammar det', score: '' },
        { text: 'Barnet får kognitiv stimulans av vuxna i sin närhet', score: '' }
      ],
      comment: '', msgError: '',
      color: '#003686'
    },

    {
      area: "TRYGGHET", id: "security", class: 'security-class',
      questions: [
        { text: 'Barnet känner sig trygg hemma, i skolan, på nätet och i sin närmiljö', score: '' },
        { text: 'Barnet lever i en hemmiljö som är fri från missbruk, våld, försummelse och utnyttjande', score: '' },
        { text: 'Barnet skyddas från att bli utnyttjat av andra', score: '' },
        { text: 'Barnet skyddas från fysiska faror och hälsofaror i och utanför hemmet', score: '' },
        { text: 'Barnet skyddas från kränkningar', score: '' },
        { text: 'Barnet skyddas från kriminalitet och olaglig verksamhet', score: '' },
        { text: 'Barnet visar förmåga att bedöma och hantera situationer som kan innebära en risk både för barnet själv och andra', score: '' },
        { text: 'Barnet litar på de som finns i dess närhet, såväl barn som vuxna', score: '' },
      ],
      comment: '', msgError: '',
      color: '#353370'
    },

    {
      area: "MÅ BRA", id: "feel_good", class: 'feel_good-class',
      questions: [
        { text: 'Barnet är frisk och upprätthåller god fysisk och psykisk hälsa', score: '' },
        { text: 'Barnet deltar vid kontroller/besök som ska ge barnet stöd/hjälp', score: '' },
        { text: 'Barnet har en hälsosam livsstil', score: '' },
        { text: 'Barnet kan hantera svårigheter och problem', score: '' },
        { text: 'Barnet mår bra och ser positivt på framtiden', score: '' },
        { text: 'Barnet uppvisar inte negativa eller destruktiva beteenden', score: '' }
      ],
      comment: '', msgError: '',
      color: '#e0448c'
    },

    {
      area: "FRITID", id: "free_time", class: 'free_time-class',
      questions: [
        { text: 'Barnet och familjen är aktiva tillsammans och gör saker som barnet tycker är roligt', score: '' },
        { text: 'Barnet uppmuntras att vara aktiv utifrån sin förmåga, tex deltar i  lek, friluftsliv och idrottsaktiviteter', score: '' },
        { text: 'Barnet uppmuntras och ges förutsättningar för att utveckla egna intressen och att delta i aktiviteter som är stimulerande', score: '' }],
      comment: '', msgError: '',
      color: '#df2d5b'
    },

    {
      area: "TILLHÖRIGHET", id: "beloning", class: 'beloning-class',
      questions: [
        { text: 'Barnet känner sig viktig och uppskattad av barn och vuxna som finn i dess närhet', score: '' },
        { text: 'Barnet känner sig viktig och uppskattad av de som tar hand om hen', score: '' },
        { text: 'Familjen har ett socialt nätverk som deltar aktivt i barnets liv', score: '' }
      ],
      comment: '', msgError: '',
      color: '#eb612d'
    },

    {
      area: "ANSVARSTAGANDE", id: "responsibility", class: 'responsibility-class',
      questions: [
        { text: 'Barnet deltar i undervisningen i skolan', score: '' },
        { text: 'Barnet förstår vad som förväntas av hen och tar ansvar hemma, i skolan och i nära miljön.', score: '' },
        { text: 'Barnet har bra förebilder i sin närhet', score: '' },
        { text: 'Barnet kan förstå och följa regler', score: '' },
        { text: 'Barnet tar ansvar för sina handlingar', score: '' },
        { text: 'Barnet vet vad som är rätt och fel och agerar utifrån det', score: '' },
        { text: 'Barnet visar hänsyn och omtanke om andra', score: '' },
      ],
      comment: '', msgError: '',
      color: '#f79c2e'
    },

    {
      area: "RESPEKTERAS", id: "respekt", class: 'respekt-class',
      questions: [
        { text: 'Barnet har en bra självkänsla och ser sig själv som värdeful', score: '' },
        { text: 'Barnet känner sig inte retad, utsatt/utstött  eller kränkt av andra', score: '' },
        { text: 'Barnet känner att vänner och andra tror på dess förmåga och stöttar hen', score: '' },
        { text: 'Barnet känner sig lyssnad till, tagen på allvar och är delaktig i viktiga vardagsbeslut', score: '' },
      ],
      comment: '', msgError: '',
      color: '#4ba562'
    },

    {
      area: "UTVECKLAS", id: "develop", class: 'develop-class',
      questions: [
        { text: 'Barnet är nyfiket och motiverat till att lära sig nya saker', score: '' },
        { text: 'Barnet har engagerade vuxna i sin närhet som stöttar hen i sin utveckling och i sitt lärande', score: '' },
        { text: 'Barnet har utvecklat förmågor för att klara av och hantera sin vardag', score: '' },
        { text: 'Barnet uppnår kunskapskraven för sin åldern', score: '' },
        { text: 'Barnet utvecklas och lär sig nya saker i olika miljöer', score: '' },
      ],
      comment: '', msgError: '',
      color: '#31acaf'
    }
  ];


  constructor(private store: Store<fromState.State>,
    private getSetService: GetSetService,
    private actions$: Actions,
    public dialog: MatDialog) { }

  ngOnInit(): void {

    // empty if there is no created estimate whith status "spara"
    this.currentSavedEstimate[0] = new EstimateCard('', '', [
      { scores: {}, comment: '' },
      { scores: {}, comment: '' },
      { scores: {}, comment: '' },
      { scores: {}, comment: '' },
      { scores: {}, comment: '' },
      { scores: {}, comment: '' },
      { scores: {}, comment: '' },
      { scores: {}, comment: '' }
    ],
      []
      , '', '', '', '', '');

    this.current_user$ = this.store.select(fromState.getCurrentUser);
    this.current_user$.subscribe(data => {
      this.userRoleId = String(data?.roleID);
      this.userID = data?.userID ?? '0'
    });

    this.current_person$ = this.store.select(fromState.getCurrentPerson);
    this.current_person$.subscribe(data => {
      this.personID = data?.personID ?? '';
      this.pcards = this.getSetService.getEstimate(this.personID);
    });

    let savedEstimatecards = this.savedEstimatecards;
    let currentSavedEstimate = this.currentSavedEstimate;
    let estimatecards = this.estimatecards;
    let userID = this.userID;

    this.pcards.then(function (response) {
      response.forEach((card: EstimateCard) => {

        if (card.status == 'Sparat' && userID == card.userID) {
          savedEstimatecards.push(card);
          currentSavedEstimate.push(card);

        } else if (card.status == 'Sparat') {
          savedEstimatecards.push(card);
        } else if (userID == card.userID) {
          estimatecards.push(card);
        }
      });
    });

    savedEstimatecards.forEach(element => {
      this.savedEstimatecards = [];
      this.savedEstimatecards.push(element);
    });

    currentSavedEstimate.forEach(element => {
      this.currentSavedEstimate.push(element);
    });

    estimatecards.forEach(element => {
      this.estimatecards.push(element);

    });

    // listen to CREATE_ESTIMATE_SUCCESS and show a confirmation msg to confirm the user about the changes
    this.actions$.pipe(
      ofType(estimateAction.CREATE_ESTIMATE_SUCCESS),
      tap(() => {
        const dialogRef = this.dialog.open(DialogComponent, {
          data: {
            title: 'Skapa skattning',
            text: 'Din skattning har nu sparats och väntar på att bli sammanställd.',
          }
        });

        // after connfirmation refresh the page to show the new changes
        dialogRef.afterClosed().subscribe(result => {
          if (result) {
            window.location.reload()
          }
        });
      })
    ).subscribe();

  }

  changeDirty() {
    this.isDirty = true;
  }

  // save or create an estimate
  save() {
    this.categories[0].msgError = '';
    this.categories[1].msgError = '';
    this.categories[2].msgError = '';
    this.categories[3].msgError = '';
    this.categories[4].msgError = '';
    this.categories[5].msgError = '';
    this.categories[6].msgError = '';
    this.categories[7].msgError = '';
    this.msgError = '';

    this.categories[0].questions[0].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[0].scores[0] ?? '';
    this.categories[0].questions[1].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[0].scores[1] ?? '';
    this.categories[0].questions[2].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[0].scores[2] ?? '';
    this.categories[0].questions[3].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[0].scores[3] ?? '';
    this.categories[0].questions[4].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[0].scores[4] ?? '';
    this.categories[0].questions[5].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[0].scores[5] ?? '';

    this.categories[0].comment = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[0].comment;

    this.categories[1].questions[0].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[1].scores[0] ?? '';
    this.categories[1].questions[1].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[1].scores[1] ?? '';
    this.categories[1].questions[2].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[1].scores[2] ?? '';
    this.categories[1].questions[3].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[1].scores[3] ?? '';
    this.categories[1].questions[4].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[1].scores[4] ?? '';
    this.categories[1].questions[5].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[1].scores[5] ?? '';
    this.categories[1].questions[6].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[1].scores[6] ?? '';
    this.categories[1].questions[7].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[1].scores[7] ?? '';

    this.categories[1].comment = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[1].comment;

    this.categories[2].questions[0].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[2].scores[0] ?? '';
    this.categories[2].questions[1].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[2].scores[1] ?? '';
    this.categories[2].questions[2].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[2].scores[2] ?? '';
    this.categories[2].questions[3].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[2].scores[3] ?? '';
    this.categories[2].questions[4].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[2].scores[4] ?? '';
    this.categories[2].questions[5].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[2].scores[5] ?? '';

    this.categories[2].comment = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[2].comment;

    this.categories[3].questions[0].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[3].scores[0] ?? '';
    this.categories[3].questions[1].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[3].scores[1] ?? '';
    this.categories[3].questions[2].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[3].scores[2] ?? '';

    this.categories[3].comment = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[3].comment;

    this.categories[4].questions[0].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[4].scores[0] ?? '';
    this.categories[4].questions[1].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[4].scores[1] ?? '';
    this.categories[4].questions[2].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[4].scores[2] ?? '';

    this.categories[4].comment = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[4].comment;

    this.categories[5].questions[0].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[5].scores[0] ?? '';
    this.categories[5].questions[1].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[5].scores[1] ?? '';
    this.categories[5].questions[2].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[5].scores[2] ?? '';
    this.categories[5].questions[3].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[5].scores[3] ?? '';
    this.categories[5].questions[4].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[5].scores[4] ?? '';
    this.categories[5].questions[5].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[5].scores[5] ?? '';
    this.categories[5].questions[6].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[5].scores[6] ?? '';

    this.categories[5].comment = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[5].comment;

    this.categories[6].questions[0].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[6].scores[0] ?? '';
    this.categories[6].questions[1].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[6].scores[1] ?? '';
    this.categories[6].questions[2].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[6].scores[2] ?? '';
    this.categories[6].questions[3].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[6].scores[3] ?? '';

    this.categories[6].comment = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[6].comment;

    this.categories[7].questions[0].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[7].scores[0] ?? '';
    this.categories[7].questions[1].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[7].scores[1] ?? '';
    this.categories[7].questions[2].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[7].scores[2] ?? '';
    this.categories[7].questions[3].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[7].scores[3] ?? '';
    this.categories[7].questions[4].score = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[7].scores[4] ?? '';

    this.categories[7].comment = this.currentSavedEstimate[this.currentSavedEstimate.length - 1].grades[7].comment;

    //check for errors
    this.categories[0].questions.forEach(element => {
      if (!(element.score < '6' && element.score >= '0')) {
        this.categories[0].msgError = 'Missade Skala i Behovsområde OMSORG.';
        this.msgError = 'Du har missat att fylla i saker';
      }
    });

    this.categories[1].questions.forEach(element => {
      if (!(element.score < '6' && element.score >= '0')) {
        this.categories[1].msgError = 'Missade Skala i Behovsområde TRYGGHET.';
        this.msgError = 'Du har missat att fylla i saker';
      }
    });

    this.categories[2].questions.forEach(element => {
      if (!(element.score < '6' && element.score >= '0')) {
        this.categories[2].msgError = 'Missade Skala i Behovsområde MÅ BRA.';
        this.msgError = 'Du har missat att fylla i saker';
      }
    });

    this.categories[3].questions.forEach(element => {
      if (!(element.score < '6' && element.score >= '0')) {
        this.categories[3].msgError = 'Missade Skala i Behovsområde FRITID.';
        this.msgError = 'Du har missat att fylla i saker';
      }
    });

    this.categories[4].questions.forEach(element => {
      if (!(element.score < '6' && element.score >= '0')) {
        this.categories[4].msgError = 'Missade Skala i Behovsområde TILLHÖRIGHET.';
        this.msgError = 'Du har missat att fylla i saker';
      }
    });

    this.categories[5].questions.forEach(element => {
      if (!(element.score < '6' && element.score >= '0')) {
        this.categories[5].msgError = 'Missade Skala i Behovsområde ANSVARSTAGANDE.';
        this.msgError = 'Du har missat att fylla i saker';
      }
    });

    this.categories[6].questions.forEach(element => {
      if (!(element.score < '6' && element.score >= '0')) {
        this.categories[6].msgError = 'Missade Skala i Behovsområde RESPEKTERAS.';
        this.msgError = 'Du har missat att fylla i saker';
      }
    });

    this.categories[7].questions.forEach(element => {
      if (!(element.score < '6' && element.score >= '0')) {
        this.categories[7].msgError = 'Missade Skala i Behovsområde UTVECKLAS.';
        this.msgError = 'Du har missat att fylla i saker';
      }
    });

    //when no error found send the request to create or update the estimate
    if (this.msgError == '') {
      var skattning = {
        PersonID: parseInt(this.personID),
        UserID: parseInt(this.userID),

        GradeOmsorg1: parseInt(this.categories[0].questions[0].score),
        GradeOmsorg2: parseInt(this.categories[0].questions[1].score),
        GradeOmsorg3: parseInt(this.categories[0].questions[2].score),
        GradeOmsorg4: parseInt(this.categories[0].questions[3].score),
        GradeOmsorg5: parseInt(this.categories[0].questions[4].score),
        GradeOmsorg6: parseInt(this.categories[0].questions[5].score),
        CommentOmsorg: this.categories[0].comment,

        GradeTrygghet1: parseInt(this.categories[1].questions[0].score),
        GradeTrygghet2: parseInt(this.categories[1].questions[1].score),
        GradeTrygghet3: parseInt(this.categories[1].questions[2].score),
        GradeTrygghet4: parseInt(this.categories[1].questions[3].score),
        GradeTrygghet5: parseInt(this.categories[1].questions[4].score),
        GradeTrygghet6: parseInt(this.categories[1].questions[5].score),
        GradeTrygghet7: parseInt(this.categories[1].questions[6].score),
        GradeTrygghet8: parseInt(this.categories[1].questions[7].score),
        CommentTrygghet: this.categories[1].comment,

        GradeMarBra1: parseInt(this.categories[2].questions[0].score),
        GradeMarBra2: parseInt(this.categories[2].questions[1].score),
        GradeMarBra3: parseInt(this.categories[2].questions[2].score),
        GradeMarBra4: parseInt(this.categories[2].questions[3].score),
        GradeMarBra5: parseInt(this.categories[2].questions[4].score),
        GradeMarBra6: parseInt(this.categories[2].questions[5].score),
        CommentMarBra: this.categories[2].comment,

        GradeFritid1: parseInt(this.categories[3].questions[0].score),
        GradeFritid2: parseInt(this.categories[3].questions[1].score),
        GradeFritid3: parseInt(this.categories[3].questions[2].score),
        CommentFritid: this.categories[3].comment,

        GradeTillhorighet1: parseInt(this.categories[4].questions[0].score),
        GradeTillhorighet2: parseInt(this.categories[4].questions[1].score),
        GradeTillhorighet3: parseInt(this.categories[4].questions[2].score),
        CommentTillhorighet: this.categories[4].comment,

        GradeAnsvarstagande1: parseInt(this.categories[5].questions[0].score),
        GradeAnsvarstagande2: parseInt(this.categories[5].questions[1].score),
        GradeAnsvarstagande3: parseInt(this.categories[5].questions[2].score),
        GradeAnsvarstagande4: parseInt(this.categories[5].questions[3].score),
        GradeAnsvarstagande5: parseInt(this.categories[5].questions[4].score),
        GradeAnsvarstagande6: parseInt(this.categories[5].questions[5].score),
        GradeAnsvarstagande7: parseInt(this.categories[5].questions[6].score),
        CommentAnsvarstagande: this.categories[5].comment,

        GradeRespekteras1: parseInt(this.categories[6].questions[0].score),
        GradeRespekteras2: parseInt(this.categories[6].questions[1].score),
        GradeRespekteras3: parseInt(this.categories[6].questions[2].score),
        GradeRespekteras4: parseInt(this.categories[6].questions[3].score),
        CommentRespekteras: this.categories[6].comment,

        GradeUtvecklas1: parseInt(this.categories[7].questions[0].score),
        GradeUtvecklas2: parseInt(this.categories[7].questions[1].score),
        GradeUtvecklas3: parseInt(this.categories[7].questions[2].score),
        GradeUtvecklas4: parseInt(this.categories[7].questions[3].score),
        GradeUtvecklas5: parseInt(this.categories[7].questions[4].score),
        CommentUtvecklas: this.categories[7].comment,

      }
      this.isDirty = false;
      this.store.dispatch(new fromState.CreateEstimateCard(skattning));
    }
  }

  // send the user to the estimate-overview page to check all the estimate which has "spara" status
  // save the estimates which has the "spara" status to the storage 
  moveToEstimateOverview() {
    this.store.dispatch(new fromState.LoadEstimateCards(this.savedEstimatecards));
    this.store.dispatch(new fromRoot.Go({ path: ['/estimate-overview'] }));
  }

}
