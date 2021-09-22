import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';
import { Observable } from 'rxjs';
import { SignInService } from '../services/sign-in/sign-in.service';

@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {

  constructor(private signinService: SignInService,
    private router: Router) {

}

canActivate(): any {

if (this.signinService.isSignedIn()) {
    return true;
} else {
  this.router.navigate(['/sign-in']);
}
}
}
