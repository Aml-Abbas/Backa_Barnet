import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CreateDiscoverCardDialogComponent } from './create-discover-card-dialog.component';

describe('CreateDiscoverCardDialogComponent', () => {
  let component: CreateDiscoverCardDialogComponent;
  let fixture: ComponentFixture<CreateDiscoverCardDialogComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CreateDiscoverCardDialogComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CreateDiscoverCardDialogComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
