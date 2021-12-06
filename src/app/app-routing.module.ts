import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
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
import { SignInComponent } from './components/sign-in/sign-in.component';
import { AuthGuard } from './guards/auth.guard';
import { SignInGuard } from './guards/sign-in.guard';
import { EditGuardianGuard } from './guards/edit-guardian.guard';
import { DiscoverCardDetailsGuard } from './guards/discover-card-details.guard';
import { AdminGuard } from './guards/admin.guard';
import { ConversationMaterialGuard } from './guards/conversation-material.guard';
import { ConversationMaterialDetailsGuard } from './guards/conversation-material-details.guard';
import { EstimateGuard } from './guards/estimate.guard';
import { EstimateOverviewGuard } from './guards/estimate-overview.guard';
import { NeedCompassGuard } from './guards/need-compass.guard';
import { ConsentGuard } from './guards/consent.guard';
import { EventGuard } from './guards/event.guard';
import { GoalGuard } from './guards/goal.guard';
import { CreateEventGuard } from './guards/create-event.guard';
import { DirtycheckGuard } from './guards/dirtycheck.guard';
import { EditDiscoverCardComponent } from './components/edit-discover-card/edit-discover-card.component';
import { DiscoverCardEditGuard } from './guards/discover-card-edit.guard';
import { EditConversationMaterialComponent } from './components/edit-conversation-material/edit-conversation-material.component';
import { ConversationMaterialEditGuard } from './guards/conversation-material-edit.guard';
import { CreateUserComponent } from './components/create-user/create-user.component';
import { CreateBarnteamComponent } from './components/create-barnteam/create-barnteam.component';
import { UsersComponent } from './components/users/users.component';
import { BarnteamComponent } from './components/barnteam/barnteam.component';
import { UserDetailsComponent } from './components/user-details/user-details.component';
import { BarnteamDetailsComponent } from './components/barnteam-details/barnteam-details.component';
import { EditUserComponent } from './components/edit-user/edit-user.component';
import { EditBarnteamComponent } from './components/edit-barnteam/edit-barnteam.component';
import { CreateInsatsComponent } from './components/create-insats/create-insats.component';
import { UserDetailsGuard } from './guards/user-details.guard';
import { BarnteamDetailsGuard } from './guards/barnteam-details.guard';


const routes: Routes = [
  {
    path: '',
    component: LandingComponent, canActivate: [AuthGuard],
    children:[
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
        component: EstimateComponent, canActivate: [EstimateGuard], canDeactivate: [DirtycheckGuard]
      },
      {
        path: 'estimate-overview',
        component: EstimateOverviewComponent, canActivate: [EstimateOverviewGuard]
      },
      {
        path: 'event',
        component: EventComponent, canActivate: [EventGuard]
      },
      {
        path: 'goal',
        component: GoalComponent, canActivate: [GoalGuard]
      },
      {
        path: 'discover-card',
        component: DiscoverCardComponent
      },
      {
        path: 'discover-card/:discoverCardId',
        component: DiscoverCardDetailsComponent, canActivate: [DiscoverCardDetailsGuard]
      },
      {
        path: 'need-compass',
        component: NeedCompassComponent, canActivate: [NeedCompassGuard]
      },
      {
        path: 'consent',
        component: ConsentComponent, canActivate: [ConsentGuard]
      },
      {
        path: 'create-discover-card',
        component: CreateDiscoverCardComponent, canDeactivate:[DirtycheckGuard]
      },
      {
        path: 'deep-need-compass',
        component: DeepNeedCompassComponent
      },
      {
        path: 'conversation-material',
        component: ConversationMaterialComponent, canActivate: [ConversationMaterialGuard]
      },
      {
        path: 'create-conversation-material',
        component: CreateConversationMaterialComponent, canActivate: [ConversationMaterialGuard], canDeactivate:[DirtycheckGuard]
      },
      {
        path: 'conversation-material/:conversationMaterialId',
        component: ConversationMaterialDetailsComponent,
        canActivate: [ConversationMaterialDetailsGuard]
      },
      {
        path: 'contact-person',
        component: ContactPersonComponent, canDeactivate:[DirtycheckGuard]
      },
      {
        path: 'contact-guardian',
        component: ContactGuardianComponent
      },
      {
        path: 'edit-contact-guardian',
        component: EditContactGuardianComponent, canActivate: [EditGuardianGuard]
      },
      {
        path: 'create-event',
        component: CreateEventComponent, canActivate: [CreateEventGuard]
      }, 
      {
        path: 'create-insats',
        component: CreateInsatsComponent, canActivate: [CreateEventGuard]
      }, 
      {
        path: 'edit-discover-card/:discoverCardId',
        component: EditDiscoverCardComponent, canDeactivate:[DirtycheckGuard],
        canActivate: [DiscoverCardEditGuard]
      },
      {
        path: 'edit-conversation-material/:conversationMaterialId',
        component: EditConversationMaterialComponent, canDeactivate:[DirtycheckGuard],
        canActivate: [ConversationMaterialEditGuard]
      },
      {
        path: 'create-user',
        component: CreateUserComponent, canDeactivate: [DirtycheckGuard]
        //, canActivate: [AdminGuard]
      },
      {
        path: 'users',
        component: UsersComponent
        //, canActivate: [AdminGuard]
      },
      {
        path: 'barnteam',
        component: BarnteamComponent
        //, canActivate: [AdminGuard]
      },
      {
        path: 'create-barnteam',
        component: CreateBarnteamComponent, canDeactivate: [DirtycheckGuard]
        //, canActivate: [AdminGuard]
      },
      {
        path: 'users/:userid',
        component: UserDetailsComponent, canActivate:[UserDetailsGuard]
      },
      {
        path: 'barnteam/:barnteamId',
        component: BarnteamDetailsComponent, canActivate:[BarnteamDetailsGuard]
      },
      {
        path: 'edit-user/:userid',
        component: EditUserComponent, canActivate:[UserDetailsGuard]
      },
      {
        path: 'edit-barnteam/:barnteamId',
        component: EditBarnteamComponent, canActivate:[BarnteamDetailsGuard]
      },
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
