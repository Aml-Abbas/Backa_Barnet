import { Component, OnInit } from '@angular/core';
import { BreakpointObserver } from '@angular/cdk/layout';
import { ViewChild } from '@angular/core'
import {MatSidenav} from '@angular/material/sidenav';

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
 event = false;

  constructor(private observer: BreakpointObserver) {}

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
showFillerEventIcon = 'chevron_right'; 
showFillerDeepCompassIcon = 'chevron_right'; 
showFillerCompassIcon = 'chevron_right'; 

public changeShowFillerContact(){
  this.showFillerContact = !this.showFillerContact;

  if(this.showFillerContactIcon == 'chevron_right'){
    this.showFillerContactIcon = 'expand_more' ;
  }else{
    this.showFillerContactIcon = 'chevron_right' ;
  }
}

public changeShowFillerEvent(){
  this.event = !this.event;

  if(this.showFillerEventIcon == 'chevron_right'){
    this.showFillerEventIcon = 'expand_more' ;
  }else{
    this.showFillerEventIcon = 'chevron_right' ;
  }
}

public changeShowFillerDeepCompass(){
  this.deep_need_compass = !this.deep_need_compass;

  if(this.showFillerDeepCompassIcon == 'chevron_right'){
    this.showFillerDeepCompassIcon = 'expand_more' ;
  }else{
    this.showFillerDeepCompassIcon = 'chevron_right' ;
  }
}

public changeShowFillerNeedCompass(){
  this.need_compass = !this.need_compass;

  if(this.showFillerCompassIcon == 'chevron_right'){
    this.showFillerCompassIcon = 'expand_more' ;
  }else{
    this.showFillerCompassIcon = 'chevron_right' ;
  }
}

  ngOnInit(): void {
  }
}
