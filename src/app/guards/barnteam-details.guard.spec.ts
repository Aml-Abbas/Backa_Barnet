import { TestBed } from '@angular/core/testing';

import { BarnteamDetailsGuard } from './barnteam-details.guard';

describe('BarnteamDetailsGuard', () => {
  let guard: BarnteamDetailsGuard;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    guard = TestBed.inject(BarnteamDetailsGuard);
  });

  it('should be created', () => {
    expect(guard).toBeTruthy();
  });
});
