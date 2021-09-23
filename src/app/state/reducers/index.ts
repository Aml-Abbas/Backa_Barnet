/* import * as fromLogin from './login.reducer';

import {ActionReducerMap, createFeatureSelector} from '@ngrx/store';

export interface State {
    Login: fromLogin.LoginState;
    currentUser: fromCurrentUser.CurrentUserState;
    items: fromItems.ItemState;
    orders: fromOrder.OrderState;
    selectedSeller: fromSelectedSeller.SelectedSellerState;
  }
  
  export const reducers: ActionReducerMap<BuyerState, any> = {
    buyerLogin: fromLogin.reducer,
    currentUser: fromCurrentUser.reducer,
    items: fromItems.reducer,
    orders: fromOrder.reducer,
    selectedSeller: fromSelectedSeller.reducer
  };
  
  export const getState = createFeatureSelector<State>('');
   */