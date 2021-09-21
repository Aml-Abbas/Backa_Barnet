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
import { EventComponent } from './components/event/event.component';
import { AdminComponent } from './components/admin/admin.component';
import { SignInComponent } from './components/sign-in/sign-in.component';
import { ConsentComponent } from './components/consent/consent.component';
import { CreateDiscoverCardComponent } from './components/create-discover-card/create-discover-card.component';
import { DeepNeedCompassComponent } from './components/deep-need-compass/deep-need-compass.component';
import { PlanComponent } from './components/plan/plan.component';
import { AssessmentComponent } from './components/assessment/assessment.component';
import { ConversationMaterialComponent } from './components/conversation-material/conversation-material.component';
import { ContactPersonComponent } from './components/contact-person/contact-person.component';
import { ContactGuardianComponent } from './components/contact-guardian/contact-guardian.component';

import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatButtonModule } from '@angular/material/button';
import {MatTableModule} from '@angular/material/table';
import {MatCardModule} from '@angular/material/card';
import {MatCheckboxModule} from '@angular/material/checkbox';
import {MatGridListModule} from '@angular/material/grid-list';
import {MatDatepickerModule} from '@angular/material/datepicker'; 
import {MatNativeDateModule} from '@angular/material/core';
import {MatRadioModule} from '@angular/material/radio';
import {MatMenuModule} from '@angular/material/menu';
import {MatTabsModule} from '@angular/material/tabs';
import {MatButtonToggleModule} from '@angular/material/button-toggle';
import {MatStepperModule} from '@angular/material/stepper';
import { CreateEventComponent } from './components/create-event/create-event.component';
import { CreatePlanComponent } from './components/create-plan/create-plan.component';
import { FormsModule } from '@angular/forms';
import { ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { SignInServiceService } from './services/sign-in-service/sign-in-service.service';



@NgModule({
  declarations: [AppComponent, LandingComponent, ContactComponent, DiscoverCardComponent, 
    CommunicationMaterialComponent, EstimateComponent, GoalComponent, NeedCompassComponent, 
    EventComponent, AdminComponent, SignInComponent, ConsentComponent, CreateDiscoverCardComponent, 
    DeepNeedCompassComponent, PlanComponent, AssessmentComponent, ConversationMaterialComponent, 
    ContactPersonComponent, ContactGuardianComponent, CreateEventComponent, CreatePlanComponent],
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
    MatButtonModule,
    MatTableModule,
    MatCardModule,
    MatCheckboxModule,
    MatGridListModule,
    MatDatepickerModule,
    MatNativeDateModule,
    MatRadioModule,
    MatMenuModule,
    MatTabsModule,
    MatButtonToggleModule,
    MatStepperModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule
    
  ],exports:[
    MatInputModule,
    MatFormFieldModule,
    MatButtonModule,
    MatTableModule,
    MatCardModule,
    MatCheckboxModule,
    MatGridListModule,
    MatDatepickerModule,
    MatNativeDateModule,
    MatRadioModule,
    MatMenuModule,
    MatTabsModule,
    MatButtonToggleModule,
    MatStepperModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule
  ],
  providers: [SignInServiceService],
  bootstrap: [AppComponent],
})
export class AppModule {}
