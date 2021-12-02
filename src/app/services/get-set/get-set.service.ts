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


@Injectable({
  providedIn: 'root'
})
export class GetSetService {

  constructor(private http: HttpClient) { }

  getPersons(userId: string): Observable<Person[]> {
    return this.http.get<Person[]>('https://func-ykbb.azurewebsites.net/api/person/'+userId+'?code=SkXpI51pgjWl6UVNjxKjKNUr3o2gmPdlOZ4EFMFwn0LR0KlyDlYu3w==');
  }
  getContacts(personNbr: string): Observable<Contact[]> {
    return this.http.get<Contact[]>('https://func-ykbb.azurewebsites.net/api/contact/' + personNbr + '?code=tc2OJy49azMOIqZUVev09yLarIt8kQfg7gr6GGs3uG3daqLORwHPhg==');
  }

  async getCards(userId: string): Promise<Card[]> {
    var cards: Card[]= [];

  await axios.get('https://func-ykbb.azurewebsites.net/api/card/'+userId+'?code=bbdIBAbikn/AMydOBvxm69FyKFhRfS4fxUb55SaSz0TfK/cjnxiYEw==')
  .then(function (response) {
    var questions: string []= [];
    var grades: string[]= [];
    var comments: string[]= [];

    console.log(response);
      var index=1;
      response.data.forEach((discoverCard: DiscoverCard)=>{
        let gradedOn= discoverCard.gradedOn;

        let userName= discoverCard.userName;
        let userOrg= discoverCard.userOrg;
        let userTitle= discoverCard.userTitle;

        let personName='Dolt';
        if(discoverCard.personName !=" "){
          personName= discoverCard.personName;
        }
        let personNbr='Dolt';
        if(discoverCard.personNbr!=""){
          personNbr= discoverCard.personNbr;
        }
        let guardian1='Dolt';
        if(discoverCard.guardian1 !=''){
          guardian1= discoverCard.guardian1;
        }
        let guardianPersonNbr1='Dolt';
        if(discoverCard.guardianPersonNbr1 !=''){
          guardianPersonNbr1= discoverCard.guardianPersonNbr1;
        }
        let guardian2='Dolt';
        if(discoverCard.guardian2 !=''){
          guardian2= discoverCard.guardian2;
        }
        let guardianPersonNbr2='Dolt';
        if(discoverCard.guardianPersonNbr2 !=''){
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
    
      console.log(response);
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
    console.log(info);
    return this.http.post('https://func-ykbb.azurewebsites.net/api/status/edit?code=t0hLgeixqD5hP4bpYzoizDzuklX38U5/28BRLy1C5LJo4S5hzC3kyQ==', info);
  }

  createEstimate(estimateJson: any) {
    return this.http.post('https://func-ykbb.azurewebsites.net/api/estimate/create?code=ZnNUlhrtXVvn3xAtzMbpBpqMxO5EvvAxkxnYqVa9jaIPixAqZ66BuQ==', estimateJson);
  }

  getEstimate(personId: string): Observable<Estimate[]> {
    return this.http.get<Estimate[]>('https://func-ykbb.azurewebsites.net/api/estimate/'+personId+'?code=claTs5kzCfU60tGySXhvQbz3c01kADTGq2QT3nGWPfslBL7tbARORg==');
  }

  lockEstimate(estimateLockJson: any){
    return this.http.post('https://func-ykbb.azurewebsites.net/api/estimate/lock?code=DP4LbC5ad7QLWG35L1lOWxidF8a54/qwKDrDhUw4D19LtfcCUvC6/Q==', estimateLockJson);
  }
  
  getCompass(personId: string): Observable<any[]> {
    return this.http.get<any[]>('https://func-ykbb.azurewebsites.net/api/compass/'+personId+'?code=hMDJFiOF9uAnN/maNMnw5dG8WZvt4zcOt9idQr7FGa4OEZ0XkHrYJQ==');
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
