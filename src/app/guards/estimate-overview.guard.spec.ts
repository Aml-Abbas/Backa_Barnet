import { TestBed } from '@angular/core/testing';

import { EstimateOverviewGuard } from './estimate-overview.guard';

describe('EstimateOverviewGuard', () => {
  let guard: EstimateOverviewGuard;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    guard = TestBed.inject(EstimateOverviewGuard);
  });

  it('should be created', () => {
    expect(guard).toBeTruthy();
  });
});
