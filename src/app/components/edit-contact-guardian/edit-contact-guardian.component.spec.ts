import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EditContactGuardianComponent } from './edit-contact-guardian.component';

describe('EditContactGuardianComponent', () => {
  let component: EditContactGuardianComponent;
  let fixture: ComponentFixture<EditContactGuardianComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EditContactGuardianComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EditContactGuardianComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
