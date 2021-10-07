import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AdminComponent } from './components/admin/admin.component';
import { AssessmentComponent } from './components/assessment/assessment.component';
import { CommunicationMaterialComponent } from './components/communication-material/communication-material.component';
import { ConsentComponent } from './components/consent/consent.component';
import { ContactGuardianComponent } from './components/contact-guardian/contact-guardian.component';
import { ContactPersonComponent } from './components/contact-person/contact-person.component';
import { ContactComponent } from './components/contact/contact.component';
import { ConversationMaterialComponent } from './components/conversation-material/conversation-material.component';
import { CreateDiscoverCardComponent } from './components/create-discover-card/create-discover-card.component';
import { CreateEventComponent } from './components/create-event/create-event.component';
import { CreatePlanComponent } from './components/create-plan/create-plan.component';
import { DeepNeedCompassComponent } from './components/deep-need-compass/deep-need-compass.component';
import { DiscoverCardDetailsComponent } from './components/discover-card-details/discover-card-details.component';
import { DiscoverCardComponent } from './components/discover-card/discover-card.component';
import { EditContactGuardianComponent } from './components/edit-contact-guardian/edit-contact-guardian.component';
import { EditContactPersonComponent } from './components/edit-contact-person/edit-contact-person.component';
import { EstimateComponent } from './components/estimate/estimate.component';
import { EventComponent } from './components/event/event.component';
import { GoalComponent } from './components/goal/goal.component';
import { LandingComponent } from './components/landing/landing.component';
import { NeedCompassComponent } from './components/need-compass/need-compass.component';
import { PlanComponent } from './components/plan/plan.component';
import { SignInComponent } from './components/sign-in/sign-in.component';
import { AuthGuard } from './guards/auth.guard';
import { SignInGuard } from './guards/sign-in.guard';


const routes: Routes = [
  {
    path: '',
    component: LandingComponent, canActivate: [AuthGuard],
    children:[
      {
        path: 'admin',
        component: AdminComponent, canActivate: [AuthGuard]
      },
      {
        path: 'communication-material',
        component: CommunicationMaterialComponent, canActivate: [AuthGuard]
      },  
      {
        path: 'contact',
        component: ContactComponent, canActivate: [AuthGuard]
      },
      {
        path: 'estimate',
        component: EstimateComponent, canActivate: [AuthGuard]
      },
      {
        path: 'event',
        component: EventComponent, canActivate: [AuthGuard]
      },
      {
        path: 'goal',
        component: GoalComponent, canActivate: [AuthGuard]
      },
      {
        path: 'discover-card',
        component: DiscoverCardComponent, canActivate: [AuthGuard]
      },
      {
        path: 'discover-card/:discoverCardId',
        component: DiscoverCardDetailsComponent, canActivate: [AuthGuard]
      },
      {
        path: 'need-compass',
        component: NeedCompassComponent, canActivate: [AuthGuard]
      },
      {
        path: 'consent',
        component: ConsentComponent, canActivate: [AuthGuard]
      },
      {
        path: 'create-discover-card',
        component: CreateDiscoverCardComponent, canActivate: [AuthGuard]
      },
      {
        path: 'deep-need-compass',
        component: DeepNeedCompassComponent, canActivate: [AuthGuard]
      },
      {
        path: 'plan',
        component: PlanComponent, canActivate: [AuthGuard]
      },
      {
        path: 'assessment',
        component: AssessmentComponent, canActivate: [AuthGuard]
      },
      {
        path: 'conversation-material',
        component: ConversationMaterialComponent, canActivate: [AuthGuard]
      },
      {
        path: 'contact-person',
        component: ContactPersonComponent, canActivate: [AuthGuard]
      },
      {
        path: 'edit-contact-person',
        component: EditContactPersonComponent, canActivate: [AuthGuard]
      },
      {
        path: 'contact-guardian',
        component: ContactGuardianComponent, canActivate: [AuthGuard]
      },
      {
        path: 'edit-contact-guardian',
        component: EditContactGuardianComponent, canActivate: [AuthGuard]
      },
      {
        path: 'create-event',
        component: CreateEventComponent, canActivate: [AuthGuard]
      },
      {
        path: 'create-plan',
        component: CreatePlanComponent, canActivate: [AuthGuard]
      }
    ]
  },
  { 
    path: 'sign-in',
  component: SignInComponent, canActivate: [SignInGuard]
}

];
@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
