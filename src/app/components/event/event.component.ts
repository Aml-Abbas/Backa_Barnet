import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { Person } from 'src/app/models/Person';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import { GetSetService } from '../../services/get-set/get-set.service';
import { Event } from 'src/app/models/Event';
import { EventService } from 'src/app/services/event/event.service';
import { Actions, ofType } from '@ngrx/effects';
import * as eventAction from '../../state/actions/event.action';
import { tap } from 'rxjs/operators';
import { User } from 'src/app/models/User';
import { Action } from 'src/app/models/Action';
import * as fromRoot from '../../../app/state';
import { DialogComponent } from '../../components/dialog/dialog.component';
import { MatDialog } from '@angular/material/dialog';


@Component({
  selector: 'app-event',
  templateUrl: './event.component.html',
  styleUrls: ['./event.component.scss']
})
export class EventComponent implements OnInit {


  current_person$ = new Observable<Person | null>();
  events$: Observable<Event[]> = new Observable<Event[]>();
  personID: string;
  current_user$: Observable<User | null> = new Observable<User | null>();

  pActions: Promise<Action[]> = new Promise((resolve, reject) => { });
  actions: Action[] = [];

  constructor(private getSetService: GetSetService,
    private store: Store<fromState.State>,
    private eventService: EventService,
    private actions$: Actions,
    public dialog: MatDialog) { }

  ngOnInit(): void {
    this.current_person$ = this.store.select(fromState.getCurrentPerson);
    this.current_person$.subscribe(data => {
      this.personID = data?.personID ?? '';
    });

    this.current_user$ = this.store.select(fromState.getCurrentUser);
    this.current_user$.subscribe(data => {
      let userID: string = data?.userID ?? '';
      this.pActions = this.eventService.getAllEvents(this.personID, userID);
    });

    let actions = this.actions;

    this.pActions.then(function (response) {
      response.forEach((action: Action) => {
        actions.push(action);
      });
    });

    actions.forEach(element => {
      this.actions.push(element);
    });

    // listen to UPDATE_EVENT_SUCCESS action to refresh the page to show the changes
    this.actions$.pipe(
      ofType(eventAction.UPDATE_EVENT_SUCCESS),
      tap(() => {
        window.location.reload()
      })
    ).subscribe();

  }

  endAction(action: Action) {
    // show a confirmation window before ending the event
    const dialogRef = this.dialog.open(DialogComponent, {
      data: {
        title: 'Avsluta insats',
        text: 'Är du säker på att du vill avsluta insatsen?',
      }
    });

    // after the confirmtion call the updateEvent action to end the event
    dialogRef.afterClosed().subscribe(result => {
      if (result) {
        var actionID = {
          ActionID: parseInt(action.id) ?? 0,
        }
        this.store.dispatch(new fromState.UpdateEvent(actionID));
      }
    });
  }

  // this function is called when clicking on an event on the timeline 
  // send the user to the event details page to check the details of the evenet
  moveTo(action: Action) {
    if (action.title == 'Skattning') {
      this.store.dispatch(new fromRoot.Go({ path: ['/need-compass'], query: ['2', action.date] }));
    } else if (action.title == 'Samtalsunderlag') {
      this.store.dispatch(new fromRoot.Go({ path: ['/conversation-material', action.date] }));
    } else if (action.title == 'Upptäckarkort') {
      this.store.dispatch(new fromRoot.Go({ path: ['/discover-card', action.date] }));
    }
  }

}
