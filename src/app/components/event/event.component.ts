import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { Person } from 'src/app/models/Person';
import * as fromRoot from '../../state';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import { GetSetService } from '../../services/get-set/get-set.service';

export interface PeriodicElement {
  title: string;
  date: string;
  description: string;
  responsible: string;
  role:string;
}

@Component({
  selector: 'app-event',
  templateUrl: './event.component.html',
  styleUrls: ['./event.component.scss']
})
export class EventComponent implements OnInit {
    ELEMENT_DATA: PeriodicElement[] = [
    {title: 'work1', date:'12 May 2013', 
    description:'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odio ea necessitatibus quo velit natus cupiditate qui alias possimus ab praesentium nostrum quidem obcaecati nesciunt! Molestiae officiis voluptate excepturi rem veritatis eum aliquam qui laborum non ipsam ullam tempore reprehenderit illum eligendi cumque mollitia temporibus! Natus dicta qui est optio rerum.'
    +'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odio ea necessitatibus quo velit natus cupiditate qui alias possimus ab praesentium nostrum quidem obcaecati nesciunt! Molestiae officiis voluptate excepturi rem veritatis eum aliquam qui laborum non ipsam ullam tempore reprehenderit illum eligendi cumque mollitia temporibus! Natus dicta qui est optio rerum.',
     responsible:'Nina Lundberg', role:'Medarbetare'},
  
    {title: 'work2', date:'12 May 2014',
    description:'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odio ea necessitatibus quo velit natus cupiditate qui alias possimus ab praesentium nostrum quidem obcaecati nesciunt! Molestiae officiis voluptate excepturi rem veritatis eum aliquam qui laborum non ipsam ullam tempore reprehenderit illum eligendi cumque mollitia temporibus! Natus dicta qui est optio rerum.'
    +'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odio ea necessitatibus quo velit natus cupiditate qui alias possimus ab praesentium nostrum quidem obcaecati nesciunt! Molestiae officiis voluptate excepturi rem veritatis eum aliquam qui laborum non ipsam ullam tempore reprehenderit illum eligendi cumque mollitia temporibus! Natus dicta qui est optio rerum.',
     responsible:'Ludviq Almqvist', role:'Medarbetare'},
  
    {title: 'work3', date:'12 May 2015', 
    description:'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odio ea necessitatibus quo velit natus cupiditate qui alias possimus ab praesentium nostrum quidem obcaecati nesciunt! Molestiae officiis voluptate excepturi rem veritatis eum aliquam qui laborum non ipsam ullam tempore reprehenderit illum eligendi cumque mollitia temporibus! Natus dicta qui est optio rerum.'
    +'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odio ea necessitatibus quo velit natus cupiditate qui alias possimus ab praesentium nostrum quidem obcaecati nesciunt! Molestiae officiis voluptate excepturi rem veritatis eum aliquam qui laborum non ipsam ullam tempore reprehenderit illum eligendi cumque mollitia temporibus! Natus dicta qui est optio rerum.',
     responsible:'Lukas Lundberg', role:'Medarbetare'},
  
    {title: 'work4', date:'12 May 2016', 
    description:'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odio ea necessitatibus quo velit natus cupiditate qui alias possimus ab praesentium nostrum quidem obcaecati nesciunt! Molestiae officiis voluptate excepturi rem veritatis eum aliquam qui laborum non ipsam ullam tempore reprehenderit illum eligendi cumque mollitia temporibus! Natus dicta qui est optio rerum.'
    +'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odio ea necessitatibus quo velit natus cupiditate qui alias possimus ab praesentium nostrum quidem obcaecati nesciunt! Molestiae officiis voluptate excepturi rem veritatis eum aliquam qui laborum non ipsam ullam tempore reprehenderit illum eligendi cumque mollitia temporibus! Natus dicta qui est optio rerum.',
     responsible:'Gustav Sundberg', role:'Medarbetare'},
  
    {title: 'work5', date:'12 May 2017', 
    description:'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odio ea necessitatibus quo velit natus cupiditate qui alias possimus ab praesentium nostrum quidem obcaecati nesciunt! Molestiae officiis voluptate excepturi rem veritatis eum aliquam qui laborum non ipsam ullam tempore reprehenderit illum eligendi cumque mollitia temporibus! Natus dicta qui est optio rerum.'
    +'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odio ea necessitatibus quo velit natus cupiditate qui alias possimus ab praesentium nostrum quidem obcaecati nesciunt! Molestiae officiis voluptate excepturi rem veritatis eum aliquam qui laborum non ipsam ullam tempore reprehenderit illum eligendi cumque mollitia temporibus! Natus dicta qui est optio rerum.',
     responsible:'Sandra Per', role:'Medarbetare'}
  ];
  
  current_person$= new Observable<Person | null>();

  constructor(private getSetService: GetSetService,
    private store: Store<fromState.State>) { }

  ngOnInit(): void {
    this.current_person$ = this.store.select(fromState.getCurrentPerson);
    this.current_person$.subscribe(data=>{
    });

  }

}
