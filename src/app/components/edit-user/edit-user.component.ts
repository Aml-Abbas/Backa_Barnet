import { Component, OnInit } from '@angular/core';
import {Store} from '@ngrx/store';
import * as fromStore from 'src/app/state';
import {FormBuilder, FormGroup, Validators, FormControl} from '@angular/forms';
import { Observable } from 'rxjs';
import { Unit } from 'src/app/models/Unit';
import { GetSetService } from '../../services/get-set/get-set.service';
import { User } from 'src/app/models/User';
import * as fromState from '../../state';
import { ComponentCanDeactivate } from 'src/app/interfaces/component-can-deactivate';
import { MatDialog } from '@angular/material/dialog';
import { DialogComponent } from '../dialog/dialog.component';

@Component({
  selector: 'app-edit-user',
  templateUrl: './edit-user.component.html',
  styleUrls: ['./edit-user.component.scss']
})
export class EditUserComponent implements OnInit , ComponentCanDeactivate {
  canDeactivate(): boolean {
    return !this.isDirty;
  }

  isDirty = false;
  selectedRole= '0';
  selectedOrganisation= '0';

  unitNbr=0; 
  added_units: string[]= [];
  punits: Promise<Unit[]>= new Promise((resolve, reject) => { });
  unitsList : Unit[]= [];

  units = new FormControl();
  unitList: string[] = [];

  saveError='';
  firstNameError='';
  lastNameError='';
  unitError='';
  organisationError='';

  user$= new Observable<User | null>();
  user: User;

  constructor(private store: Store<fromStore.State>,
    private getSetService: GetSetService,
    public dialog: MatDialog) { }

  ngOnInit(): void {

    this.punits= this.getSetService.getUnitsWithoutAnnat();
    let unitsList= this.unitsList;
    this.punits.then(function (response) {
      response.forEach((unit: Unit)=>{
        unitsList.push(unit);
    });
    });
    unitsList.forEach(element=>{
      this.unitsList.push(element);
    });

    this.user$= this.store.select(fromState.getCurrentAdminUser);
    this.user$.subscribe(data=>{
      var userID= data?.userID ??'';
      var lastName= data?.lastName ??'';
      var firstName= data?.firstName ??'';
      var email= data?.email ??'';
      var roleID= data?.roleID ??'';
      var description= data?.description ??'';
      var organisaton= data?.organisaton ??'';
      var name= data?.name ??'';
      var units= data?.units ??[];
      this.user = new User(userID, firstName, lastName, email, roleID, description, 
        organisaton, name, units);
   
        units.forEach(unit=>{
          this.unitList.push(unit.unitName);
        });

        this.units = new FormControl(this.unitList);
        console.log(this.units.value);
    });

}

  save(){
    this.saveError='';
    this.firstNameError='';
    this.lastNameError='';
    this.unitError='';
    this.organisationError='';

    console.log(this.units.value);

    if(this.user.firstName.trim().length<2){
      this.firstNameError='Förnamn ska vara mist två bokstäver.';
      this.saveError='Rätta felen först';
    }if(this.user.lastName.trim().length<2){
      this.lastNameError='Efternamn ska vara mist två bokstäver.';
      this.saveError='Rätta felen först';
    }if(this.user.organisaton.trim().length<2){
      this.organisationError='Organisationen ska vara minst två bokstäver.';
      this.saveError='Rätta felen först';
    }if(this.user.roleID!='1' && this.user.roleID!='4'){
      if(this.units.value==null){
        this.unitError='Du måste välja minst en enhet.';
        this.saveError='Rätta felen först';
      }
    }
    if(this.saveError==''){
      var unitID=0;
      if(this.units.value!=null){
        unitID= 3;
      }
      var user = {
        LastName :  this.user.lastName.trim()?? '0',
        FirstName : this.user.firstName.trim() ?? '0',
        Organisation : this.user.organisaton.trim() ?? '0',
        RoleID : parseInt(this.user.roleID) ?? 0,
        UnitID : unitID,
        UserID :this.user.userID,
      } 
      this.isDirty= false;
      this.store.dispatch(new fromState.UpdateUser(user));
    }
  }

  delete(){
    const dialogRef = this.dialog.open(DialogComponent, {
      data: {
        title: 'Ta bort användare',
        text: 'Är du säker att du vill ta bort användaren?',
      }
    });

    dialogRef.afterClosed().subscribe(result => {
      if (result) {
        var user = {
          UserID :this.user.userID,
        } 
        this.isDirty= false;
        this.store.dispatch(new fromState.RemoveUser(user));
        }
    });

  }

}
