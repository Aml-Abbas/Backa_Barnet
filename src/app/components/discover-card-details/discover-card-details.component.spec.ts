import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DiscoverCardDetailsComponent } from './discover-card-details.component';

describe('DiscoverCardDetailsComponent', () => {
  let component: DiscoverCardDetailsComponent;
  let fixture: ComponentFixture<DiscoverCardDetailsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [DiscoverCardDetailsComponent]
    })
      .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DiscoverCardDetailsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
