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
  scores:any[]=[];

  constructor(private _formBuilder: FormBuilder) { }

  ngOnInit(): void {
    this.scores=[ {id:1},{id:2}, {id:3}, {id:4},
                  {id:5}, {id:6}, {id:7},{id:8}];

    this.careFormGroup = this._formBuilder.group({
      care_1: [undefined, Validators.required],
      care_2: [undefined, Validators.required],
      care_3: [undefined, Validators.required],
      care_4: [undefined, Validators.required],
      care_5: [undefined, Validators.required],
      care_6: [undefined, Validators.required]
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
      { area: "OMSORG", question: ['Barnet har någon att lita på och vända sig till när det behövs',
       'Barnet har tillgängliga vuxna som uppmuntrar och uppmärksammar det', 'Barnet får kognitiv stimulans av vuxna i sin närhet',
        'Barnet får extra stöd och vård när det behövs', 'Barnet bor i en miljö som är anpassad efter barnets behov samt främjar dess utveckling', 
        'Barnet har någon som ser till att hen är ren och lämpligt klädd efter årstid'],
        stepControl: this.careFormGroup, id: "care-form"},
      { area: "TRYGGHET", question: ['Barnet känner sig trygg hemma, i skolan, på nätet och i sin närmiljö', 
      'Barnet skyddas från kränkningar', 'Barnet skyddas från fysiska faror och hälsofaror i och utanför hemmet', 
      'Barnet visar förmåga att bedöma och hantera situationer som kan innebära en risk både för barnet själv och andra', 
      'Barnet litar på de som finns i dess närhet, såväl barn som vuxna', 'Barnet skyddas från att bli utnyttjat av andra', 'Barnet skyddas från kriminalitet och olaglig verksamhet',
      'Barnet lever i en hemmiljö som är fri från missbruk, våld, försummelse och utnyttjande'],
      stepControl:this.securityFormGroup, id: "security-form"},
      { area: "MÅ BRA", question: ['Barnet är frisk och upprätthåller god fysisk och psykisk hälsa', 'Barnet har en hälsosam livsstil', 
      'Barnet mår bra och ser positivt på framtiden', 'Barnet kan hantera svårigheter och problem', 'Barnet deltar vid kontroller/besök som ska ge barnet stöd/hjälp', 
      'Barnet uppvisar inte negativa eller destruktiva beteenden'],
      stepControl:this.feelgoodFormGroup , id: "feelgood-form"},
      { area: "FRITID", question: ['Barnet och familjen är aktiva tillsammans och gör saker som barnet tycker är roligt', 
      'Barnet uppmuntras att vara aktiv utifrån sin förmåga, tex deltar i  lek, friluftsliv och idrottsaktiviteter', 'Barnet uppmuntras och ges förutsättningar för att utveckla egna intressen och att delta i aktiviteter som är stimulerande'],
      stepControl:this.freetimeFormGroup, id: "freetime-form"},
      { area: "TILLHÖRIGHET", question: ['Barnet känner sig viktig och uppskattad av de som tar hand om hen', 'Barnet känner sig viktig och uppskattad av barn och vuxna som finn i dess närhet', 
      'Familjen har ett socialt nätverk som deltar aktivt i barnets liv'],
      stepControl:this.beloningFormGroup, id: "beloning-form"},
      { area: "ANSVARSTAGANDE", question: ['Barnet deltar i undervisningen i skolan', 'Barnet kan förstå och följa regler', 
      'Barnet vet vad som är rätt och fel och agerar utifrån det', 'Barnet tar ansvar för sina handlingar', 'Barnet förstår vad som förväntas av hen och tar ansvar hemma, i skolan och i närmiljön.', 
      'Barnet visar hänsyn och omtanke om andra', 'Barnet har bra förebilder i sin närhet'],
      stepControl:this.responsibilityFormGroup , id: "responsibility-form"},
      { area: "RESPEKTERAS", question: ['Barnet känner sig lyssnad till, tagen på allvar och är delaktig i viktiga vardagsbeslut', 
      'Barnet har en bra självkänsla och ser sig själv som värdeful', 'Barnet känner att vänner och andra tror på dess förmåga och stöttar hen', 
      'Barnet känner sig inte retad, utsatt/utstött  eller kränkt av andra'], 
      stepControl:this.respektFormGroup, id: "respekt-form"},
      { area: "UTVECKLAS", question: ['Barnet utvecklas och lär sig nya saker i olika miljöer', 'Barnet är nyfiket och motiverat till att lära sig nya saker', 
      'Barnet uppnår kunskapskraven för sin åldern', 'Barnet har utvecklat förmågor för att klara av och hantera sin vardag', 'Barnet har engagerade vuxna i sin närhet som stöttar hen i sin utveckling och i sitt lärande'],
      stepControl:this.developFormGroup, id: "develop-form"},
    ];
  }

  changeScore(value: string, index1: number, index2: number){
    this.scores[index1][index2]= parseInt(value);
    console.log(this.scores[index1][index2]);
    console.log(this.scores);

  }

  send(): void{
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
