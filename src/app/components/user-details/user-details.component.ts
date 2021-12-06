import { Component, OnInit } from '@angular/core';
import * as fromState from '../../state';
import { Store } from '@ngrx/store';
import * as fromRoot from '../../../app/state';
import { Observable } from 'rxjs';
import { User } from 'src/app/models/User';

@Component({
  selector: 'app-user-details',
  templateUrl: './user-details.component.html',
  styleUrls: ['./user-details.component.scss']
})
export class UserDetailsComponent implements OnInit {
  unitList: string[] = ['Extra cheese', 'Mushroom', 'Onion', 'Pepperoni', 'Sausage', 'Tomato'];
  user$= new Observable<User | null>();
  userID: string;

  constructor(private store: Store<fromState.State>) { }

  ngOnInit(): void {
    this.user$= this.store.select(fromState.getCurrentAdminUser);
    this.user$.subscribe(data=>{
      this.userID= data?.userID ??'';
    });
  }

  moveToEdit(){
    this.store.dispatch(new fromRoot.Go({ path: ['/edit-user', this.userID] }));
  }

}
