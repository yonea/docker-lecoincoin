import { Component, OnInit } from '@angular/core';
import { Title } from '@angular/platform-browser';

import { Router, ActivatedRoute, ParamMap } from '@angular/router';
import { RestService } from "../rest.service";

@Component({
  selector: 'app-detail-annonce-viewer',
  templateUrl: './detail-annonce-viewer.component.html',
  styleUrls: ['./detail-annonce-viewer.component.css']
})
export class DetailAnnonceViewerComponent implements OnInit {

  public annonce: any = {};
  public id = null;
  constructor(private route: ActivatedRoute,
    public restApi: RestService,
    private titleService: Title) { }

  ngOnInit(): void {
    console.log(this.route)
    this.id = parseInt(this.route.snapshot.params.id)
    this.restApi.getDetailAnnonce(this.id).then(success => {
      this.annonce = success;
      this.titleService.setTitle(""+success.title+" - Lecoincoin" );
    }).catch(error => {
      alert("Erreur " + error)
    });
  }

}
