import {Action, ActionReducer, INIT} from '@ngrx/store';
import {State} from './index';
import * as HydrationAction from '../actions/hydration.action';

function isHydrateSuccess(
  action: Action
): action is ReturnType<typeof HydrationAction.hydrateSuccess> {
  return action.type === HydrationAction.hydrateSuccess.type;
}

export const hydrationMetaReducer = (
  reducer: ActionReducer<State>
): ActionReducer<State> => {
  return (state, action) => {
    if (isHydrateSuccess(action)) {
      return action.state;
    } else {
      return reducer(state, action);
    }
  };
};
