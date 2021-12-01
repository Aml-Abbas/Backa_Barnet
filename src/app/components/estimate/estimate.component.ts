import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {STEPPER_GLOBAL_OPTIONS} from '@angular/cdk/stepper';
import * as fromRoot from '../../state';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import { Observable } from 'rxjs';
import { Person } from 'src/app/models/Person';
import { User } from 'src/app/models/User';
import { ComponentCanDeactivate } from 'src/app/interfaces/component-can-deactivate';
import { Estimate } from 'src/app/models/Estimate';
import { EstimateCard } from 'src/app/models/EstimateCard';

@Component({
  selector: 'app-estimate',
  templateUrl: './estimate.component.html',
  styleUrls: ['./estimate.component.scss'],
  providers: [{
    provide: STEPPER_GLOBAL_OPTIONS, useValue: {showError: true}
  }]

})
export class EstimateComponent implements OnInit, ComponentCanDeactivate {
  canDeactivate(): boolean {
    return !this.isDirty;
  }

  isDirty = false;
  estimates$: Observable<Estimate[]> = new Observable<Estimate[]>();
  current_person$= new Observable<Person | null>();
  current_user$= new Observable<User | null>();

  estimatecards: EstimateCard[]= [];
  userRoleId: string;
  msgError:string='';

  personID: string;
  userID: string;

   questionIndex = new Map([
    [ '1', 0 ],
    [ "2", 1 ],
    [ "3", 2 ],
    [ '4', 3 ],
    [ "5", 4 ],
    [ "6", 5 ],

    [ '7', 0 ],
    [ "8", 1 ],
    [ "9", 2 ],
    [ '10',3 ],
    [ "11", 4 ],
    [ "12", 5 ],
    [ '59', 6 ],
    [ "60", 7 ],

    [ '13', 0 ],
    [ "14", 1 ],
    [ "15", 2 ],
    [ '16', 3 ],
    [ "17", 4 ],
    [ "18", 5 ],

    [ '19', 0 ],
    [ "20", 1 ],
    [ "21", 2 ],

    [ '22', 0 ],
    [ "23", 1 ],
    [ "24", 2 ],

    [ '25', 0 ],
    [ "26", 1 ],
    [ "27", 2 ],
    [ '28', 3 ],
    [ "29", 4 ],
    [ "30", 5 ],
    [ "61", 6 ],

    [ '31', 0 ],
    [ "32", 1 ],
    [ "33", 2 ],
    [ '34', 3 ],

    [ "35", 0 ],
    [ "36", 1 ],
    [ '37', 2 ],
    [ "38", 3 ],
    [ "39", 4 ],
]);

  categories = [
    { area: "OMSORG", id: "care",class: "care-class", 
    questions:[
      {text:'Barnet bor i en miljö som är anpassad efter barnets behov samt främjar dess utveckling', score:''}, 
      {text:'Barnet får extra stöd och vård när det behövs', score:''}, 
      {text:'Barnet har någon att lita på och vända sig till när det behövs', score:''},
      {text:'Barnet har någon som ser till att hen är ren och lämpligt klädd efter årstid', score:''},
      {text:'Barnet har tillgängliga vuxna som uppmuntrar och uppmärksammar det', score:''},
      {text:'Barnet får kognitiv stimulans av vuxna i sin närhet', score:''}
    ],
    comment:'', msgError:'',
    color: '#003686'},

    { area: "TRYGGHET", id: "security", class:'security-class', 
    questions:[
    {text:'Barnet känner sig trygg hemma, i skolan, på nätet och i sin närmiljö', score:''},
    {text: 'Barnet lever i en hemmiljö som är fri från missbruk, våld, försummelse och utnyttjande',score:''},
    {text: 'Barnet skyddas från att bli utnyttjat av andra', score:''},
    {text:'Barnet skyddas från fysiska faror och hälsofaror i och utanför hemmet',score:''},
    {text: 'Barnet skyddas från kränkningar',score:''}, 
    {text: 'Barnet skyddas från kriminalitet och olaglig verksamhet',score:''},
    {text:'Barnet visar förmåga att bedöma och hantera situationer som kan innebära en risk både för barnet själv och andra', score:''},
    {text: 'Barnet litar på de som finns i dess närhet, såväl barn som vuxna', score:''}, 
    ], 
    comment:'', msgError:'',
    color: '#353370'},

    { area: "MÅ BRA", id: "feel_good", class:'feel_good-class', 
    questions:[
    {text:'Barnet är frisk och upprätthåller god fysisk och psykisk hälsa', score:''},
    {text: 'Barnet deltar vid kontroller/besök som ska ge barnet stöd/hjälp', score:''}, 
    {text:'Barnet har en hälsosam livsstil', score:''}, 
    {text: 'Barnet kan hantera svårigheter och problem', score:''},
    {text: 'Barnet mår bra och ser positivt på framtiden', score:''}, 
    {text:'Barnet uppvisar inte negativa eller destruktiva beteenden', score:''}
  ], 
    comment:'', msgError:'',
    color: '#e0448c'},

    { area: "FRITID", id: "free_time", class:'free_time-class', 
    questions:[
    {text:'Barnet och familjen är aktiva tillsammans och gör saker som barnet tycker är roligt', score:''},
    {text: 'Barnet uppmuntras att vara aktiv utifrån sin förmåga, tex deltar i  lek, friluftsliv och idrottsaktiviteter', score:''}, 
    {text: 'Barnet uppmuntras och ges förutsättningar för att utveckla egna intressen och att delta i aktiviteter som är stimulerande', score:''}], 
    comment:'', msgError:'',
    color: '#df2d5b'},

    { area: "TILLHÖRIGHET", id: "beloning", class:'beloning-class', 
    questions:[
    {text: 'Barnet känner sig viktig och uppskattad av barn och vuxna som finn i dess närhet', score:''}, 
    {text:'Barnet känner sig viktig och uppskattad av de som tar hand om hen', score:''},
    {text: 'Familjen har ett socialt nätverk som deltar aktivt i barnets liv', score:''}
  ],  
    comment:'', msgError:'',
    color: '#eb612d'},

    { area: "ANSVARSTAGANDE", id: "responsibility", class:'responsibility-class', 
    questions:[
      {text:'Barnet deltar i undervisningen i skolan', score:''}, 
      {text: 'Barnet förstår vad som förväntas av hen och tar ansvar hemma, i skolan och i nära miljön.', score:''}, 
      {text:'Barnet har bra förebilder i sin närhet', score:''},
      {text:'Barnet kan förstå och följa regler', score:''},
      {text: 'Barnet tar ansvar för sina handlingar', score:''}, 
      {text: 'Barnet vet vad som är rätt och fel och agerar utifrån det', score:''}, 
      {text: 'Barnet visar hänsyn och omtanke om andra',score:''}, 
    ], 
    comment:'', msgError:'',
    color: '#f79c2e'},

    { area: "RESPEKTERAS", id: "respekt", class:'respekt-class', 
    questions:[
      {text: 'Barnet har en bra självkänsla och ser sig själv som värdeful', score:''},
      {text: 'Barnet känner sig inte retad, utsatt/utstött  eller kränkt av andra', score:''},
      {text:  'Barnet känner att vänner och andra tror på dess förmåga och stöttar hen', score:''}, 
      {text:  'Barnet känner sig lyssnad till, tagen på allvar och är delaktig i viktiga vardagsbeslut', score:''},
    ], 
    comment:'', msgError:'',
    color: '#4ba562'},

    { area: "UTVECKLAS", id: "develop", class:'develop-class', 
    questions:[
      {text: 'Barnet är nyfiket och motiverat till att lära sig nya saker', score:''}, 
      {text: 'Barnet har engagerade vuxna i sin närhet som stöttar hen i sin utveckling och i sitt lärande', score:''},
      {text: 'Barnet har utvecklat förmågor för att klara av och hantera sin vardag', score:''}, 
      {text: 'Barnet uppnår kunskapskraven för sin åldern', score:''}, 
      {text:'Barnet utvecklas och lär sig nya saker i olika miljöer', score:''},
    ],  
    comment:'', msgError:'',
    color: '#31acaf'}
  ];
  constructor(private store: Store<fromState.State>) {}

  ngOnInit(): void {
    this.current_person$ = this.store.select(fromState.getCurrentPerson);
    this.current_person$.subscribe(data=>{
      this.personID= data?.personID ?? '0'
    });

    this.current_user$= this.store.select(fromState.getCurrentUser);
    this.current_user$.subscribe(data=>{
      this.userRoleId= String(data?.roleID);
      this.userID= data?.userID ?? '0'
    });
    this.store.dispatch(new fromState.LoadEstimate(this.personID));

    this.estimates$ = this.store.select(fromState.getEstimates);
    this.estimates$.subscribe(data=>{

      data.map((estimate: Estimate)=>{

        let categories_data: any[]=[
          {scores: {}, comment:''},
          {scores:{}, comment:''},
          {scores:{}, comment:''},
          {scores:{}, comment:''},
          {scores: {}, comment:''},
          {scores: {}, comment:''},
          {scores: {}, comment:''},
          {scores: {}, comment:''}
        ];

        let questionID= estimate.questionID;
        let personID= estimate.personID;
        let userID= estimate.userID;

        let grade= estimate.grade;
        let comment= estimate.comment;
        
        let gradedOn= estimate.gradedOn;
        let changedOn= estimate.changedOn;
        let status= estimate.status;

        let questionLevelID= parseInt(estimate.questionLevelID)-1;
        let userName= estimate.userName;
        let index= this.questionIndex.get(String(questionID))??0;

        categories_data[questionLevelID].scores[0]= grade;
        categories_data[questionLevelID].comment= comment;
        if(status=='Sparat'){
          console.log(grade);
          console.log(comment);
          console.log('score is '+this.categories[questionLevelID].questions[index].score);
          console.log('comment is '+this.categories[questionLevelID].comment);
          this.categories[questionLevelID].questions[index].score= grade;
          this.categories[questionLevelID].comment= comment;

        }else{
          if(this.containsCard(gradedOn)){
            var found= false;
            this.estimatecards.forEach(element => {
              if(element.gradedOn== gradedOn && !false){
                found= true;
                element.grades[questionLevelID].scores[index]= grade;
                element.grades[questionLevelID].comment= comment;
  
              }      
            });
        
          }else{
            this.estimatecards.push(new EstimateCard(personID, userID, categories_data, gradedOn, changedOn, status, userName));
          }
        }

      })
    });
    console.log(this.estimatecards);
    this.store.dispatch(new fromState.LoadEstimateCards(this.estimatecards));

  }

  containsCard(date: string): boolean{
    var found= false;
    this.estimatecards.forEach(element => {
      if(element.gradedOn== date){
        found= true;
      }      
    });
    return found;
  }

  changeDirty(){
    this.isDirty= true;
  }
save() {
  this.categories[0].msgError='';
  this.categories[1].msgError='';
  this.categories[2].msgError='';
  this.categories[3].msgError='';
  this.categories[4].msgError='';
  this.categories[5].msgError='';
  this.categories[6].msgError='';
  this.categories[7].msgError='';

  this.categories[0].questions.forEach(element=>{
    console.log('in omsorg ');
    if(element.score==''){
      console.log('changing omsorg error');
      this.categories[0].msgError='Missade betyg i Omsorg kategori.';
      this.msgError='Rätta felen först';
    }
  });

  this.categories[1].questions.forEach(element=>{
    if(element.score==''){
      this.categories[1].msgError='Missade betyg i TRYGGHET kategori.';
      this.msgError='Rätta felen först';
    }
  });

  this.categories[2].questions.forEach(element=>{
    if(element.score==''){
      this.categories[2].msgError='Missade betyg i MÅ BRA kategori.';
      this.msgError='Rätta felen först';
    }
  });

  this.categories[3].questions.forEach(element=>{
    if(element.score==''){
      this.categories[3].msgError='Missade betyg i FRITID kategori.';
      this.msgError='Rätta felen först';
    }
  });

  this.categories[4].questions.forEach(element=>{
    if(element.score==''){
      this.categories[4].msgError='Missade betyg i TILLHÖRIGHET kategori.';
      this.msgError='Rätta felen först';
    }
  });

  this.categories[5].questions.forEach(element=>{
    if(element.score==''){
      this.categories[5].msgError='Missade betyg i ANSVARSTAGANDE kategori.';
      this.msgError='Rätta felen först';
    }
  });

  this.categories[6].questions.forEach(element=>{
    if(element.score==''){
      this.categories[6].msgError='Missade betyg i RESPEKTERAS kategori.';
      this.msgError='Rätta felen först';
    }
  });

  this.categories[7].questions.forEach(element=>{
    if(element.score==''){
      this.categories[7].msgError='Missade betyg i UTVECKLAS kategori.';
      this.msgError='Rätta felen först';
    }
  });

  if(this.msgError==''){
    var skattning={
      PersonID: parseInt(this.personID),
      UserID: parseInt(this.userID),

      GradeOmsorg1:parseInt(this.categories[0].questions[0].score),
      GradeOmsorg2:parseInt(this.categories[0].questions[1].score),
      GradeOmsorg3:parseInt(this.categories[0].questions[2].score),
      GradeOmsorg4:parseInt(this.categories[0].questions[3].score),
      GradeOmsorg5:parseInt(this.categories[0].questions[4].score),
      GradeOmsorg6:parseInt(this.categories[0].questions[5].score),
      CommentOmsorg:this.categories[0].comment,

      GradeTrygghet1: parseInt(this.categories[1].questions[0].score),
      GradeTrygghet2: parseInt(this.categories[1].questions[1].score),
      GradeTrygghet3: parseInt(this.categories[1].questions[2].score),
      GradeTrygghet4: parseInt(this.categories[1].questions[3].score),
      GradeTrygghet5: parseInt(this.categories[1].questions[4].score),
      GradeTrygghet6: parseInt(this.categories[1].questions[5].score),
      GradeTrygghet7: parseInt(this.categories[1].questions[6].score),
      GradeTrygghet8: parseInt(this.categories[1].questions[7].score),
      CommentTrygghet: this.categories[1].comment,

      GradeMarBra1:parseInt(this.categories[2].questions[0].score),
      GradeMarBra2:parseInt(this.categories[2].questions[1].score),
      GradeMarBra3:parseInt(this.categories[2].questions[2].score),
      GradeMarBra4:parseInt(this.categories[2].questions[3].score),
      GradeMarBra5:parseInt(this.categories[2].questions[4].score),
      GradeMarBra6:parseInt(this.categories[2].questions[5].score),
      CommentMarBra: this.categories[2].comment,

      GradeFritid1: parseInt(this.categories[3].questions[0].score),
      GradeFritid2: parseInt(this.categories[3].questions[1].score),
      GradeFritid3: parseInt(this.categories[3].questions[2].score),
      CommentFritid: this.categories[3].comment,

      GradeTillhorighet1: parseInt(this.categories[4].questions[0].score),
      GradeTillhorighet2:parseInt(this.categories[4].questions[1].score),
      GradeTillhorighet3:parseInt(this.categories[4].questions[2].score),
      CommentTillhorighet: this.categories[4].comment,

      GradeAnsvarstagande1: parseInt(this.categories[5].questions[0].score),
      GradeAnsvarstagande2: parseInt(this.categories[5].questions[1].score),
      GradeAnsvarstagande3: parseInt(this.categories[5].questions[2].score),
      GradeAnsvarstagande4: parseInt(this.categories[5].questions[3].score),
      GradeAnsvarstagande5: parseInt(this.categories[5].questions[4].score),
      GradeAnsvarstagande6: parseInt(this.categories[5].questions[5].score),
      GradeAnsvarstagande7: parseInt(this.categories[5].questions[6].score),
      CommentAnsvarstagande: this.categories[5].comment,

      GradeRespekteras1:parseInt(this.categories[6].questions[0].score),
      GradeRespekteras2:parseInt(this.categories[6].questions[1].score),
      GradeRespekteras3:parseInt(this.categories[6].questions[2].score),
      GradeRespekteras4:parseInt(this.categories[6].questions[3].score),
      CommentRespekteras: this.categories[6].comment,

      GradeUtvecklas1:parseInt(this.categories[7].questions[0].score),
      GradeUtvecklas2:parseInt(this.categories[7].questions[1].score),
      GradeUtvecklas3:parseInt(this.categories[7].questions[2].score),
      GradeUtvecklas4:parseInt(this.categories[7].questions[3].score),
      GradeUtvecklas5:parseInt(this.categories[7].questions[4].score),
      CommentUtvecklas: this.categories[7].comment,

    }
    console.log(this.personID);
    console.log(skattning);
    this.isDirty = false;
    this.store.dispatch(new fromState.CreateEstimateCard(skattning));
  }
}

}
