import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AdminComponent } from './components/admin/admin.component';
import { CommunicationMaterialComponent } from './components/communication-material/communication-material.component';
import { ConsentComponent } from './components/consent/consent.component';
import { ContactComponent } from './components/contact/contact.component';
import { CreateDiscoverCardComponent } from './components/create-discover-card/create-discover-card.component';
import { DeepNeedCompassComponent } from './components/deep-need-compass/deep-need-compass.component';
import { DiscoverCardComponent } from './components/discover-card/discover-card.component';
import { EstimateComponent } from './components/estimate/estimate.component';
import { EventAndPlanComponent } from './components/event-and-plan/event-and-plan.component';
import { GoalComponent } from './components/goal/goal.component';
import { LandingComponent } from './components/landing/landing.component';
import { NeedCompassComponent } from './components/need-compass/need-compass.component';
import { SignInComponent } from './components/sign-in/sign-in.component';


const routes: Routes = [
  {
    path: '',
    component: LandingComponent,
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
        path: 'event-and-plan',
        component: EventAndPlanComponent
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
      }
    ]
  },
  { 
    path: 'sign-in',
  component: SignInComponent,
}

];
@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
