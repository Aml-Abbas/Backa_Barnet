import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UserRightsDetailsComponent } from './user-rights-details.component';

describe('UserRightsDetailsComponent', () => {
  let component: UserRightsDetailsComponent;
  let fixture: ComponentFixture<UserRightsDetailsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UserRightsDetailsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UserRightsDetailsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
