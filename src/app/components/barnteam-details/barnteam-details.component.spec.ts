import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BarnteamDetailsComponent } from './barnteam-details.component';

describe('BarnteamDetailsComponent', () => {
  let component: BarnteamDetailsComponent;
  let fixture: ComponentFixture<BarnteamDetailsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [BarnteamDetailsComponent]
    })
      .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(BarnteamDetailsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
