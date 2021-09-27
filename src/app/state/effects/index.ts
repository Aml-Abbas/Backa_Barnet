import {LoginEffect} from './login.effect';
import {RouterEffect} from './router.effect';
import {CurrentPersonEffect} from './currentPerson.effect';
import {HydrationEffect} from './hydration.effect';

export const effects: any[] = [
    LoginEffect,
    RouterEffect,
    CurrentPersonEffect,
    HydrationEffect
  ];
  

export * from './login.effect';
export * from './router.effect';
export * from './currentPerson.effect';
export * from './hydration.effect';
