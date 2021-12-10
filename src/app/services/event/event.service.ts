import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { Event } from 'src/app/models/Event';

@Injectable({
  providedIn: 'root'
})
export class EventService {

  constructor(private http: HttpClient) { }

  createEvent(eventJson: any) {
    return this.http.post('https://func-ykbb.azurewebsites.net/api/event/create?code=zH/btVHzaGqpESkmr3SCic2B4CBLIvGRTXaJu7z/vVsYDb1t1Mw61Q==', eventJson);
  }

  createAction(actionJson: any) {
    return this.http.post('https://func-ykbb.azurewebsites.net/api/action/create?code=/X7EgM0p15bhLjN7N6zMYERR4aWR9dOHBVBr7wT6HaZv3dsDVsJ6DQ==', actionJson);
  }

  editAction(actionIdJson: any) {
      return this.http.post('https://func-ykbb.azurewebsites.net/api/action/edit?code=2Td4p/VoekRtnBV5wXMDu8NnZOaXIrBWXPat1f7S6vOpORkGT7HRag==', actionIdJson);
    }

   getEvent(personId: string): Observable<Event[]> {
    return this.http.get<Event[]>('https://func-ykbb.azurewebsites.net/api/event/'+personId+'?code=4BSzbYC1YIm9Qxgocsd1A/Z9dwyuHw1SiGNRVEhIFD3LxbaoLAKV1g==');
  }
  
}
