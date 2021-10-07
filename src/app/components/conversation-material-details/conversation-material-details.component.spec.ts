import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ConversationMaterialDetailsComponent } from './conversation-material-details.component';

describe('ConversationMaterialDetailsComponent', () => {
  let component: ConversationMaterialDetailsComponent;
  let fixture: ComponentFixture<ConversationMaterialDetailsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ConversationMaterialDetailsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ConversationMaterialDetailsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
