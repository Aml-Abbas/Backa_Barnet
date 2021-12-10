import { Component, OnInit } from '@angular/core';
import * as fromState from '../../state';
import { Store } from '@ngrx/store';
import * as fromRoot from '../../../app/state';
import { Observable } from 'rxjs';
import { User } from 'src/app/models/User';
import { Unit } from 'src/app/models/Unit';
import { GetSetService } from 'src/app/services/get-set/get-set.service';

@Component({
  selector: 'app-user-details',
  templateUrl: './user-details.component.html',
  styleUrls: ['./user-details.component.scss']
})
export class UserDetailsComponent implements OnInit {
  //unitList: string[] = ['Extra cheese', 'Mushroom', 'Onion', 'Pepperoni', 'Sausage', 'Tomato'];
  units$: Observable<Unit[]> = new Observable<Unit[]>();
  user$= new Observable<User | null>();
  userID: string;
  unitName: string;

  constructor(private store: Store<fromState.State>,
    private getSetService: GetSetService) { }

  ngOnInit(): void {
    this.units$ = this.getSetService.getUnits();

    this.user$= this.store.select(fromState.getCurrentAdminUser);
    this.user$.subscribe(data=>{
      this.userID= data?.userID ??'';
      this.units$.subscribe(units=>{
        units.map((unit:Unit)=>{
          if(unit?.unitID==data?.unitID){
            this.unitName= unit?.unitName;
          }
        });
      });
  
    });
  }

  moveToEdit(){
    this.store.dispatch(new fromRoot.Go({ path: ['/edit-user', this.userID] }));
  }

}
