import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AdminComponent } from './components/admin/admin.component';
import { CommunicationMaterialComponent } from './components/communication-material/communication-material.component';
import { ContactComponent } from './components/contact/contact.component';
import { DiscoverCardComponent } from './components/discover-card/discover-card.component';
import { EstimateComponent } from './components/estimate/estimate.component';
import { EventAndPlanComponent } from './components/event-and-plan/event-and-plan.component';
import { GoalComponent } from './components/goal/goal.component';
import { LandingComponent } from './components/landing/landing.component';
import { NeedCompassComponent } from './components/need-compass/need-compass.component';

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
        path: 'communication_material',
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
        path: 'event_and_plan',
        component: EventAndPlanComponent
      },
      {
        path: 'goal',
        component: GoalComponent
      },
      {
        path: 'discover_card',
        component: DiscoverCardComponent
      },
      {
        path: 'need_compass',
        component: NeedCompassComponent
      }
    ]
  }

];
@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
