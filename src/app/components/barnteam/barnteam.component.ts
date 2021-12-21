import { Component, OnInit } from '@angular/core';
import { Person } from 'src/app/models/Person';
import { Observable } from 'rxjs';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import { Barnteam } from 'src/app/models/Barnteam';
import { AdminService } from 'src/app/services/admin/admin.service';
import { User } from 'src/app/models/User';
import * as fromRoot from '../../../app/state';

@Component({
  selector: 'app-barnteam',
  templateUrl: './barnteam.component.html',
  styleUrls: ['./barnteam.component.scss']
})
export class BarnteamComponent implements OnInit {
  pteams: Promise<Barnteam[]>= new Promise((resolve, reject) => { });
  teams: Barnteam[] = [];


  current_user$: Observable<User| null> = new Observable<User| null>();
  searchteams: Barnteam[]= [];
  filterStatus: boolean= false;

  current_person$= new Observable<Person | null>();
  current_person: Person;
  personID: string;

  constructor(private store: Store<fromState.State>,
    private adminService: AdminService) { }

  ngOnInit(): void {
    this.current_user$ = this.store.select(fromState.getCurrentUser);
    this.current_user$.subscribe(data => {
      let userID: string = data?.userID ?? '';
      this.store.dispatch(new fromState.LoadPersons(userID));
    });

    this.pteams= this.adminService.getBarnteams();
    let teams= this.teams;

    this.pteams.then(function (response) {
      
      response.forEach((team: Barnteam)=>{
        teams.push(team);
    });
    });
    teams.forEach(element=>{
      this.teams.push(element);
    });
  }

  applyFilter(event: Event) {
    this.searchteams=[];
    
    const filterValue = (event.target as HTMLInputElement).value.toLowerCase();
    if(filterValue!=''){
      this.filterStatus= true;
    }
    this.teams.forEach(team=>{
      if(team.teamName.toLowerCase().includes(filterValue) || team.createdOn.includes(filterValue)){
        this.searchteams.push(team);
      }
   });
  }

  setCurrentAdminTeam(team: Barnteam){
    this.store.dispatch(new fromState.UpdateTeams(this.teams));

    this.store.dispatch(new fromState.UpdateAdminBarnteam(team));
    this.store.dispatch(new fromRoot.Go({ path: ['/barnteam', team.teamID] }));

  }
}
