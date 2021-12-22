import * as fromLogin from './login.reducer';
import * as fromRouter from '@ngrx/router-store';
import * as fromCurrentPerson from './currentPerson.reducer';
import * as fromPersons from './persons.reducer';
import * as fromDiscoverCard from './discoverCard.reducer';
import * as fromCurrentCard from './currentCard.reducer';
import * as fromConversationMaterial from './conversationMaterial.reducer';
import * as fromEstimate from './estimate.reducer';
import * as fromAdmin from './admin.reducer';

import { hydrationMetaReducer } from './hydration.reducer';
import { clearMetaReducer } from './clear.reducer';

import {
  ActivatedRouteSnapshot,
  RouterStateSnapshot,
  Params,
} from '@angular/router';

import { ActionReducerMap, createFeatureSelector, MetaReducer } from '@ngrx/store';

export interface RouterStateUrl {
  url: string;
  queryParams: Params;
  params: Params;
}


export interface State {
  Login: fromLogin.LoginState;
  routerReducer: fromRouter.RouterReducerState<RouterStateUrl>;
  currentPerson: fromCurrentPerson.CurrentPersonState;
  persons: fromPersons.PersonsState;
  discoverCard: fromDiscoverCard.DiscoverCardState;
  currentCard: fromCurrentCard.CurrentCardState;
  conversationMaterial: fromConversationMaterial.ConversationMaterialSatet;
  estimate: fromEstimate.EstimateSatet;
  admin: fromAdmin.CurrentAdminState;
}

export class CustomSerializer
  implements fromRouter.RouterStateSerializer<RouterStateUrl> {
  serialize(routerState: RouterStateSnapshot): RouterStateUrl {
    const { url } = routerState;
    const { queryParams } = routerState.root;

    let state: ActivatedRouteSnapshot = routerState.root;
    while (state.firstChild) {
      state = state.firstChild;
    }
    const { params } = state;

    return { url, queryParams, params };
  }
}

export const reducers: ActionReducerMap<State, any> = {
  Login: fromLogin.reducer,
  routerReducer: fromRouter.routerReducer,
  currentPerson: fromCurrentPerson.reducer,
  persons: fromPersons.reducer,
  discoverCard: fromDiscoverCard.reducer,
  currentCard: fromCurrentCard.reducer,
  conversationMaterial: fromConversationMaterial.reducer,
  estimate: fromEstimate.reducer,
  admin: fromAdmin.reducer,
};

export const getRouterState = createFeatureSelector<
  fromRouter.RouterReducerState<RouterStateUrl>>('routerReducer');


export const getState = createFeatureSelector<State>('app');
export const metaReducers: MetaReducer[] = [hydrationMetaReducer, clearMetaReducer];
