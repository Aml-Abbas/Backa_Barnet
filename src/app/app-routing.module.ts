import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AdminComponent } from './components/admin/admin.component';
import { AssessmentComponent } from './components/assessment/assessment.component';
import { CommunicationMaterialComponent } from './components/communication-material/communication-material.component';
import { ConsentComponent } from './components/consent/consent.component';
import { ContactGuardianComponent } from './components/contact-guardian/contact-guardian.component';
import { ContactPersonComponent } from './components/contact-person/contact-person.component';
import { ContactComponent } from './components/contact/contact.component';
import { ConversationMaterialDetailsComponent } from './components/conversation-material-details/conversation-material-details.component';
import { ConversationMaterialComponent } from './components/conversation-material/conversation-material.component';
import { CreateConversationMaterialComponent } from './components/create-conversation-material/create-conversation-material.component';
import { CreateDiscoverCardComponent } from './components/create-discover-card/create-discover-card.component';
import { CreateEventComponent } from './components/create-event/create-event.component';
import { CreatePlanComponent } from './components/create-plan/create-plan.component';
import { DeepNeedCompassComponent } from './components/deep-need-compass/deep-need-compass.component';
import { DiscoverCardDetailsComponent } from './components/discover-card-details/discover-card-details.component';
import { DiscoverCardComponent } from './components/discover-card/discover-card.component';
import { EditContactGuardianComponent } from './components/edit-contact-guardian/edit-contact-guardian.component';
import { EstimateOverviewComponent } from './components/estimate-overview/estimate-overview.component';
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
        component: AdminComponent
      },
      {
        path: 'communication-material',
        component: CommunicationMaterialComponent
      },  
      {
        path: 'contact',
        component: ContactComponent
      },
      {
        path: 'estimate',
        component: EstimateComponent
      },
      {
        path: 'estimate-overview',
        component: EstimateOverviewComponent
      },
      {
        path: 'event',
        component: EventComponent
      },
      {
        path: 'goal',
        component: GoalComponent
      },
      {
        path: 'discover-card',
        component: DiscoverCardComponent
      },
      {
        path: 'discover-card/:discoverCardId',
        component: DiscoverCardDetailsComponent
      },
      {
        path: 'need-compass',
        component: NeedCompassComponent
      },
      {
        path: 'consent',
        component: ConsentComponent
      },
      {
        path: 'create-discover-card',
        component: CreateDiscoverCardComponent
      },
      {
        path: 'deep-need-compass',
        component: DeepNeedCompassComponent
      },
      {
        path: 'plan',
        component: PlanComponent
      },
      {
        path: 'assessment',
        component: AssessmentComponent
      },
      {
        path: 'conversation-material',
        component: ConversationMaterialComponent
      },
      {
        path: 'create-conversation-material',
        component: CreateConversationMaterialComponent
      },
      {
        path: 'conversation-material/:conversationMaterialId',
        component: ConversationMaterialDetailsComponent
      },
      {
        path: 'contact-person',
        component: ContactPersonComponent
      },
      {
        path: 'contact-guardian',
        component: ContactGuardianComponent
      },
      {
        path: 'edit-contact-guardian',
        component: EditContactGuardianComponent
      },
      {
        path: 'create-event',
        component: CreateEventComponent
      },
      {
        path: 'create-plan',
        component: CreatePlanComponent
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
