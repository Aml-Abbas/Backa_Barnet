import { Component, OnInit } from '@angular/core';
import * as fromRoot from '../../state';
import { Store } from '@ngrx/store';
import * as fromState from '../../state';
import { Observable } from 'rxjs';
import { Person } from 'src/app/models/Person';
import { Contact } from 'src/app/models/Contact';
import { GetSetService } from 'src/app/services/get-set/get-set.service';
import {FormBuilder, FormGroup, Validators, FormControl} from '@angular/forms';

@Component({
  selector: 'app-edit-contact-guardian',
  templateUrl: './edit-contact-guardian.component.html',
  styleUrls: ['./edit-contact-guardian.component.scss']
})
export class EditContactGuardianComponent implements OnInit {
  current_person$= new Observable<Person | null>();

  barnKontakt$= new Observable<Contact[] | null>();
  changeBarnKontaktFormGroup: FormGroup;
  email = new FormControl('', [Validators.required, Validators.email]);

  userRoleId: string;
  saveError='';
  nameError='';
  emailError='';
  organisationError='';

  constructor(private store: Store<fromState.State>,
    private getSetService: GetSetService,
    private _formBuilder: FormBuilder) { }

  ngOnInit(): void {
      this.changeBarnKontaktFormGroup = this._formBuilder.group({
        nameControl:['', [Validators.required, Validators.minLength(2)]],
        organisationControl:['', [Validators.required, Validators.minLength(3)]],
      }); 

    this.current_person$ = this.store.select(fromState.getCurrentPerson);
    this.current_person$.subscribe(data=>{
       this.barnKontakt$ = this.getSetService.getBarnKontakt(String(data?.personID)); 

        });
          
        this.store.select(fromState.getCurrentUser).subscribe(data=>{
          this.userRoleId= String(data?.roleID);
    
        });
      }

  public save(): void {
    this.saveError='';
    this.nameError='';
    this.emailError='';
    this.organisationError='';

    console.log(this.changeBarnKontaktFormGroup.controls.nameControl.value);
    console.log(this.changeBarnKontaktFormGroup.controls.organisationControl.value);

    if(this.email.hasError('required') ){
      this.emailError='Du behöver skriva ett värde i mejlet';
      this.saveError='Du har missat att fylla i saker';
    }else if( this.email.hasError('email')){
      this.saveError='Du har missat att fylla i saker';
      this.emailError='Inte en giltig e-post';
    }
   if(this.changeBarnKontaktFormGroup.controls.nameControl.status== "INVALID"){
      this.nameError='Namnet är fel, mist två bokstäver';
      this.saveError='Du har missat att fylla i saker';
    }if(this.changeBarnKontaktFormGroup.controls.organisationControl.status== "INVALID"){
      this.organisationError='Organisation fel, minst tre boksäver.';
      this.saveError='Du har missat att fylla i saker';
    }
    if(this.saveError==''){

    }
    //this.store.dispatch(new fromRoot.Go({ path: ['contact-guardian'] }));
  }

  getErrorMessage() {
    if (this.email.hasError('required')) {
      return 'Du behöver skriva ett värde';
    }

    return this.email.hasError('email') ? 'Inte en giltig e-post' : '';
  }

}
