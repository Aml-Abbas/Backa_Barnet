import { TestBed } from '@angular/core/testing';

import { DiscoverCardEditGuard } from './discover-card-edit.guard';

describe('DiscoverCardEditGuard', () => {
  let guard: DiscoverCardEditGuard;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    guard = TestBed.inject(DiscoverCardEditGuard);
  });

  it('should be created', () => {
    expect(guard).toBeTruthy();
  });
});
