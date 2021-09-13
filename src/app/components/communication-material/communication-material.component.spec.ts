import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CommunicationMaterialComponent } from './communication-material.component';

describe('CommunicationMaterialComponent', () => {
  let component: CommunicationMaterialComponent;
  let fixture: ComponentFixture<CommunicationMaterialComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CommunicationMaterialComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CommunicationMaterialComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
