import { Injectable } from '@angular/core';
import { Actions, createEffect, ofType } from '@ngrx/effects';
import { catchError, map, switchMap } from 'rxjs/operators';
import * as UserRightsAction from '../actions/userRights.action';
import { UserRightService } from 'src/app/services/rights/user-right.service';
import { of } from 'rxjs';
import * as fromRoot from '../../../app/state';


@Injectable()
export class UserRightsEffect {
  constructor(private actions$: Actions,
    private userRightsService: UserRightService) { }

  updateUserRights$ = createEffect(() =>
    this.actions$.pipe(
      ofType(UserRightsAction.UPDATE_USER_RIGHTS),
      map((action: UserRightsAction.UpdateUserRights) => {
        return new UserRightsAction.UpdateUserRightsSuccess(action.payload);
      })));

      updateUserRight$ = createEffect(() =>
      this.actions$.pipe(
        ofType(UserRightsAction.UPDATE_USER_RIGHT),
        map((action: UserRightsAction.UpdateUserRight) => {
          return new UserRightsAction.UpdateUserRightSuccess(action.payload);
        })));
  
        
        createUserRight$= createEffect(()=>
        this.actions$.pipe(
          ofType(UserRightsAction.CREATE_USER_RIGHT),
          switchMap((action: UserRightsAction.CreateUserRight)=>{
            return this.userRightsService.CreateUserRight(action.CurrentUserID, action.UserID, action.PersonID, action.Type).pipe(
              map((response) => new UserRightsAction.CreateUserRightSuccess(response)),
              catchError((error: any)=> of(new UserRightsAction.CreateUserRightFail(error)))
            );
          })
        )
        );

     

      removeUserRight$ = createEffect(() =>
      this.actions$.pipe(
        ofType(UserRightsAction.REMOVE_USER_RIGHT),
        switchMap((action: UserRightsAction.RemoveUserRigh) => {
  
          return this.userRightsService.removeUserRight(action.payload).pipe(
            map((response) => new UserRightsAction.RemoveUserRighSuccess(response)),
            catchError((error: any) => of(new UserRightsAction.RemoveUserRighFail(error)))
          );
        })
      )
    );
  
    removeUserRightSuccess$ = createEffect(() =>
      this.actions$.pipe(
        ofType(UserRightsAction.REMOVE_USER_RIGHT_SUCCESS),
        switchMap((action: UserRightsAction.RemoveUserRighSuccess) => [
          new fromRoot.Go({ path: ['/rights'] }),
        ])
      )
    );
  
      /*  createUserRightSuccess$ = createEffect(() =>
        this.actions$.pipe(
          ofType(UserRightsAction.CREATE_USER_RIGHT_SUCCESS),
          switchMap((action: UserRightsAction.CreateUserRightSuccess) => [
            new fromRoot.Go({ path: ['/rights'] }),
          ])
        )
      );
 */
}

