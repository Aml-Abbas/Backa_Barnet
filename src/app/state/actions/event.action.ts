import { Action } from '@ngrx/store';

export const CREATE_EVENT = '[Event] Create Event';
export const CREATE_EVENT_SUCCESS = '[Event] Create Event Success';
export const CREATE_EVENT_FAIL = '[Event] Create Event Fail';

export const CREATE_ACTION = '[Action] Create Action';
export const CREATE_ACTION_SUCCESS = '[Action] Create Action Success';
export const CREATE_ACTION_FAIL = '[Action] Create Action Fail';


export class CreateEvent implements Action {
    readonly type = CREATE_EVENT;
    constructor(public payload: any) {}
  }
  
  export class CreateEventSuccess implements Action {
    readonly type = CREATE_EVENT_SUCCESS;
    constructor(public payload: any) {}
  }
  
  export class CreateEventFail implements Action {
    readonly type = CREATE_EVENT_FAIL;
    constructor(public payload: any) {}
  }

  export class CreateAction implements Action {
    readonly type = CREATE_ACTION;
    constructor(public payload: any) {}
  }
  
  export class CreateActionSuccess implements Action {
    readonly type = CREATE_ACTION_SUCCESS;
    constructor(public payload: any) {}
  }
  
  export class CreateActionFail implements Action {
    readonly type = CREATE_ACTION_FAIL;
    constructor(public payload: any) {}
  }

  export type EventAction = CreateEvent | CreateEventSuccess | CreateEventFail |
  CreateAction | CreateActionSuccess | CreateActionFail;
