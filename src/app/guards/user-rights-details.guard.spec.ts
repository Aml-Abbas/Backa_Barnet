import { TestBed } from '@angular/core/testing';

import { UserRightsDetailsGuard } from './user-rights-details.guard';

describe('UserRightsDetailsGuard', () => {
  let guard: UserRightsDetailsGuard;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    guard = TestBed.inject(UserRightsDetailsGuard);
  });

  it('should be created', () => {
    expect(guard).toBeTruthy();
  });
});
