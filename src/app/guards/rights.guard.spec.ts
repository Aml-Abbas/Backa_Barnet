import { TestBed } from '@angular/core/testing';

import { RightsGuard } from './rights.guard';

describe('RightsGuard', () => {
  let guard: RightsGuard;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    guard = TestBed.inject(RightsGuard);
  });

  it('should be created', () => {
    expect(guard).toBeTruthy();
  });
});
