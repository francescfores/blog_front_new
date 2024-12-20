import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ComponentRenderComponent } from './component-render.component';

describe('ComponentRenderComponent', () => {
  let component: ComponentRenderComponent;
  let fixture: ComponentFixture<ComponentRenderComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ComponentRenderComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ComponentRenderComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
