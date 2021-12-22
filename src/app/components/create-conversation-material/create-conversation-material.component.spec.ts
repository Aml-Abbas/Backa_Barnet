import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CreateConversationMaterialComponent } from './create-conversation-material.component';

describe('CreateConversationMaterialComponent', () => {
  let component: CreateConversationMaterialComponent;
  let fixture: ComponentFixture<CreateConversationMaterialComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [CreateConversationMaterialComponent]
    })
      .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CreateConversationMaterialComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
