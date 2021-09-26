import {LoginEffect} from './login.effect';
import {RouterEffect} from './router.effect';
import {CurrentPersonEffect} from './currentPerson.effect';

export const effects: any[] = [
    LoginEffect,
    RouterEffect,
    CurrentPersonEffect
  ];
  

export * from './login.effect';
export * from './router.effect';
export * from './currentPerson.effect';
