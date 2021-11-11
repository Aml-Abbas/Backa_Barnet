import {LoginEffect} from './login.effect';
import {RouterEffect} from './router.effect';
import {CurrentPersonEffect} from './currentPerson.effect';
import {HydrationEffect} from './hydration.effect';
import {PersonsEffect} from './persons.effect';
import {DiscoverCardEffect} from './discoverCard.effect';
import {CurrentCardEffect} from './currentCard.effect';

export const effects: any[] = [
    LoginEffect,
    RouterEffect,
    CurrentPersonEffect,
    HydrationEffect,
    PersonsEffect,
    DiscoverCardEffect,
    CurrentCardEffect
  ];
  

export * from './login.effect';
export * from './router.effect';
export * from './currentPerson.effect';
export * from './hydration.effect';
export * from './persons.effect';
export * from './discoverCard.effect';
export * from './currentCard.effect';
