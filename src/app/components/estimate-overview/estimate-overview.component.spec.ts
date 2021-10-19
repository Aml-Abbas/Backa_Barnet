import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EstimateOverviewComponent } from './estimate-overview.component';

describe('EstimateOverviewComponent', () => {
  let component: EstimateOverviewComponent;
  let fixture: ComponentFixture<EstimateOverviewComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EstimateOverviewComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EstimateOverviewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
