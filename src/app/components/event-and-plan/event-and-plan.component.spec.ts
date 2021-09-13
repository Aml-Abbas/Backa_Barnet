import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EventAndPlanComponent } from './event-and-plan.component';

describe('EventAndPlanComponent', () => {
  let component: EventAndPlanComponent;
  let fixture: ComponentFixture<EventAndPlanComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EventAndPlanComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EventAndPlanComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
