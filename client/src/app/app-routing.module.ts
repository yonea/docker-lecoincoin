import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AnnonceViewerComponent } from './annonce-viewer/annonce-viewer.component';
import { DetailAnnonceViewerComponent } from './detail-annonce-viewer/detail-annonce-viewer.component';
import { HomeComponent } from './home/home.component';

const routes: Routes = [
  { path: 'annonces', component: AnnonceViewerComponent },
  { path: 'annonces/:id', component: DetailAnnonceViewerComponent },
  { path: '', pathMatch: 'full', component: HomeComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
