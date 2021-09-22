import { Component, OnInit } from '@angular/core';
import { SignInService } from 'src/app/services/sign-in/sign-in.service';

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.scss']
})
export class AdminComponent implements OnInit {

  constructor(private signInService: SignInService) { }

  ngOnInit(): void {
  }

  public signOut(): void {
    this.signInService.signOut();
  }
}
