import { Component, Input, OnInit } from '@angular/core';
import { Title } from '@angular/platform-browser';
import { ActivatedRoute } from '@angular/router';
import { Router } from '@angular/router';

@Component({
  selector: 'app-recherche',
  templateUrl: './recherche.component.html',
  styleUrls: ['./recherche.component.css']
})
export class RechercheComponent implements OnInit {

  public textRecherche = "";

  @Input()
  set recherche(recherche: string) {
    this.textRecherche = recherche;
    if(recherche != "")
      this.titleService.setTitle("Recherche \""+recherche+"\" - Lecoincoin" );
    else
      this.titleService.setTitle("Lecoincoin");
  }

  constructor(private route: ActivatedRoute,
    private router: Router,
    private titleService: Title) { }

  ngOnInit(): void {
  }


  doRecherche(){
    if(this.textRecherche != "")
      this.router.navigate(['/annonces'], { queryParams: { recherche: this.textRecherche } });
    else
    this.router.navigate(['/annonces']);
  }

}
