import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ContactGuardianComponent } from './contact-guardian.component';

describe('ContactGuardianComponent', () => {
  let component: ContactGuardianComponent;
  let fixture: ComponentFixture<ContactGuardianComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ContactGuardianComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ContactGuardianComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
