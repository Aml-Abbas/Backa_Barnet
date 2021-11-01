import { TestBed } from '@angular/core/testing';

import { CreateEventGuard } from './create-event.guard';

describe('CreateEventGuard', () => {
  let guard: CreateEventGuard;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    guard = TestBed.inject(CreateEventGuard);
  });

  it('should be created', () => {
    expect(guard).toBeTruthy();
  });
});
