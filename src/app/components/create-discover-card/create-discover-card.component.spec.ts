import { ComponentFixture, TestBed } from '@angular/core/testing';
import { CreateDiscoverCardComponent } from './create-discover-card.component';

describe('CreateDiscoverCardComponent', () => {
  let component: CreateDiscoverCardComponent;
  let fixture: ComponentFixture<CreateDiscoverCardComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [CreateDiscoverCardComponent]
    })
      .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CreateDiscoverCardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
