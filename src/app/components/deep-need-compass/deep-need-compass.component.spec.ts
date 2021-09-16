import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DeepNeedCompassComponent } from './deep-need-compass.component';

describe('DeepNeedCompassComponent', () => {
  let component: DeepNeedCompassComponent;
  let fixture: ComponentFixture<DeepNeedCompassComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DeepNeedCompassComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DeepNeedCompassComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
