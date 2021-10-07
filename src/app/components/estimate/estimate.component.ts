import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {STEPPER_GLOBAL_OPTIONS} from '@angular/cdk/stepper';

@Component({
  selector: 'app-estimate',
  templateUrl: './estimate.component.html',
  styleUrls: ['./estimate.component.scss'],
  providers: [{
    provide: STEPPER_GLOBAL_OPTIONS, useValue: {showError: true}
  }]

})
export class EstimateComponent implements OnInit {

  careFormGroup: FormGroup;
  securityFormGroup: FormGroup;
  feelgoodFormGroup: FormGroup;
  beloningFormGroup: FormGroup;
  responsibilityFormGroup: FormGroup;
  respektFormGroup: FormGroup;
  developFormGroup: FormGroup;
  freetimeFormGroup: FormGroup;

  saveError='';
  questions:any []=[];

  care_1: string;
  care_2: string;
  care_3: string; 
  care_4: string;
  care_5: string; 
  care_6: string;

  security_1: string; 
  security_2: string; 
  security_3: string; 
  security_4: string; 
  security_5: string; 
  security_6: string; 
  security_7: string; 
  security_8: string;

  feelgood_1: string; 
  feelgood_2: string; 
  feelgood_3: string; 
  feelgood_4: string; 
  feelgood_5: string; 
  feelgood_6: string;

  beloning_1: string; 
  beloning_2: string; 
  beloning_3: string;
 

  responsibility_1: string; 
  responsibility_2: string; 
  responsibility_3: string; 
  responsibility_4: string; 
  responsibility_5: string; 
  responsibility_6: string; 
  responsibility_7: string;
 

  respekt_1: string; 
  respekt_2: string; 
  respekt_3: string; 
  respekt_4: string; 

  develop_1: string; 
  develop_2: string; 
  develop_3: string; 
  develop_4: string; 
  develop_5: string;

  freetime_1: string; 
  freetime_2: string; 
  freetime_3: string; 


  constructor(private _formBuilder: FormBuilder) { }

  ngOnInit(): void {

    this.careFormGroup = this._formBuilder.group({
      care_1: [undefined, Validators.required],
      care_2: [undefined, Validators.required],
      care_3: [undefined, Validators.required],
      care_4: [undefined, Validators.required],
      care_5: [undefined, Validators.required],
      care_6: [undefined, Validators.required],
    }); 

    this.securityFormGroup = this._formBuilder.group({
      security_1: [undefined, Validators.required],
      security_2: [undefined, Validators.required],
      security_3: [undefined, Validators.required],
      security_4: [undefined, Validators.required],
      security_5: [undefined, Validators.required],
      security_6: [undefined, Validators.required],
      security_7: [undefined, Validators.required],
      security_8: [undefined, Validators.required]
    }); 

    this.feelgoodFormGroup = this._formBuilder.group({
      feelgood_1: [undefined, Validators.required],
      feelgood_2: [undefined, Validators.required],
      feelgood_3: [undefined, Validators.required],
      feelgood_4: [undefined, Validators.required],
      feelgood_5: [undefined, Validators.required],
      feelgood_6: [undefined, Validators.required]
    }); 

    this.beloningFormGroup = this._formBuilder.group({
      beloning_1: [undefined, Validators.required],
      beloning_2: [undefined, Validators.required],
      beloning_3: [undefined, Validators.required]
    }); 

    this.responsibilityFormGroup = this._formBuilder.group({
      responsibility_1: [undefined, Validators.required],
      responsibility_2: [undefined, Validators.required],
      responsibility_3: [undefined, Validators.required],
      responsibility_4: [undefined, Validators.required],
      responsibility_5: [undefined, Validators.required],
      responsibility_6: [undefined, Validators.required],
      responsibility_7: [undefined, Validators.required]
    }); 

    this.respektFormGroup = this._formBuilder.group({
      respekt_1: [undefined, Validators.required],
      respekt_2: [undefined, Validators.required],
      respekt_3: [undefined, Validators.required],
      respekt_4: [undefined, Validators.required],
    }); 

    this.developFormGroup = this._formBuilder.group({
      develop_1: [undefined, Validators.required],
      develop_2: [undefined, Validators.required],
      develop_3: [undefined, Validators.required],
      develop_4: [undefined, Validators.required],
      develop_5: [undefined, Validators.required]
    }); 

    this.freetimeFormGroup = this._formBuilder.group({
      freetime_1: [undefined, Validators.required],
      freetime_2: [undefined, Validators.required],
      freetime_3: [undefined, Validators.required]
    }); 

    this.questions = [
      { area: "OMSORG", question: [{text:'Barnet har någon att lita på och vända sig till när det behövs', score: 'care_1'},
      {text:'Barnet har tillgängliga vuxna som uppmuntrar och uppmärksammar det', score: 'care_2'}, {text:'Barnet får kognitiv stimulans av vuxna i sin närhet', score: 'care_3'},
      {text:'Barnet får extra stöd och vård när det behövs', score:'care_4'}, {text:'Barnet bor i en miljö som är anpassad efter barnets behov samt främjar dess utveckling', score:'care_5'}, 
      {text:'Barnet har någon som ser till att hen är ren och lämpligt klädd efter årstid', score: 'care_6'}],
      stepControl: this.careFormGroup, id: "care-form", comment:''},
      
      { area: "TRYGGHET", question: [{text:'Barnet känner sig trygg hemma, i skolan, på nätet och i sin närmiljö',score: this.security_1}, 
      {text: 'Barnet skyddas från kränkningar',score: this.security_2}, {text:'Barnet skyddas från fysiska faror och hälsofaror i och utanför hemmet',score: this.security_3},
      {text:'Barnet visar förmåga att bedöma och hantera situationer som kan innebära en risk både för barnet själv och andra', score: this.security_4},
      {text: 'Barnet litar på de som finns i dess närhet, såväl barn som vuxna', score:this.security_5}, {text: 'Barnet skyddas från att bli utnyttjat av andra', score:this.security_6},
      {text: 'Barnet skyddas från kriminalitet och olaglig verksamhet',score: this.security_7},
      {text: 'Barnet lever i en hemmiljö som är fri från missbruk, våld, försummelse och utnyttjande',score: this.security_8}],
      stepControl:this.securityFormGroup, id: "security-form", comment:''},
      
      { area: "MÅ BRA", question: [ {text:'Barnet är frisk och upprätthåller god fysisk och psykisk hälsa', score: this.feelgood_1},  {text:'Barnet har en hälsosam livsstil', score: this.feelgood_2}, 
      {text: 'Barnet mår bra och ser positivt på framtiden', score: this.feelgood_3}, {text: 'Barnet kan hantera svårigheter och problem', score: this.feelgood_4},
       {text: 'Barnet deltar vid kontroller/besök som ska ge barnet stöd/hjälp', score: this.feelgood_5}, 
      {text:'Barnet uppvisar inte negativa eller destruktiva beteenden', score: this.feelgood_6}],
      stepControl:this.feelgoodFormGroup , id: "feelgood-form", comment:''},
      
      {area: "FRITID", question: [{text: 'Barnet och familjen är aktiva tillsammans och gör saker som barnet tycker är roligt', score: this.freetime_1}, 
      {text: 'Barnet uppmuntras att vara aktiv utifrån sin förmåga, tex deltar i  lek, friluftsliv och idrottsaktiviteter', score: this.freetime_2}, 
      {text: 'Barnet uppmuntras och ges förutsättningar för att utveckla egna intressen och att delta i aktiviteter som är stimulerande', score: this.freetime_3}],
      stepControl:this.freetimeFormGroup, id: "freetime-form", comment:''},
      
      { area: "TILLHÖRIGHET", question: [{text: 'Barnet känner sig viktig och uppskattad av de som tar hand om hen', score: this.beloning_1}, 
      {text: 'Barnet känner sig viktig och uppskattad av barn och vuxna som finn i dess närhet', score: this.beloning_2}, 
      {text: 'Familjen har ett socialt nätverk som deltar aktivt i barnets liv', score: this.beloning_3}],
      stepControl:this.beloningFormGroup, id: "beloning-form", comment:''},
      
      { area: "ANSVARSTAGANDE", question: [{text: 'Barnet deltar i undervisningen i skolan', score: this.responsibility_1}, {text:'Barnet kan förstå och följa regler', score: this.responsibility_2}, 
      {text: 'Barnet vet vad som är rätt och fel och agerar utifrån det', score: this.responsibility_3}, {text: 'Barnet tar ansvar för sina handlingar', score: this.responsibility_4}, 
      {text: 'Barnet förstår vad som förväntas av hen och tar ansvar hemma, i skolan och i nära miljön.', score: this.responsibility_5}, 
      {text: 'Barnet visar hänsyn och omtanke om andra',score:this.responsibility_6}, {text:'Barnet har bra förebilder i sin närhet', score:this.responsibility_7}],
      stepControl:this.responsibilityFormGroup , id: "responsibility-form", comment:''},
      
      { area: "RESPEKTERAS", question: [{text: 'Barnet känner sig lyssnad till, tagen på allvar och är delaktig i viktiga vardagsbeslut', score: this.respekt_1}, 
      {text: 'Barnet har en bra självkänsla och ser sig själv som värdeful', score: this.respekt_2},{text:  'Barnet känner att vänner och andra tror på dess förmåga och stöttar hen', score: this.respekt_3}, 
      {text: 'Barnet känner sig inte retad, utsatt/utstött  eller kränkt av andra', score: this.respekt_4}], 
      stepControl:this.respektFormGroup, id: "respekt-form", comment: ''},
      
      { area: "UTVECKLAS", question: [{text: 'Barnet utvecklas och lär sig nya saker i olika miljöer', score: this.develop_1}, 
      {text: 'Barnet är nyfiket och motiverat till att lära sig nya saker', score: this.develop_2}, 
      {text: 'Barnet uppnår kunskapskraven för sin åldern', score: this.develop_3}, {text: 'Barnet har utvecklat förmågor för att klara av och hantera sin vardag', score: this.develop_4}, 
      {text: 'Barnet har engagerade vuxna i sin närhet som stöttar hen i sin utveckling och i sitt lärande', score: this.develop_5}],
      stepControl:this.developFormGroup, id: "develop-form", comment:''},
    ];
  }

  changeScore(value: string, index1: number, index2: number){

    
    this.questions[index1].question[index2].score= value;
    console.log(this.care_1);
  }

  send(): void{
    console.log(this.questions[0].comment);

    if(this.careFormGroup.status== "INVALID" ||
    this.securityFormGroup.status=="INVALID" ||
    this.feelgoodFormGroup.status=="INVALID" ||
    this.beloningFormGroup.status=="INVALID" ||
    this.responsibilityFormGroup.status=="INVALID" ||
    this.respektFormGroup.status=="INVALID" ||
    this.developFormGroup.status=="INVALID" ||
    this.freetimeFormGroup.status=="INVALID"){

      this.saveError='Du har missat att välja ett poäng';
    }else{
      this.saveError='';
    }
}

}
