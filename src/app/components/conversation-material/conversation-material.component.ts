import { Component, OnInit } from '@angular/core';
import {MatTableDataSource} from '@angular/material/table';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import * as fromRoot from '../../../app/state';

@Component({
  selector: 'app-conversation-material',
  templateUrl: './conversation-material.component.html',
  styleUrls: ['./conversation-material.component.scss']
})
export class ConversationMaterialComponent implements OnInit {
  //persons$: Observable<Person[]> = new Observable<Person[]>();
  private cards:any[]= [
    {id:'1', date:'2011-08-19', by:'Barnet'},
    {id:'2', date:'2021-08-19', by:'Vårdnadshavare 1'},
    {id:'3', date:'2009-08-19', by:'Vårdnadshavare 1'},

  ];
  displayedColumns: string[] = ['id', 'date','by'];
  dataSource = new MatTableDataSource(this.cards);

  constructor(private store: Store<fromState.State>) {}

  ngOnInit(): void {}

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }

  setCurrentPerson(id: string) {
    this.store.dispatch(new fromRoot.Go({ path: ['/conversation-material', id] }));
  }

}