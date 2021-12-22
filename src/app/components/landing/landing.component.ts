import { Component, OnInit } from '@angular/core';
import { BreakpointObserver } from '@angular/cdk/layout';
import { ViewChild } from '@angular/core'
import { MatSidenav } from '@angular/material/sidenav';
import { Observable } from 'rxjs';
import { Person } from 'src/app/models/Person';
import { User } from 'src/app/models/User';
import * as fromState from '../../state';
import { Store } from '@ngrx/store';
import * as fromRoot from '../../../app/state';
import { MatDialog } from '@angular/material/dialog';
import { DialogComponent } from '../dialog/dialog.component';

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
  goal = false;
  admin = false;

  current_person$ = new Observable<Person | null>();
  current_user$ = new Observable<User | null>();
  userRoleId: number;

  // check if the user has right to a specifik meny
  isDisabledEstimate = true;
  isDisabledAdmin = true;
  isDisabledConversationMaterial = true;
  isDisabledNeedCompass = true;
  isDisabledConsent = true;
  isDisabledEvent = true;
  isDisabledGoal = true;

  isDisabledNeedCompassMenu = true;
  isDisabledGoalMenu = true;

  constructor(private observer: BreakpointObserver,
    private store: Store<fromState.State>,
    public dialog: MatDialog) { }


  ngOnInit(): void {
    this.current_person$ = this.store.select(fromState.getCurrentPerson);
    this.current_user$ = this.store.select(fromState.getCurrentUser);
    this.current_user$.subscribe(data => {
      this.userRoleId = parseInt(String(data?.roleID));
      let userID: string = data?.userID ?? '';
      this.store.dispatch(new fromState.LoadPersons(userID));
    })

    // get the user rights by using userRoleId
    if (this.userRoleId == 4 || this.userRoleId == 2) {
      this.isDisabledConversationMaterial = false;
      this.isDisabledEvent = false;
      this.isDisabledGoalMenu = false;
      this.isDisabledNeedCompassMenu = false;
    }
    if (this.userRoleId == 4 || this.userRoleId == 2 || this.userRoleId == 3) {
      this.isDisabledEstimate = false;
      this.isDisabledNeedCompass = false;
      this.isDisabledConsent = false;
      this.isDisabledGoal = false;
      this.isDisabledGoalMenu = false;
      this.isDisabledNeedCompassMenu = false;
    }

    if (this.userRoleId == 4) {
      this.isDisabledAdmin = false;
    }

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
  showFillerGoalIcon = 'chevron_right';
  showFillerAdminIcon = 'chevron_right';

  // change the arrow beside the meny to the contact
  public changeShowFillerContact() {
    this.need_compass = false;
    this.deep_need_compass = false;
    this.goal = false;
    this.admin = false;

    this.showFillerContact = !this.showFillerContact;

    this.showFillerDeepCompassIcon = 'chevron_right';
    this.showFillerCompassIcon = 'chevron_right';
    this.showFillerGoalIcon = 'chevron_right';
    this.showFillerAdminIcon = 'chevron_right';

    if (this.showFillerContactIcon == 'chevron_right') {
      this.showFillerContactIcon = 'expand_more';
    } else {
      this.showFillerContactIcon = 'chevron_right';
    }
  }

  // change the arrow beside the meny to the goal
  public changeShowFillerGoal() {
    this.need_compass = false;
    this.deep_need_compass = false;
    this.showFillerContact = false;
    this.admin = false;

    this.goal = !this.goal;

    this.showFillerDeepCompassIcon = 'chevron_right';
    this.showFillerCompassIcon = 'chevron_right';
    this.showFillerAdminIcon = 'chevron_right';
    this.showFillerContactIcon = 'chevron_right';

    if (this.showFillerGoalIcon == 'chevron_right') {
      this.showFillerGoalIcon = 'expand_more';
    } else {
      this.showFillerGoalIcon = 'chevron_right';
    }
  }

  // change the arrow beside the meny to the admin
  public changeShowFillerAdmin() {
    this.need_compass = false;
    this.deep_need_compass = false;
    this.showFillerContact = false;
    this.goal = false;

    this.admin = !this.admin;

    this.showFillerContactIcon = 'chevron_right';
    this.showFillerDeepCompassIcon = 'chevron_right';
    this.showFillerCompassIcon = 'chevron_right';
    this.showFillerGoalIcon = 'chevron_right';

    if (this.showFillerAdminIcon == 'chevron_right') {
      this.showFillerAdminIcon = 'expand_more';

    } else {
      this.showFillerAdminIcon = 'chevron_right';
    }
  }

  // to be usen in the next phase
  /*  // change the arrow beside the meny to the deep  compass
   public changeShowFillerDeepCompass() {
     this.showFillerContact = false;
     this.need_compass = false;
     this.goal = false;
     this.admin = false;
 
     this.deep_need_compass = !this.deep_need_compass;
 
     this.showFillerContactIcon = 'chevron_right';
     this.showFillerCompassIcon = 'chevron_right';
     this.showFillerGoalIcon = 'chevron_right';
     this.showFillerAdminIcon = 'chevron_right';
 
     if (this.showFillerDeepCompassIcon == 'chevron_right') {
       this.showFillerDeepCompassIcon = 'expand_more';
     } else {
       this.showFillerDeepCompassIcon = 'chevron_right';
     }
   } */

  // change the arrow beside the meny to the need compass
  public changeShowFillerNeedCompass() {
    this.showFillerContact = false;
    this.deep_need_compass = false;
    this.goal = false;
    this.admin = false;

    this.need_compass = !this.need_compass;

    this.showFillerContactIcon = 'chevron_right';
    this.showFillerDeepCompassIcon = 'chevron_right';
    this.showFillerGoalIcon = 'chevron_right';
    this.showFillerAdminIcon = 'chevron_right';

    if (this.showFillerCompassIcon == 'chevron_right') {
      this.showFillerCompassIcon = 'expand_more';
    } else {
      this.showFillerCompassIcon = 'chevron_right';
    }
  }

  // change the arrow beside the meny to all 
  changeShowFiller() {
    this.showFillerContact = false;
    this.deep_need_compass = false;
    this.need_compass = false;
    this.goal = false;
    this.admin = false;

    this.showFillerContactIcon = 'chevron_right';
    this.showFillerDeepCompassIcon = 'chevron_right';
    this.showFillerCompassIcon = 'chevron_right';
    this.showFillerGoalIcon = 'chevron_right';
    this.showFillerAdminIcon = 'chevron_right';
  }

  // delete the choosen child, show a confirmation msg to warn the user
  delete_current_person(): void {
    const dialogRef = this.dialog.open(DialogComponent, {
      data: {
        title: 'Avmarkera barnet',
        text: 'Är du säker att du vill avmarkera barnet? Du kan inte skapa samtalsunderlag eller skattning om du inte väljer ett barn först. Se till att har sparat innan du klickar på bekräfta.',
      }
    });

    // delete  the choosen child from the storage 
    dialogRef.afterClosed().subscribe(result => {
      if (result) {
        this.store.dispatch(new fromState.UpdatePerson(null));
      }
    });
  }

  // check the user rrights before moving the user to the specific page 
  goToRoute(event, route: string) {
    if (route == 'conversation-material' && this.isDisabledConversationMaterial) {
      event.stopPropagation()
    } else if (route == 'need-compass' && this.isDisabledNeedCompass) {
      event.stopPropagation()
    } else if (route == 'estimate' && this.isDisabledEstimate) {
      event.stopPropagation()
    } else if (route == 'consent' && this.isDisabledConsent) {
      event.stopPropagation()
    } else if (route == 'event' && this.isDisabledEvent) {
      event.stopPropagation()
    } else if (route == 'goal' && this.isDisabledGoal) {
      event.stopPropagation()
    } else {
      this.store.dispatch(new fromRoot.Go({ path: ['/' + route] }));
    }
  }

  // check the user rights before calling other methos
  changeFiller(event, type: string) {
    if (type == 'need-compass-menu') {
      if (this.isDisabledNeedCompassMenu) {
        event.stopPropagation()
      } else {
        this.changeShowFillerNeedCompass();
      }
    } else if (type == 'goal-menu') {
      if (this.isDisabledGoalMenu) {
        event.stopPropagation()
      } else {
        this.changeShowFillerGoal();
      }
    } else if (type == 'admin-menu') {
      if (this.isDisabledAdmin) {
        event.stopPropagation()
      } else {
        this.changeShowFillerAdmin();
      }
    }
  }

  // to be called on clicking in the log out button in the meny
  // call  the logout action to log the user out of the system
  logOut() {
    this.store.dispatch(new fromState.Logout());
  }
}
