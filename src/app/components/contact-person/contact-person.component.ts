import { Component, OnInit } from '@angular/core';
import { Person } from 'src/app/models/Person';
import { Observable } from 'rxjs';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import { User } from 'src/app/models/User';
import { Status } from 'src/app/models/Status';
import { GetSetService } from '../../services/get-set/get-set.service';
import { ComponentCanDeactivate } from 'src/app/interfaces/component-can-deactivate';
import * as fromRoot from '../../../app/state';


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
  current_person: Person;

  current_user$: Observable<User | null> = new Observable<User | null>();
  userRoleId: string='';

  status$: Observable<Status[]> = new Observable<Status[]>();
  statusNbr: number = -1;
  statusString = '-1';

  constructor(private store: Store<fromState.State>,
    private getSetService: GetSetService) { }

  ngOnInit(): void {
    this.current_user$ = this.store.select(fromState.getCurrentUser);
    this.current_user$.subscribe(data => {
      this.userRoleId = data?.roleID ?? '';
    });

    this.current_person$ = this.store.select(fromState.getCurrentPerson);
    this.current_person$.subscribe(data => {
      let personNbr:string= data?.personNbr ?? '';
      let lastName: string= data?.lastName ?? '';
      let firstName: string= data?.firstName ?? '';
      let name: string= data?.name ?? '';
  
      let guardian1: string= data?.guardian1 ?? '';
      let guardianPersonNbr1: string= data?.guardianPersonNbr1 ?? '';
      let guardian2: string= data?.guardian2 ?? '';
      let guardianPersonNbr2: string= data?.guardianPersonNbr2 ?? '';
  
      let changedBy: string= data?.changedBy ?? '';
      let changedOn: string= data?.changedOn ?? '';
      let status: string= data?.status ?? '';
      let personID: string= data?.personID ?? '';

      this.current_person= new Person(personNbr, lastName, firstName, name, guardian1, guardianPersonNbr1,
                                      guardian2, guardianPersonNbr2, changedBy, changedOn, status, personID);
                                      
      this.statusString= data?.status ?? '';
    });

    this.status$ = this.getSetService.getStatus(this.current_person.personID);
  }

  changeStatus(statusId: string, statusName: string) {
    this.isDirty= true;
    this.current_person.status= statusName;
    this.statusString = statusName;
    this.statusNbr = parseInt(statusId);
  }

  setPersonStatus(){
    this.isDirty= false;
    var info = {
      PersonID : this.current_person.personID,
      StatusID : this.statusNbr
    };
     this.store.dispatch(new fromRoot.UpdatePerson(this.current_person));
     this.store.dispatch(new fromRoot.UpdateStatus(info));
  }

}
