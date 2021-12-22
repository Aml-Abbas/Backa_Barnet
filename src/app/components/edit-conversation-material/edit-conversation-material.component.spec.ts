import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EditConversationMaterialComponent } from './edit-conversation-material.component';

describe('EditConversationMaterialComponent', () => {
  let component: EditConversationMaterialComponent;
  let fixture: ComponentFixture<EditConversationMaterialComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [EditConversationMaterialComponent]
    })
      .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EditConversationMaterialComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
