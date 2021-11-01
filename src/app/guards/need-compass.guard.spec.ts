import { TestBed } from '@angular/core/testing';

import { NeedCompassGuard } from './need-compass.guard';

describe('NeedCompassGuard', () => {
  let guard: NeedCompassGuard;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    guard = TestBed.inject(NeedCompassGuard);
  });

  it('should be created', () => {
    expect(guard).toBeTruthy();
  });
});
