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

public showFillerContactIcon = 'chevron_right'; 

public changeShowFillerContact(){
  this.showFillerContact = !this.showFillerContact;

  if(this.showFillerContactIcon == 'chevron_right'){
    this.showFillerContactIcon = 'expand_more' ;
  }else{
    this.showFillerContactIcon = 'chevron_right' ;
  }
}

  ngOnInit(): void {
  }

}
