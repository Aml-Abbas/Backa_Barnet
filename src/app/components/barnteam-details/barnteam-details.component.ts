import { Component, OnInit } from '@angular/core';
import { Card } from 'src/app/models/Card';
import { Observable } from 'rxjs';
import * as fromState from '../../state';
import { Store } from '@ngrx/store';
import * as fromRoot from '../../../app/state';
import { Barnteam } from 'src/app/models/Barnteam';

@Component({
  selector: 'app-barnteam-details',
  templateUrl: './barnteam-details.component.html',
  styleUrls: ['./barnteam-details.component.scss']
})
export class BarnteamDetailsComponent implements OnInit {
  unitList: string[] = ['Extra cheese', 'Mushroom', 'Onion', 'Pepperoni', 'Sausage', 'Tomato'];
  medlemList: string[] = ['Extra cheese', 'Mushroom', 'Onion', 'Pepperoni', 'Sausage', 'Tomato'];
  barnteam$= new Observable<Barnteam | null>();
  barnteamID: string;

  constructor(private store: Store<fromState.State>) { }

  ngOnInit(): void {
    this.barnteam$= this.store.select(fromState.getCurrentAdminBarnteam);
    this.barnteam$.subscribe(data=>{
      this.barnteamID= data?.teamID ??'';
    });

  }

  delete(){
    var user = {
      TeamID:  0,
    } 
    this.store.dispatch(new fromState.RemoveBarnteam(user));
  }
}
