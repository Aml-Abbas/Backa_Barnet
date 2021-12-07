import { Component, OnInit } from '@angular/core';
import {Store} from '@ngrx/store';
import * as fromStore from 'src/app/state';
import {FormBuilder, FormGroup, Validators, FormControl} from '@angular/forms';
import { Observable } from 'rxjs';
import { Unit } from 'src/app/models/Unit';
import { GetSetService } from '../../services/get-set/get-set.service';
import { User } from 'src/app/models/User';
import * as fromState from '../../state';

@Component({
  selector: 'app-edit-user',
  templateUrl: './edit-user.component.html',
  styleUrls: ['./edit-user.component.scss']
})
export class EditUserComponent implements OnInit {

  createUserFormGroup: FormGroup;
  email = new FormControl('', [Validators.required, Validators.email]);
  selectedRole= '0';
  selectedOrganisation= '0';

  unitNbr=0; 
  added_units: string[]= [];
  //units$: Observable<Unit[]> = new Observable<Unit[]>();
  units$: Promise<Unit[]>= new Promise((resolve, reject) => { });

  units = new FormControl();
  
  saveError='';
  nameError='';
  emailError='';
  unitError='';

  user$= new Observable<User | null>();
  userID: string;

  getErrorMessage() {
    if (this.email.hasError('required')) {
      return 'Du behöver skriva ett värde';
    }

    return this.email.hasError('email') ? 'Inte ett giltigt mejl' : '';
  }
  constructor(private store: Store<fromStore.State>,
    private _formBuilder: FormBuilder,
    private getSetService: GetSetService) { }

  ngOnInit(): void {
    this.units$= this.getSetService.getUnitsWithoutAnnat();

    this.createUserFormGroup = this._formBuilder.group({
      nameControl:['', [Validators.required, Validators.minLength(2)]],
    }); 

    this.user$= this.store.select(fromState.getCurrentAdminUser);
    this.user$.subscribe(data=>{
      this.userID= data?.userID ??'';
      this.selectedRole= data?.roleID??'';
      console.log(this.selectedRole);
    });

  }


  save(){
    this.saveError='';
    this.nameError='';
    this.emailError='';
    this.unitError='';
  
    if(this.email.hasError('required') ){
      this.emailError='Du behöver skriva ett värde i mejlet';
      this.saveError='Rätta felen först';
    }else if( this.email.hasError('email')){
      this.saveError='Rätta felen först';
      this.emailError='Inte ett giltigt mejl';
    }
    if(this.createUserFormGroup.controls.nameControl.status== "INVALID"){
      this.nameError='Namnet ska vara mist två bokstäver.';
      this.saveError='Rätta felen först';
    }if(this.selectedRole!='0'){
      if(this.units.value==null){
        this.unitError='Du måste välja minst en enhet.';
        this.saveError='Rätta felen först';
      }
    }
    
  }

  delete(){

  }
  
  changeRole(nbr: number){
    if(nbr==0){
      this.unitNbr=0;
    }
    else{
      this.unitNbr=1;
    }
  }

}
