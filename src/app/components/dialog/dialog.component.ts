import { Component, OnInit, Inject } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';

@Component({
  selector: 'app-dialog',
  templateUrl: './dialog.component.html',
  styleUrls: ['./dialog.component.scss']
})

//the dialog component that shows to the user on confirmation
export class DialogComponent implements OnInit {
  title: string;
  text: string;

  //Show just one button on confirmation
  okButton: boolean = false;


  constructor(@Inject(MAT_DIALOG_DATA) public data: { title: string, text: string }) {
    this.title = data.title;
    this.text = data.text;


    // just show ok button on confirmation
    if (this.title == 'Skapa skattning' || this.title == 'Ändra status'
      || this.title == 'Skapa användare' || this.title == 'Skapa barnteam'
      || this.title == 'Ändra användare' || this.title == 'Avsluta insats') {
      this.okButton = true;
    }

  }

  ngOnInit(): void { }
}
