import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {STEPPER_GLOBAL_OPTIONS} from '@angular/cdk/stepper';
import * as fromRoot from '../../state';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import { Observable } from 'rxjs';
import { Person } from 'src/app/models/Person';

@Component({
  selector: 'app-estimate',
  templateUrl: './estimate.component.html',
  styleUrls: ['./estimate.component.scss'],
  providers: [{
    provide: STEPPER_GLOBAL_OPTIONS, useValue: {showError: true}
  }]

})
export class EstimateComponent implements OnInit {
  current_person$= new Observable<Person | null>();

  userRoleId: string;

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
    comment:'', 
    oldScores:[{date:'2021', scores:['3','4','5'], comment:'zdhdrejuzejhhxztjruuxtyu,x m,ruyzty'},
    {date:'2020', scores:['6','7','8'], 
    comment:'zjzedjz<hzdhzdrkmhäl<räglömsdgmlö'},
    {date:'2019', scores:['9','10','11'], 
    comment:'<euhdjueudköSJGNöEKAJGNökjzn '},
    {date:'2018', scores:['13','14','15'], comment:'<euhzedtjrtj'},
    {date:'2020', scores:['31','41','51'], comment:'zetjzedtj'},
    {date:'2019', scores:['3','4','5'], comment:'8pöipöu9göl'},
    {date:'2018', scores:['3','4','5'], comment:'tis5ua4y'},
    {date:'2018', scores:['3','4','5'], comment:'a375ae3u7jtj'},
    {date:'2020', scores:['3','4','5'], comment:'eru5a4utsh'},
    {date:'2019', scores:['3','4','5'], comment:'5auja54u5a'},
    {date:'2018', scores:['3','4','5'], comment:'56ie5uazeu4'},
    {date:'2018', scores:['3','4','5'], comment:'e5ayae5ujzt'},
    {date:'2017', scores:['3','4','5'], comment:'aw4usr46i'}],
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
    comment:'', 
    oldScores:[{date:'2021', scores:['3','4','5']},
    {date:'2020', scores:['3','4','5'], comment:''},
    {date:'2019', scores:['3','4','5'], comment:''},
    {date:'2018', scores:['3','4','5'], comment:''},
    {date:'2020', scores:['3','4','5'], comment:''},
    {date:'2019', scores:['3','4','5'], comment:''},
    {date:'2018', scores:['3','4','5'], comment:''},
    {date:'2017', scores:['3','4','5'], comment:''}],
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
    comment:'', 
    oldScores:[{date:'2021', scores:['3','4','5'], comment:''},
    {date:'2020', scores:['3','4','5'], comment:''},
    {date:'2019', scores:['3','4','5'], comment:''},
    {date:'2018', scores:['3','4','5'], comment:''},
    {date:'2020', scores:['3','4','5'], comment:''},
    {date:'2019', scores:['3','4','5'], comment:''},
    {date:'2018', scores:['3','4','5'], comment:''},
    {date:'2017', scores:['3','4','5'], comment:''}],
    color: '#e0448c'},

    { area: "FRITID", id: "free_time", class:'free_time-class', 
    questions:[
    {text:'Barnet och familjen är aktiva tillsammans och gör saker som barnet tycker är roligt', score:''},
    {text: 'Barnet uppmuntras att vara aktiv utifrån sin förmåga, tex deltar i  lek, friluftsliv och idrottsaktiviteter', score:''}, 
    {text: 'Barnet uppmuntras och ges förutsättningar för att utveckla egna intressen och att delta i aktiviteter som är stimulerande', score:''}], 
    comment:'', 
    oldScores:[{date:'2021', scores:['3','4','5'], comment:''},
    {date:'2020', scores:['3','4','5'], comment:''},
    {date:'2019', scores:['3','4','5'], comment:''},
    {date:'2018', scores:['3','4','5'], comment:''},
    {date:'2020', scores:['3','4','5'], comment:''},
    {date:'2019', scores:['3','4','5'], comment:''},
    {date:'2018', scores:['3','4','5'], comment:''},
    {date:'2017', scores:['3','4','5'], comment:''}],
    color: '#df2d5b'},

    { area: "TILLHÖRIGHET", id: "beloning", class:'beloning-class', 
    questions:[
    {text: 'Barnet känner sig viktig och uppskattad av barn och vuxna som finn i dess närhet', score:''}, 
    {text:'Barnet känner sig viktig och uppskattad av de som tar hand om hen', score:''},
    {text: 'Familjen har ett socialt nätverk som deltar aktivt i barnets liv', score:''}
  ],  
    comment:'', 
    oldScores:[{date:'2021', scores:['3','4','5'], comment:''},
    {date:'2020', scores:['3','4','5'], comment:''},
    {date:'2019', scores:['3','4','5'], comment:''},
    {date:'2018', scores:['3','4','5'], comment:''},
    {date:'2020', scores:['3','4','5'], comment:''},
    {date:'2019', scores:['3','4','5'], comment:''},
    {date:'2018', scores:['3','4','5'], comment:''},
    {date:'2017', scores:['3','4','5'], comment:''}],
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
    comment:'', 
    oldScores:[{date:'2021', scores:['3','4','5'], comment:''},
    {date:'2020', scores:['3','4','5'], comment:''},
    {date:'2019', scores:['3','4','5'], comment:''},
    {date:'2018', scores:['3','4','5'], comment:''},
    {date:'2020', scores:['3','4','5'], comment:''},
    {date:'2019', scores:['3','4','5'], comment:''},
    {date:'2018', scores:['3','4','5'], comment:''},
    {date:'2017', scores:['3','4','5'], comment:''}],
    color: '#f79c2e'},

    { area: "RESPEKTERAS", id: "respekt", class:'respekt-class', 
    questions:[
      {text: 'Barnet har en bra självkänsla och ser sig själv som värdeful', score:''},
      {text: 'Barnet känner sig inte retad, utsatt/utstött  eller kränkt av andra', score:''},
      {text:  'Barnet känner att vänner och andra tror på dess förmåga och stöttar hen', score:''}, 
      {text:  'Barnet känner sig lyssnad till, tagen på allvar och är delaktig i viktiga vardagsbeslut', score:''},
    ], 
    comment:'', 
    oldScores:[{date:'2021', scores:['3','4','5'], comment:''},
    {date:'2020', scores:['3','4','5'], comment:''},
    {date:'2019', scores:['3','4','5'], comment:''},
    {date:'2018', scores:['3','4','5'], comment:''},
    {date:'2020', scores:['3','4','5'], comment:''},
    {date:'2019', scores:['3','4','5'], comment:''},
    {date:'2018', scores:['3','4','5'], comment:''},
    {date:'2017', scores:['3','4','5'], comment:''}],
    color: '#4ba562'},

    { area: "UTVECKLAS", id: "develop", class:'develop-class', 
    questions:[
      {text: 'Barnet är nyfiket och motiverat till att lära sig nya saker', score:''}, 
      {text: 'Barnet har engagerade vuxna i sin närhet som stöttar hen i sin utveckling och i sitt lärande', score:''},
      {text: 'Barnet har utvecklat förmågor för att klara av och hantera sin vardag', score:''}, 
      {text: 'Barnet uppnår kunskapskraven för sin åldern', score:''}, 
      {text:'Barnet utvecklas och lär sig nya saker i olika miljöer', score:''},
    ],  
    comment:'', 
    oldScores:[{date:'2021', scores:['3','4','5'], comment:''},
    {date:'2020', scores:['3','4','5'], comment:''},
    {date:'2019', scores:['3','4','5'], comment:''},
    {date:'2018', scores:['3','4','5'], comment:''},
    {date:'2020', scores:['3','4','5'], comment:''},
    {date:'2019', scores:['3','4','5'], comment:''},
    {date:'2018', scores:['3','4','5'], comment:''},
    {date:'2017', scores:['3','4','5'], comment:''}],
    color: '#31acaf'}
  ];
  constructor(private store: Store<fromState.State>) {}

  ngOnInit(): void {
    this.current_person$ = this.store.select(fromState.getCurrentPerson);
    this.current_person$.subscribe(data=>{
    });

    this.store.select(fromState.getCurrentUser).subscribe(data=>{
      this.userRoleId= String(data?.roleID);

    });
  }
save() {
  console.log(this.categories);
}

}
