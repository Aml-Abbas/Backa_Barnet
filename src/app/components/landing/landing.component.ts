import { Component, OnInit} from '@angular/core';
import { BreakpointObserver } from '@angular/cdk/layout';
import { ViewChild } from '@angular/core'
import { MatSidenav} from '@angular/material/sidenav';
import { Observable } from 'rxjs';
import { Person } from 'src/app/models/Person';
import { User } from 'src/app/models/User';
import * as fromState from '../../state';
import { Store } from '@ngrx/store';
import * as fromRoot from '../../../app/state';

@Component({
  selector: 'app-landing',
  templateUrl: './landing.component.html',
  styleUrls: ['./landing.component.scss']
})
export class LandingComponent implements OnInit {
  @ViewChild(MatSidenav)
 sidenav!: MatSidenav;
 
 showFillerContact = false;
 need_compass = false;
 deep_need_compass = false;
 current_person$= new Observable<Person | null>();
 current_user$= new Observable<User | null>();
 userRoleId: number;

 isDisabledEstimate=true;
 isDisabledAdmin= true;
 isDisabledConversationMaterial= true;
 isDisabledNeedCompass= true;
 isDisabledConsent= true;
 isDisabledEvent= true;
 isDisabledGoal= true;

 constructor(private observer: BreakpointObserver,
    private store: Store<fromState.State>) {
    }

  ngAfterViewInit() {
    this.observer.observe(['(max-width: 800px)']).subscribe((res) => {
      if (res.matches) {
        this.sidenav.mode = 'over';
        this.sidenav.close();
      } else {
        this.sidenav.mode = 'side';
        this.sidenav.open();
      }
    });
  }

showFillerContactIcon = 'chevron_right'; 
showFillerDeepCompassIcon = 'chevron_right'; 
showFillerCompassIcon = 'chevron_right'; 

public changeShowFillerContact(){
  this.need_compass = false;
  this.deep_need_compass = false;
 
  this.showFillerContact = !this.showFillerContact;

  this.showFillerDeepCompassIcon = 'chevron_right'; 
  this.showFillerCompassIcon = 'chevron_right'; 

  if(this.showFillerContactIcon == 'chevron_right'){
    this.showFillerContactIcon = 'expand_more' ;
  }else{
    this.showFillerContactIcon = 'chevron_right' ;
  }
}


public changeShowFillerDeepCompass(){
  this.showFillerContact = false;
  this.need_compass = false;

  this.deep_need_compass = !this.deep_need_compass;

  this.showFillerContactIcon = 'chevron_right'; 
  this.showFillerCompassIcon = 'chevron_right'; 

  if(this.showFillerDeepCompassIcon == 'chevron_right'){
    this.showFillerDeepCompassIcon = 'expand_more' ;
  }else{
    this.showFillerDeepCompassIcon = 'chevron_right' ;
  }
}

public changeShowFillerNeedCompass(){
  this.showFillerContact = false;
  this.deep_need_compass = false;

  this.need_compass = !this.need_compass;

  this.showFillerContactIcon = 'chevron_right'; 
  this.showFillerDeepCompassIcon = 'chevron_right'; 

  if(this.showFillerCompassIcon == 'chevron_right'){
    this.showFillerCompassIcon = 'expand_more' ;
  }else{
    this.showFillerCompassIcon = 'chevron_right' ;
  }
}

changeShowFiller(){
  this.showFillerContact = false;
  this.deep_need_compass = false;
  this.need_compass = false;
  this.showFillerContactIcon = 'chevron_right'; 
  this.showFillerDeepCompassIcon = 'chevron_right'; 
  this.showFillerCompassIcon = 'chevron_right' ;

}

  ngOnInit(): void {
    this.current_person$ = this.store.select(fromState.getCurrentPerson);
    this.current_user$ = this.store.select(fromState.getCurrentUser);
    this.current_user$.subscribe(data=>{
      this.userRoleId= parseInt(String(data?.roleID));
    })


    if(this.userRoleId==4 || this.userRoleId==2){
      this.isDisabledConversationMaterial= false;
      this.isDisabledEvent= false;
    }
    if(this.userRoleId==4|| this.userRoleId==2|| this.userRoleId==3){
      this.isDisabledEstimate= false;
      this.isDisabledNeedCompass= false;
      this.isDisabledConsent= false;
      this.isDisabledGoal= false;
    }

    if(this.userRoleId==4){
      this.isDisabledAdmin= false;
    }
  }

  delete_current_person(): void{
    this.store.dispatch(new fromState.UpdatePerson(null));
  }

  goToRoute(event, route: string){
    if(route== 'admin' && this.isDisabledAdmin){
        event.stopPropagation()
    }else if(route== 'conversation-material' && this.isDisabledConversationMaterial){
        event.stopPropagation()
    }else if(route== 'need-compass' && this.isDisabledNeedCompass){
        event.stopPropagation()
    }else if(route== 'estimate' && this.isDisabledEstimate){
        event.stopPropagation()
    }else if(route== 'consent' && this.isDisabledConsent){
        event.stopPropagation()
    }else if(route== 'event' && this.isDisabledEvent){
        event.stopPropagation()
    }else if(route== 'goal' && this.isDisabledGoal){
        event.stopPropagation()
    }else{
      this.store.dispatch(new fromRoot.Go({ path: ['/'+route] }));
    }
  }

  logOut(){
    this.store.dispatch(new fromState.Logout());
  }
}
