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

  constructor(@Inject(MAT_DIALOG_DATA) public data: {title: string, text: string}) {
    this.title= data.title;
    this.text= data.text;
  }

  ngOnInit(): void {}
}