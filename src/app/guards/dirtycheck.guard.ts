import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanDeactivate, RouterStateSnapshot, UrlTree } from '@angular/router';
import { Observable } from 'rxjs';
import { ComponentCanDeactivate } from '../interfaces/component-can-deactivate';

@Injectable({
  providedIn: 'root'
})
export class DirtycheckGuard implements CanDeactivate<ComponentCanDeactivate> {
  canDeactivate(
    component: ComponentCanDeactivate,
    currentRoute: ActivatedRouteSnapshot,
    currentState: RouterStateSnapshot,
    nextState: RouterStateSnapshot): Observable<boolean | UrlTree> | Promise<boolean | UrlTree> | boolean | UrlTree {
      if(component.canDeactivate()){
        return true;
      }else{
        return confirm('Du har inte sparat dina ändringar, Är du säker att du vill lämna sidan?');
      }
  }
  
}
