import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { DetailAnnonceViewerComponent } from './detail-annonce-viewer.component';

describe('DetailAnnonceViewerComponent', () => {
  let component: DetailAnnonceViewerComponent;
  let fixture: ComponentFixture<DetailAnnonceViewerComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ DetailAnnonceViewerComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DetailAnnonceViewerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
