import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NeedCompassComponent } from './need-compass.component';

describe('NeedCompassComponent', () => {
  let component: NeedCompassComponent;
  let fixture: ComponentFixture<NeedCompassComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [NeedCompassComponent]
    })
      .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(NeedCompassComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
