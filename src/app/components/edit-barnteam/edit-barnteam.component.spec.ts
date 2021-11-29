import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EditBarnteamComponent } from './edit-barnteam.component';

describe('EditBarnteamComponent', () => {
  let component: EditBarnteamComponent;
  let fixture: ComponentFixture<EditBarnteamComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EditBarnteamComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EditBarnteamComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
