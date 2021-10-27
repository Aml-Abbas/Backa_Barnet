import { TestBed } from '@angular/core/testing';

import { DiscoverCardDetailsGuard } from './discover-card-details.guard';

describe('DiscoverCardDetailsGuard', () => {
  let guard: DiscoverCardDetailsGuard;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    guard = TestBed.inject(DiscoverCardDetailsGuard);
  });

  it('should be created', () => {
    expect(guard).toBeTruthy();
  });
});
