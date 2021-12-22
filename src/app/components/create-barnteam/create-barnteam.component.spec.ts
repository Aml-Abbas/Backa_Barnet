import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CreateBarnteamComponent } from './create-barnteam.component';

describe('CreateBarnteamComponent', () => {
  let component: CreateBarnteamComponent;
  let fixture: ComponentFixture<CreateBarnteamComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [CreateBarnteamComponent]
    })
      .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CreateBarnteamComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
