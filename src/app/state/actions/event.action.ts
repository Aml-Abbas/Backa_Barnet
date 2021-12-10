import { Action } from '@ngrx/store';

export const CREATE_EVENT = '[Event] Create Event';
export const CREATE_EVENT_SUCCESS = '[Event] Create Event Success';
export const CREATE_EVENT_FAIL = '[Event] Create Event Fail';

export const CREATE_ACTION = '[Action] Create Action';
export const CREATE_ACTION_SUCCESS = '[Action] Create Action Success';
export const CREATE_ACTION_FAIL = '[Action] Create Action Fail';

export const UPDATE_EVENT = '[Update Event] Update Event';
export const UPDATE_EVENT_SUCCESS = '[Update Event] Update Event Success';
export const UPDATE_EVENT_FAIL = '[Update Event] Update Event Fail';

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

  export class UpdateEvent implements Action {
    readonly type = UPDATE_EVENT;
    constructor(public payload: any) {}
  }
  
  export class UpdateEventSuccess implements Action {
    readonly type = UPDATE_EVENT_SUCCESS;
    constructor(public payload: any) {}
  }
  
  export class UpdateEventFail implements Action {
    readonly type = UPDATE_EVENT_FAIL;
    constructor(public payload: any) {}
  }

  export type EventAction = CreateEvent | CreateEventSuccess | CreateEventFail |
  CreateAction | CreateActionSuccess | CreateActionFail |
  UpdateEvent | UpdateEventSuccess | UpdateEventFail;

