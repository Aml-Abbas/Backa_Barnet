import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ConversationMaterialComponent } from './conversation-material.component';

describe('ConversationMaterialComponent', () => {
  let component: ConversationMaterialComponent;
  let fixture: ComponentFixture<ConversationMaterialComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ConversationMaterialComponent]
    })
      .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ConversationMaterialComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
