import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BarnteamComponent } from './barnteam.component';

describe('BarnteamComponent', () => {
  let component: BarnteamComponent;
  let fixture: ComponentFixture<BarnteamComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [BarnteamComponent]
    })
      .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(BarnteamComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
