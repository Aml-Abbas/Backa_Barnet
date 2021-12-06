import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CreateInsatsComponent } from './create-insats.component';

describe('CreateInsatsComponent', () => {
  let component: CreateInsatsComponent;
  let fixture: ComponentFixture<CreateInsatsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CreateInsatsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CreateInsatsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
