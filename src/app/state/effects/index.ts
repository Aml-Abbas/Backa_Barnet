import {LoginEffect} from './login.effect';
import {RouterEffect} from './router.effect';
import {CurrentPersonEffect} from './currentPerson.effect';
import {HydrationEffect} from './hydration.effect';
import {PersonsEffect} from './persons.effect';
import {DiscoverCardEffect} from './discoverCard.effect';
import {CurrentCardEffect} from './currentCard.effect';
import {ConversationMaterialEffect} from './conversationMaterial.effect';
import {EstimateEffect} from './estimate.effect';
import {EventEffect} from './event.effect';
import {AdminEffect} from './admin.effect';

export const effects: any[] = [
    LoginEffect,
    RouterEffect,
    CurrentPersonEffect,
    HydrationEffect,
    PersonsEffect,
    DiscoverCardEffect,
    CurrentCardEffect,
    ConversationMaterialEffect,
    EstimateEffect,
    EventEffect,
    AdminEffect
  ];
  

export * from './login.effect';
export * from './router.effect';
export * from './currentPerson.effect';
export * from './hydration.effect';
export * from './persons.effect';
export * from './discoverCard.effect';
export * from './currentCard.effect';
export * from './conversationMaterial.effect';
export * from './estimate.effect';
export * from './event.effect';
export * from './admin.effect';
