import { TestBed } from '@angular/core/testing';

import { EditGuardianGuard } from './edit-guardian.guard';

describe('EditGuardianGuard', () => {
  let guard: EditGuardianGuard;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    guard = TestBed.inject(EditGuardianGuard);
  });

  it('should be created', () => {
    expect(guard).toBeTruthy();
  });
});
