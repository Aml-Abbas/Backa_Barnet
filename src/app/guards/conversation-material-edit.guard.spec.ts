import { TestBed } from '@angular/core/testing';

import { ConversationMaterialEditGuard } from './conversation-material-edit.guard';

describe('ConversationMaterialEditGuard', () => {
  let guard: ConversationMaterialEditGuard;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    guard = TestBed.inject(ConversationMaterialEditGuard);
  });

  it('should be created', () => {
    expect(guard).toBeTruthy();
  });
});
