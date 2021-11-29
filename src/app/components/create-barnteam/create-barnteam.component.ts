import { Component, OnInit } from '@angular/core';
import { Unit } from 'src/app/models/Unit';
import { GetSetService } from '../../services/get-set/get-set.service';
import { Observable } from 'rxjs';
import {FormControl} from '@angular/forms';
import {map, startWith} from 'rxjs/operators';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';

@Component({
  selector: 'app-create-barnteam',
  templateUrl: './create-barnteam.component.html',
  styleUrls: ['./create-barnteam.component.scss']
})
export class CreateBarnteamComponent implements OnInit {
  createBarnteamFormGroup: FormGroup;

  selectedRole= '0';
  unitNbr=1; 
  added_units: string[]= [];
  units$: Observable<Unit[]> = new Observable<Unit[]>();
  medlemNbr=1; 
  added_members: string[]= [];


  units = new FormControl();
  medlems = new FormControl();

  unitList: string[] = ['Extra cheese', 'Mushroom', 'Onion', 'Pepperoni', 'Sausage', 'Tomato', 'cheese', 'Mush', 'On', 'Peroni', 'Sge', 'To'];
  medlemList: string[] = ['Extra cheese', 'Mushroom', 'Onion', 'Pepperoni', 'Sausage', 'Tomato', 'cheese', 'Mush', 'On', 'Peroni', 'Sge', 'To'];
  saveError='';
  nameError='';
  unitError='';
  memberError='';

  constructor(private getSetService: GetSetService,
    private _formBuilder: FormBuilder) { }

  ngOnInit(): void {
    this.units$= this.getSetService.getUnits();
    this.createBarnteamFormGroup = this._formBuilder.group({
      nameControl:['', [Validators.required, Validators.minLength(2)]],
    }); 

  }

  increaseUnit(){
    this.unitNbr++;
  }

  decreaseUnit(){
    this.unitNbr--;
  }

  addUnit(name: string, nbr: string){
    this.added_units.push(nbr);
  }


  increaseMedlem(){
    this.medlemNbr++;
  }

  decreaseMedlem(){
    this.medlemNbr--;
  }
  addMember(name: string, nbr: string){
    this.added_members.push(nbr);
  }


  create(){
    this.saveError='';
    this.nameError='';
    this.unitError='';
    this.memberError='';
  
    console.log(this.units);
    console.log(this.medlems);
    if(this.createBarnteamFormGroup.status== "INVALID"){
      this.saveError='Rätta felen först';
      this.nameError='Namnet ska vara minst två bokstäver.';
    }

    if(this.units.value==null){
      this.saveError='Rätta felen först';
      this.unitError='Välj minst en enhet.';

    }

    if(this.medlems.value==null){
      this.saveError='Rätta felen först';
      this.memberError='Välj minst ett medlem.';

    }
  }
}
