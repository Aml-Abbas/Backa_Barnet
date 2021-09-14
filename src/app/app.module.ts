import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

import { MatToolbarModule } from '@angular/material/toolbar';
import {MatSidenavModule} from '@angular/material/sidenav';
import { MatIconModule } from '@angular/material/icon';
import { MatDividerModule } from '@angular/material/divider';
import { LandingComponent } from './components/landing/landing.component';
import { ContactComponent } from './components/contact/contact.component';
import { DiscoverCardComponent } from './components/discover-card/discover-card.component';
import { CommunicationMaterialComponent } from './components/communication-material/communication-material.component';
import { EstimateComponent } from './components/estimate/estimate.component';
import { GoalComponent } from './components/goal/goal.component';
import { NeedCompassComponent } from './components/need-compass/need-compass.component';
import { EventAndPlanComponent } from './components/event-and-plan/event-and-plan.component';
import { AdminComponent } from './components/admin/admin.component';

import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';
import { SignInComponent } from './components/sign-in/sign-in.component';

import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatButtonModule } from '@angular/material/button';


@NgModule({
  declarations: [AppComponent, LandingComponent, ContactComponent, DiscoverCardComponent, 
    CommunicationMaterialComponent, EstimateComponent, GoalComponent, NeedCompassComponent, 
    EventAndPlanComponent, AdminComponent, SignInComponent],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MatToolbarModule,
    MatSidenavModule,
    MatButtonModule,
    MatIconModule,
    MatDividerModule,
    FontAwesomeModule,
    MatInputModule,
    MatFormFieldModule,
    MatButtonModule
  ],exports:[
    MatInputModule,
    MatFormFieldModule,
    MatButtonModule
  ],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule {}
