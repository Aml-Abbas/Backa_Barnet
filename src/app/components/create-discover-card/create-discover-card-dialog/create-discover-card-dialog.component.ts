import { Component, OnInit, Inject } from '@angular/core';
import {MAT_DIALOG_DATA} from '@angular/material/dialog';


@Component({
  selector: 'app-create-discover-card-dialog',
  templateUrl: './create-discover-card-dialog.component.html',
  styleUrls: ['./create-discover-card-dialog.component.scss']
})
export class CreateDiscoverCardDialogComponent implements OnInit {
  text:string;

  constructor(@Inject(MAT_DIALOG_DATA) public data: {text: string}) {
    this.text= data.text;
  }

  ngOnInit(): void {}
}
