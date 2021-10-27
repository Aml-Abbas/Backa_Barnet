import { TestBed } from '@angular/core/testing';

import { ConversationMaterialGuard } from './conversation-material.guard';

describe('ConversationMaterialGuard', () => {
  let guard: ConversationMaterialGuard;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    guard = TestBed.inject(ConversationMaterialGuard);
  });

  it('should be created', () => {
    expect(guard).toBeTruthy();
  });
});
