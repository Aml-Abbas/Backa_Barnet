import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { Contact } from 'src/app/models/Contact';
import { DiscoverCard } from 'src/app/models/DiscoverCard';
import { Unit } from 'src/app/models/Unit';
import { Person } from 'src/app/models/Person';
import { ConversationMaterial } from 'src/app/models/ConversationMaterial';
import { Status } from 'src/app/models/Status';
import { Estimate } from 'src/app/models/Estimate';
import { Card } from 'src/app/models/Card';
import axios from 'axios';
import { ConversationCard } from 'src/app/models/ConversationCard';
import { EstimateCard } from 'src/app/models/EstimateCard';


@Injectable({
  providedIn: 'root'
})
export class GetSetService {

  constructor(private http: HttpClient) { }

  getPersons(userId: string): Observable<Person[]> {
    return this.http.get<Person[]>('https://func-ykbb.azurewebsites.net/api/person/'+userId+'?code=SkXpI51pgjWl6UVNjxKjKNUr3o2gmPdlOZ4EFMFwn0LR0KlyDlYu3w==');
  }
 /*  getContacts(personNbr: string): Observable<Contact[]> {
    return this.http.get<Contact[]>('https://func-ykbb.azurewebsites.net/api/contact/' + personNbr + '?code=tc2OJy49azMOIqZUVev09yLarIt8kQfg7gr6GGs3uG3daqLORwHPhg==');
  } */

  async getCards(userId: string): Promise<Card[]> {
    var cards: Card[]= [];

  await axios.get('https://func-ykbb.azurewebsites.net/api/card/'+userId+'?code=bbdIBAbikn/AMydOBvxm69FyKFhRfS4fxUb55SaSz0TfK/cjnxiYEw==')
  .then(function (response) {
    var questions: string []= [];
    var grades: string[]= [];
    var comments: string[]= [];

      var index=1;
      response.data.forEach((discoverCard: DiscoverCard)=>{
        let gradedOn= discoverCard.gradedOn;

        let userName= discoverCard.userName;
        let userOrg= discoverCard.userOrg;
        let userTitle= discoverCard.userTitle;

        let personName='Dolt';
        if(discoverCard.personName !=" " && discoverCard.personName !="0 0" ){
          personName= discoverCard.personName;
        }
        let personNbr='Dolt';
        if(discoverCard.personNbr!="" && discoverCard.personNbr!="0"){
          personNbr= discoverCard.personNbr;
        }
        let guardian1='Dolt';
        if(discoverCard.guardian1 !=''&& discoverCard.personNbr!="0"){
          guardian1= discoverCard.guardian1;
        }
        let guardianPersonNbr1='Dolt';
        if(discoverCard.guardianPersonNbr1 !=''&& discoverCard.personNbr!="0"){
          guardianPersonNbr1= discoverCard.guardianPersonNbr1;
        }
        let guardian2='Dolt';
        if(discoverCard.guardian2 !=''&& discoverCard.personNbr!="0"){
          guardian2= discoverCard.guardian2;
        }
        let guardianPersonNbr2='Dolt';
        if(discoverCard.guardianPersonNbr2 !=''&& discoverCard.personNbr!="0"){
          guardianPersonNbr2= discoverCard.guardianPersonNbr2;
        }

        let unit = discoverCard.unit;
        let situation = discoverCard.situation;

        let questionID= discoverCard.questionID;
        let grade= discoverCard.grade;
        let comment='';
        if(discoverCard.comment !='0'){
          comment= discoverCard.comment;
        }
        let status =discoverCard.status;
        let personID= discoverCard.personID;

        if(!containsCard(cards, discoverCard.gradedOn)){
          questions.push(questionID);
          grades.push(grade);
          comments.push(comment);
          cards = Object.assign([], cards);
          cards.push(new Card(String(index), gradedOn, userName, userOrg, userTitle,
          personName, personNbr, guardian1, guardianPersonNbr1, guardian2, guardianPersonNbr2,
          unit, situation, questions, grades, comments, status, personID));

            questions= [];
            grades= [];
            comments= [];
          
            index++;
          }else{
            cards.forEach(element => {
              if(element.gradedOn== gradedOn && !containsQuestion(element, questionID)){
                element.questions.push(questionID);
                element.grades.push(grade);
                element.comments.push(comment);
              }      
            });
        }
      })
})
  .catch(function (error) {
    console.log(error);
  })
  .then(function () {
  });
    return cards;
  }

  getUnits(): Observable<Unit[]> {
    return this.http.get<Unit[]>('https://func-ykbb.azurewebsites.net/api/unit?code=7od5M5/US4aBc4L61rBOQKHBv3CXO7sWhxxQtZXi43tDknxT2zuIzQ==');
  }

  createCard(discoverCardJson: any) {
    return this.http.post('https://func-ykbb.azurewebsites.net/api/card/create?code=Cvux9kZKdDPlaG0IA5taD4gsFzO6ajU9TMlh5OzAparDg6fCOEw6Gg==', discoverCardJson);
  }

  updateCard(discoverCardJson: any) {
    return this.http.post('https://func-ykbb.azurewebsites.net/api/card/edit?code=cCU4EzCLLZa4rtBjMG3eyeR6PnEnAZny88uJC7WXI2axOzTaeJfIJA==', discoverCardJson);
  }

  async getConversationMaterial(personId: string): Promise<ConversationCard[]> {
    var cards: ConversationCard[]= [];

    await axios.get('https://func-ykbb.azurewebsites.net/api/substrate/'+personId +'?code=ggX3h9u8RzHKyqnuNwDAdMdAMV6pceMAHuwRcHEt1UHw14gh1KFI5Q==')
    .then(function (response) {  
      var questionsID: string []= [];
      var grades: string[]= [];
      var comments: string[]= [];
      var grades1: string[]= [];
      var comments1: string[]= [];
      var grades2: string[]= [];
      var comments2: string[]= [];
    
        var index=1;
        response.data.forEach((conversationMaterial: ConversationMaterial)=>{
          let questionID= conversationMaterial.questionID;
          let personID= conversationMaterial.personID;
  
          let grade= conversationMaterial.grade;
  
          let comment= '';
          if(conversationMaterial.comment!='0'){
            comment= conversationMaterial.comment;
          }
          
          let gradeType= conversationMaterial.gradeType;
          let gradedOn= conversationMaterial.gradedOn;
          let status= conversationMaterial.status;
  
  
          if(!containsCardDiscoverCard(cards, conversationMaterial.gradedOn)){
           questionsID.push(questionID);
           if(gradeType=='Guardian2'){
            grades2.push(grade);
            comments2.push(comment);
           }else if(gradeType=='Guardian1'){
            grades1.push(grade);
            comments1.push(comment);
           }else{
            grades.push(grade);
            comments.push(comment);
           }
  
           cards.push(new ConversationCard(String(index), personID, questionsID, grades, comments,
              grades1, comments1, grades2, comments2, gradedOn, status));
              questionsID= [];
  
              grades= [];
              comments= [];
              grades1= [];
              comments1= [];
              grades2= [];
              comments2= [];
  
              index++;
            }else{
              cards.forEach(element => {
                if(element.gradedOn== gradedOn){
                  element.questionsID.push(questionID);
                  if(gradeType=='Guardian2'){
                    element.guardian2_scores.push(grade);
                    element.guardian2_comments.push(comment);
    
                     }else if(gradeType=='Guardian1'){
                      element.guardian1_scores.push(grade);
                      element.guardian1_comments.push(comment);
                       }else{
                        element.person_scores.push(grade);
                        element.person_comments.push(comment);
                       }
                }      
              });
          }
        })
  })
    .catch(function (error) {
      console.log(error);
    })
    .then(function () {
    });
        return cards;
  }

  createConversationMaterial(coversationMaterial: any) {
    return this.http.post('https://func-ykbb.azurewebsites.net/api/substrate/create?code=GHuYJ59bBXGZ0p2gn/5iToaQCiKHp7ufdIH7ZicPDrbOK51coYK7YQ==', coversationMaterial);
  }

  updateConversationMaterial(coversationMaterial: any) {
    return this.http.post('https://func-ykbb.azurewebsites.net/api/substrate/edit?code=PoXQacRit21YwOyOtFzvX7DKB8ex4pS47lRZwTNOQdB/XfDsN3N8eA==', coversationMaterial);
  } 

  getStatus(personId: string): Observable<Status[]>{
    return this.http.get<Status[]>('https://func-ykbb.azurewebsites.net/api/status/'+personId+'?code=cRLUN5Mei3Y67vDp3DjdlS9UKL3rE0rPIfkx7ywkJqpZQ398FjMR/w==');
  }

  setStatus(info: any){
    return this.http.post('https://func-ykbb.azurewebsites.net/api/status/edit?code=t0hLgeixqD5hP4bpYzoizDzuklX38U5/28BRLy1C5LJo4S5hzC3kyQ==', info);
  }

  createEstimate(estimateJson: any) {
    return this.http.post('https://func-ykbb.azurewebsites.net/api/estimate/create?code=ZnNUlhrtXVvn3xAtzMbpBpqMxO5EvvAxkxnYqVa9jaIPixAqZ66BuQ==', estimateJson);
  }

  async getEstimate(personId: string): Promise<EstimateCard[]> {
    var cards: EstimateCard[]= [];

    await axios.get('https://func-ykbb.azurewebsites.net/api/estimate/'+personId+'?code=claTs5kzCfU60tGySXhvQbz3c01kADTGq2QT3nGWPfslBL7tbARORg==')
    .then(function (response) {
          response.data.forEach((estimate: Estimate)=>{
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
          let average: number[]=[];

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
          let index= questionIndex.get(String(questionID))??0;
  
          categories_data[questionLevelID].scores[0]= grade;
          categories_data[questionLevelID].comment= comment;

          if(containsEstimateCard(cards, gradedOn)){
            var found= false;
            cards.forEach(element => {
              if(element.gradedOn== gradedOn && !found){
                found= true;
                element.grades[questionLevelID].scores[index]= grade;
                element.grades[questionLevelID].comment= comment;                
              }      
            });
        
          }else{
            cards.push(new EstimateCard(personID, userID, categories_data, average,
               gradedOn, changedOn, status, userName));
          }
        })
        cards.forEach(card=>{
          card.grades.forEach(score=>{
            var values: string[] = Object.values(score.scores);
            var nbr=0;
            var length=0;
  
             for(var i=0; i<values.length; i++){
              nbr+= parseInt(values[i]);
              if(parseInt(values[i])!=0){
                length++;
              }
            }
            if(length==0){
              length=1;
            }
           card.average.push(Math.round(nbr/length));
          });

        });
  })
    .catch(function (error) {
      console.log(error);
    })
    .then(function () {
    });
      return cards;
  }

  lockEstimate(estimateLockJson: any){
    return this.http.post('https://func-ykbb.azurewebsites.net/api/estimate/lock?code=DP4LbC5ad7QLWG35L1lOWxidF8a54/qwKDrDhUw4D19LtfcCUvC6/Q==', estimateLockJson);
  }
  
  getCompass(personId: string): Observable<any[]> {
    return this.http.get<any[]>('https://func-ykbb.azurewebsites.net/api/compass/'+personId+'?code=hMDJFiOF9uAnN/maNMnw5dG8WZvt4zcOt9idQr7FGa4OEZ0XkHrYJQ==');
  }

  getBarnKontakt(personNbr: string): Observable<Contact[]> {
    return this.http.get<Contact[]>('https://func-ykbb.azurewebsites.net/api/barnkontakt/'+personNbr+'?code=QfADHarQDEcNB2wvnwrsrZD2TrdwOf8leVdQsG3sFT/7YraveAu0dA==');
}

  async getUnitsWithoutAnnat(): Promise<Unit[]> {
    var units: Unit[]= [];

    await axios.get('https://func-ykbb.azurewebsites.net/api/unit?code=7od5M5/US4aBc4L61rBOQKHBv3CXO7sWhxxQtZXi43tDknxT2zuIzQ==')
    .then(function (response) {  
    
        response.data.forEach((unit: Unit)=>{  
          if(unit.unitID!='7'){
            units.push(unit);
          }
        })
  })
    .catch(function (error) {
      console.log(error);
    })
    .then(function () {
    });
        return units;
      }

}
function containsQuestion(element: Card, questionID: string) {
  var found= false;

  element.questions.forEach(question => {
    if(question== questionID){
      found= true;
    }      
  });
  return found;
}

function containsCard(cards: Card[], gradedOn: string) {
  var found= false;
  cards.forEach(element => {
    if(element.gradedOn== gradedOn){
      found= true;
    }      
  });
  return found;
}

function containsCardDiscoverCard(cards: ConversationCard[], gradedOn: string) {
  var found= false;
  cards.forEach(element => {
    if(element.gradedOn== gradedOn){
      found= true;
    }      
  });
  return found;
}
function containsEstimateCard(cards: EstimateCard[], gradedOn: string) {
  var found= false;
  cards.forEach(element => {
    if(element.gradedOn== gradedOn){
      found= true;
    }      
  });
  return found;
}

var questionIndex = new Map([
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
