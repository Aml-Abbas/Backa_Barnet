import { Component, OnInit } from '@angular/core';
import { Card } from 'src/app/models/Card';
import { Observable } from 'rxjs';
import * as fromState from '../../state';
import { Store } from '@ngrx/store';
import * as fromRoot from '../../../app/state';
import { Barnteam } from 'src/app/models/Barnteam';
import { AdminService } from '../../services/admin/admin.service';

@Component({
  selector: 'app-barnteam-details',
  templateUrl: './barnteam-details.component.html',
  styleUrls: ['./barnteam-details.component.scss']
})
export class BarnteamDetailsComponent implements OnInit {
  memberList$= new Observable<any[]| null>();
  team$= new Observable<Barnteam | null>();
  barnteamID: string;

  constructor(private store: Store<fromState.State>,
    private adminService: AdminService) { }

  ngOnInit(): void {
    this.team$= this.store.select(fromState.getCurrentAdminBarnteam);
    this.team$.subscribe(data=>{
      this.barnteamID= data?.teamID ??'';
      this.memberList$= this.adminService.getUnitUsers(this.barnteamID);
    });

  }

  delete(){
    var user = {
      TeamID:  this.barnteamID,
    } 
    this.store.dispatch(new fromState.RemoveBarnteam(user));
  }
}
