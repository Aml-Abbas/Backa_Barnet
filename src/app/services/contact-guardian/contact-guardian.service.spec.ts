import { TestBed } from '@angular/core/testing';

import { ContactGuardianService } from './contact-guardian.service';

describe('ContactGuardianService', () => {
  let service: ContactGuardianService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ContactGuardianService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
