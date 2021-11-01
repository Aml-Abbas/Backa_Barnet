import { TestBed } from '@angular/core/testing';

import { GoalGuard } from './goal.guard';

describe('GoalGuard', () => {
  let guard: GoalGuard;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    guard = TestBed.inject(GoalGuard);
  });

  it('should be created', () => {
    expect(guard).toBeTruthy();
  });
});
