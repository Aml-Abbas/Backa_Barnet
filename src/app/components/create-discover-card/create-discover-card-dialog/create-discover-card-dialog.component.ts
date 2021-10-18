import { Component, OnInit, Inject } from '@angular/core';
import {MAT_DIALOG_DATA} from '@angular/material/dialog';


@Component({
  selector: 'app-create-discover-card-dialog',
  templateUrl: './create-discover-card-dialog.component.html',
  styleUrls: ['./create-discover-card-dialog.component.scss']
})
export class CreateDiscoverCardDialogComponent implements OnInit {
  text:string;
  status:boolean= false;
  guardians:string[][];

  constructor(@Inject(MAT_DIALOG_DATA) public data: {isAnonyms: boolean}) {
    this.status= data.isAnonyms;
  }

  ngOnInit(): void {
    if(this.status){
    this.text= 'kortet kommer att skickas in';

    }else{
    this.text= 'kortet kommer att anonymiseras för det saknas samtycke';
    }
  }
}
