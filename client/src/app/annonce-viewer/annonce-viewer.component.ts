import { Component, OnInit } from '@angular/core';

import { HttpClient, HttpHeaders, HttpResponse } from '@angular/common/http';
import { RestService } from "../rest.service";

import { switchMap } from "rxjs/operators";


import { ActivatedRoute } from "@angular/router";

@Component({
  selector: 'app-annonce-viewer',
  templateUrl: './annonce-viewer.component.html',
  styleUrls: ['./annonce-viewer.component.css']
})
export class AnnonceViewerComponent implements OnInit {

  public textRecherche = "";
  public searching = false;

  constructor(public restApi: RestService,
    private route: ActivatedRoute) { }


  // public annonces = [
  //   {
  //     titre: "Annonces 1",
  //     descShort : "azerty",
  //     descLong : "azertyuiop"
  //   },
  //   {
  //     titre: "Annonces 2",
  //     descShort : "azerty",
  //     descLong : "azertyuiop"
  //   },
  //   {
  //     titre: "Annonces 3",
  //     descShort : "azerty",
  //     descLong : "azertyuiop"
  //   },
  //   {
  //     titre: "Annonces 4",
  //     descShort : "azerty",
  //     descLong : "azertyuiop"
  //   },
  // ]
  public annonces: any = []
  public countAnnonces: any = 0
  public itemPerPage = 10
  public page = 1

  ngOnInit(): void {
    this.page=1;
    this.route.queryParams
      .subscribe(params => {
        console.log(params); // { order: "popular" }
        if (params.hasOwnProperty('recherche')) {
          this.textRecherche = params.recherche;
        }
        else{
          this.textRecherche = "";
        }
        this.searching = true;
        this.page=1;
        this.restApi.getAnnonce(this.itemPerPage, this.page, this.textRecherche).then(success => {
          this.annonces = success.data;
          this.countAnnonces = success.count;
          this.searching = false;
        }).catch(error => {
          this.searching = false;
          alert("Erreur " + error)
        });
      }
      );
  }
  pageChanged() {
    window.scroll(0,0);
    this.searching = true;
    
    this.restApi.getAnnonce(this.itemPerPage, this.page, this.textRecherche).then(success => {
      this.annonces = success.data;
      this.countAnnonces = success.count;
      this.searching = false;
    }).catch(error => {
      this.searching = false;
      alert("Erreur " + error)
    });
  }

}
