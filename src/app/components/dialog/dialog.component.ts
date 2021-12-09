import { Component, OnInit, Inject } from '@angular/core';
import {MAT_DIALOG_DATA} from '@angular/material/dialog';


@Component({
  selector: 'app-dialog',
  templateUrl: './dialog.component.html',
  styleUrls: ['./dialog.component.scss']
})
export class DialogComponent implements OnInit {
  title: string;
  text:string;
  okButton: boolean= false;

  constructor(@Inject(MAT_DIALOG_DATA) public data: {title: string, text: string}) {
    this.title= data.title;
    this.text= data.text;
    if(this.title=='Skapa skattning'||this.title=='Ändra status'){
      this.okButton= true;
    }
  }

  ngOnInit(): void {}
}
