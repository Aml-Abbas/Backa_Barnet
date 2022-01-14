import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanDeactivate, RouterStateSnapshot, UrlTree } from '@angular/router';
import { Observable, of } from 'rxjs';
import { ComponentCanDeactivate } from '../interfaces/component-can-deactivate';
import { MatDialog } from '@angular/material/dialog';
import { DialogComponent } from '../components/dialog/dialog.component';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class DirtycheckGuard implements CanDeactivate<ComponentCanDeactivate> {
  constructor(public dialog: MatDialog) { }

  //warn the user about unsaved changes
  canDeactivate(
    component: ComponentCanDeactivate): Observable<boolean> {
    if (component.canDeactivate()) {
      return of(true);
    } else {
      const dialogRef = this.dialog.open(DialogComponent, {
        data: {
          title: 'Lämna sidan',
          text: "Du har inte sparat dina ändringar, Är du säker på att du vill lämna sidan?",
        }
      });

      return dialogRef.afterClosed().pipe(map(result => {
        return result;
      }));
    }
  }

}
