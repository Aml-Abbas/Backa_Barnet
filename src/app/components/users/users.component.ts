import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import { User } from 'src/app/models/User';
import { GetSetService } from 'src/app/services/get-set/get-set.service';

@Component({
  selector: 'app-users',
  templateUrl: './users.component.html',
  styleUrls: ['./users.component.scss']
})
export class UsersComponent implements OnInit {
  users$: Observable<User[]> = new Observable<User[]>();
  users: User[] = [];

  searchUsers: User[]= [];
  filterStatus: boolean= false;

  constructor(private store: Store<fromState.State>,
    private getSetService: GetSetService) { }

  ngOnInit(): void {
    this.users$ = this.getSetService.getUsers();
    this.users$.subscribe(data => {
      data.map((user: User)=>{
        this.users.push(user);
      });
    });
  }

  applyFilter(event: Event) {
    this.searchUsers=[];
    
    const filterValue = (event.target as HTMLInputElement).value.toLowerCase();
    if(filterValue!=''){
      this.filterStatus= true;
    }
    this.users.forEach(user=>{
      var name= (user.firstName+' '+ user.lastName).toLowerCase();
      if(user.email.toLowerCase().includes(filterValue) || name.includes(filterValue)|| user.description.toLocaleLowerCase().includes(filterValue)){
        this.searchUsers.push(user);
      }
   });
  }
}
