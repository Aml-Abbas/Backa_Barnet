import {LoginEffect} from './login.effect';
import {RouterEffect} from './router.effect';
import {CurrentPersonEffect} from './currentPerson.effect';
import {HydrationEffect} from './hydration.effect';
import {CurrentUserEffect} from './currentUser.effect';
import {DiscoverCardEffect} from './discoverCard.effect';

export const effects: any[] = [
    LoginEffect,
    RouterEffect,
    CurrentPersonEffect,
    HydrationEffect,
    CurrentUserEffect,
    DiscoverCardEffect
  ];
  

export * from './login.effect';
export * from './router.effect';
export * from './currentPerson.effect';
export * from './hydration.effect';
export * from './currentUser.effect';
export * from './discoverCard.effect';
