import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EditDiscoverCardComponent } from './edit-discover-card.component';

describe('EditDiscoverCardComponent', () => {
  let component: EditDiscoverCardComponent;
  let fixture: ComponentFixture<EditDiscoverCardComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [EditDiscoverCardComponent]
    })
      .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EditDiscoverCardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
