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
  questions = [
    { area: "OMSORG", question: ['Barnet har någon att lita på och vända sig till när det behövs',
     'Barnet har tillgängliga vuxna som uppmuntrar och uppmärksammar det', 'Barnet får kognitiv stimulans av vuxna i sin närhet',
      'Barnet får extra stöd och vård när det behövs', 'Barnet bor i en miljö som är anpassad efter barnets behov samt främjar dess utveckling', 
      'Barnet har någon som ser till att hen är ren och lämpligt klädd efter årstid'] },
    { area: "TRYGGHET", question: ['Barnet känner sig trygg hemma, i skolan, på nätet och i sin närmiljö', 
    'Barnet skyddas från kränkningar', 'Barnet skyddas från fysiska faror och hälsofaror i och utanför hemmet', 
    'Barnet visar förmåga att bedöma och hantera situationer som kan innebära en risk både för barnet själv och andra', 
    'Barnet litar på de som finns i dess närhet, såväl barn som vuxna', 'Barnet skyddas från att bli utnyttjat av andra', 'Barnet skyddas från kriminalitet och olaglig verksamhet',
    'Barnet lever i en hemmiljö som är fri från missbruk, våld, försummelse och utnyttjande']},
    { area: "MÅ BRA", question: ['Barnet är frisk och upprätthåller god fysisk och psykisk hälsa', 'Barnet har en hälsosam livsstil', 
    'Barnet mår bra och ser positivt på framtiden', 'Barnet kan hantera svårigheter och problem', 'Barnet deltar vid kontroller/besök som ska ge barnet stöd/hjälp', 
    'Barnet uppvisar inte negativa eller destruktiva beteenden'] },
    { area: "FRITID", question: ['Barnet och familjen är aktiva tillsammans och gör saker som barnet tycker är roligt', 
    'Barnet uppmuntras att vara aktiv utifrån sin förmåga, tex deltar i  lek, friluftsliv och idrottsaktiviteter', 'Barnet uppmuntras och ges förutsättningar för att utveckla egna intressen och att delta i aktiviteter som är stimulerande']},
    { area: "TILLHÖRIGHET", question: ['Barnet känner sig viktig och uppskattad av de som tar hand om hen', 'Barnet känner sig viktig och uppskattad av barn och vuxna som finn i dess närhet', 
    'Familjen har ett socialt nätverk som deltar aktivt i barnets liv']},
    { area: "ANSVARSTAGANDE", question: ['Barnet deltar i undervisningen i skolan', 'Barnet kan förstå och följa regler', 
    'Barnet vet vad som är rätt och fel och agerar utifrån det', 'Barnet tar ansvar för sina handlingar', 'Barnet förstår vad som förväntas av hen och tar ansvar hemma, i skolan och i närmiljön.', 
    'Barnet visar hänsyn och omtanke om andra', 'Barnet har bra förebilder i sin närhet'] },
    { area: "RESPEKTERAS", question: ['Barnet känner sig lyssnad till, tagen på allvar och är delaktig i viktiga vardagsbeslut', 
    'Barnet har en bra självkänsla och ser sig själv som värdeful', 'Barnet känner att vänner och andra tror på dess förmåga och stöttar hen', 
    'Barnet känner sig inte retad, utsatt/utstött  eller kränkt av andra'] },
    { area: "UTVECKLAS", question: ['Barnet utvecklas och lär sig nya saker i olika miljöer', 'Barnet är nyfiket och motiverat till att lära sig nya saker', 
    'Barnet uppnår kunskapskraven för sin åldern', 'Barnet har utvecklat förmågor för att klara av och hantera sin vardag', 'Barnet har engagerade vuxna i sin närhet som stöttar hen i sin utveckling och i sitt lärande']},
  ];


  careFormGroup: FormGroup;
  securityFormGroup: FormGroup;
  feelgoodFormGroup: FormGroup;
  beloningFormGroup: FormGroup;
  responsibilityFormGroup: FormGroup;
  respektFormGroup: FormGroup;
  developFormGroup: FormGroup;
  freetimeFormGroup: FormGroup;

  care_1: string;
  care_2: string;
  care_3: string;
  care_4: string;
  care_5: string;
  care_6: string;

  security_1:string;
  security_2:string;
  security_3:string;
  security_4:string;
  security_5:string;
  security_6:string;
  security_7:string;
  security_8:string;

  feelgood_1:string;
  feelgood_2:string;
  feelgood_3:string;
  feelgood_4:string;
  feelgood_5:string;
  feelgood_6:string;

  freetime_1:string;
  freetime_2:string;
  freetime_3:string;

  beloning_1:string;
  beloning_2:string;
  beloning_3:string;

  responsibility_1:string;
  responsibility_2:string;
  responsibility_3:string;
  responsibility_4:string;
  responsibility_5:string;
  responsibility_6:string;
  responsibility_7:string;

  respekt_1:string;
  respekt_2:string;
  respekt_3:string;
  respekt_4:string;

  develop_1:string;
  develop_2:string;
  develop_3:string;
  develop_4:string;
  develop_5:string;

  saveError='';

  constructor(private _formBuilder: FormBuilder) { }

  ngOnInit(): void {
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

    

/*   
  console.log(this.care_1);
    console.log(this.care_2);
    console.log(this.care_3);
    console.log(this.care_4);
    console.log(this.care_5);
    console.log(this.care_6);

    console.log(this.security_1);
    console.log(this.security_2);
    console.log(this.security_3);
    console.log(this.security_4);
    console.log(this.security_5);
    console.log(this.security_6);
    console.log(this.security_7);
    console.log(this.security_8);

    console.log(this.feelgood_1);
    console.log(this.feelgood_2);
    console.log(this.feelgood_3);
    console.log(this.feelgood_4);
    console.log(this.feelgood_5);
    console.log(this.feelgood_6);

    console.log(this.freetime_1);
    console.log(this.freetime_2);
    console.log(this.freetime_3);

    console.log(this.beloning_1);
    console.log(this.beloning_2);
    console.log(this.beloning_3);

    console.log(this.responsibility_1);
    console.log(this.responsibility_2);
    console.log(this.responsibility_3);
    console.log(this.responsibility_4);
    console.log(this.responsibility_5);
    console.log(this.responsibility_6);
    console.log(this.responsibility_7);

    console.log(this.respekt_1);
    console.log(this.respekt_2);
    console.log(this.respekt_3);
    console.log(this.respekt_4);

    console.log(this.develop_1);
    console.log(this.develop_2);
    console.log(this.develop_3);
    console.log(this.develop_4);
    console.log(this.develop_5);

 */  }

}
