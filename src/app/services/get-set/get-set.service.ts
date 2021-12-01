import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Contact } from 'src/app/models/Contact';
import { DiscoverCard } from 'src/app/models/DiscoverCard';
import { Unit } from 'src/app/models/Unit';
import { Person } from 'src/app/models/Person';
import { ConversationMaterial } from 'src/app/models/ConversationMaterial';
import { Status } from 'src/app/models/Status';
import { Estimate } from 'src/app/models/Estimate';


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

  getCards(userId: string): Observable<DiscoverCard[]> {
    return this.http.get<DiscoverCard[]>('https://func-ykbb.azurewebsites.net/api/card/'+userId+'?code=bbdIBAbikn/AMydOBvxm69FyKFhRfS4fxUb55SaSz0TfK/cjnxiYEw==');
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

   getConversationMaterial(personId: string): Observable<ConversationMaterial[]> {
    return this.http.get<ConversationMaterial[]>('https://func-ykbb.azurewebsites.net/api/substrate/'+personId +'?code=ggX3h9u8RzHKyqnuNwDAdMdAMV6pceMAHuwRcHEt1UHw14gh1KFI5Q==');
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