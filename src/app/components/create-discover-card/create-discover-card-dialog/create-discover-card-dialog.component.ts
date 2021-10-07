import { Component, OnInit, Inject } from '@angular/core';
import {MAT_DIALOG_DATA} from '@angular/material/dialog';


@Component({
  selector: 'app-create-discover-card-dialog',
  templateUrl: './create-discover-card-dialog.component.html',
  styleUrls: ['./create-discover-card-dialog.component.scss']
})
export class CreateDiscoverCardDialogComponent implements OnInit {
  text:string;
  status:boolean= true;
  guardians:string[][];

  constructor(@Inject(MAT_DIALOG_DATA) public data: {name: string, personNbr: string, guardians: [][] }) { 
    this.guardians= data.guardians;
  }

  ngOnInit(): void {
    if(this.guardians[0][3]=='false'||this.guardians[1][3]=='false'){
      this.text= 'kortet kommer att annomineras för det saknas samtycke';
    }else{
      this.text= 'kortet kommer att skickas in';
    }
  }
}
