import { Component, OnInit } from '@angular/core';
import { Person } from 'src/app/models/Person';
import { Observable } from 'rxjs';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import { User } from 'src/app/models/User';
import { Unit } from 'src/app/models/Unit';
import { GetSetService } from '../../services/get-set/get-set.service';
import { ComponentCanDeactivate } from 'src/app/interfaces/component-can-deactivate';


@Component({
  selector: 'app-contact-person',
  templateUrl: './contact-person.component.html',
  styleUrls: ['./contact-person.component.scss']
})
export class ContactPersonComponent implements OnInit, ComponentCanDeactivate {
  canDeactivate(): boolean {
    return !this.isDirty;
  }

  isDirty = false;

  current_person$= new Observable<Person | null>();
  current_user$: Observable<User | null> = new Observable<User | null>();
  userRoleId: string='';

  status$: Observable<Unit[]> = new Observable<Unit[]>();
  statusNbr: number = -1;
  statusString = '-1';

  constructor(private store: Store<fromState.State>,
    private getSetService: GetSetService) { }

  ngOnInit(): void {
    this.status$ = this.getSetService.getUnits();

    this.current_user$ = this.store.select(fromState.getCurrentUser);
    this.current_user$.subscribe(data => {
      this.userRoleId = data?.roleID ?? '';
    });

    this.current_person$ = this.store.select(fromState.getCurrentPerson);
  }

  changeStatus(statusId: string, statusName: string) {
    this.isDirty= true;

    this.statusString = statusId;
    this.statusNbr = parseInt(statusName);
  }

  save(){

  }

}
