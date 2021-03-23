import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';

import { HttpClientModule } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { AnnonceViewerComponent } from './annonce-viewer/annonce-viewer.component';
import { DetailAnnonceViewerComponent } from './detail-annonce-viewer/detail-annonce-viewer.component';
import { HomeComponent } from './home/home.component';
import { LoginComponent } from './login/login.component';
import { RechercheComponent } from './recherche/recherche.component';

@NgModule({
  declarations: [
    AppComponent,
    AnnonceViewerComponent,
    DetailAnnonceViewerComponent,
    HomeComponent,
    LoginComponent,
    RechercheComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    NgbModule,
    HttpClientModule,
    FormsModule,
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
