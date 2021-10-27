import { TestBed } from '@angular/core/testing';

import { ConversationMaterialDetailsGuard } from './conversation-material-details.guard';

describe('ConversationMaterialDetailsGuard', () => {
  let guard: ConversationMaterialDetailsGuard;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    guard = TestBed.inject(ConversationMaterialDetailsGuard);
  });

  it('should be created', () => {
    expect(guard).toBeTruthy();
  });
});
