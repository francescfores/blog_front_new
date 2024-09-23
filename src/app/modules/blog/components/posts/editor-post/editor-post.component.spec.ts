import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EditorPostComponent } from './editor-post.component';

describe('EditorPostComponent', () => {
  let component: EditorPostComponent;
  let fixture: ComponentFixture<EditorPostComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EditorPostComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(EditorPostComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
