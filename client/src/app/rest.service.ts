import { Injectable } from '@angular/core';

import { HttpClient, HttpHeaders, HttpResponse } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class RestService {

  public username = "";
  public password = "";

  public waiterConnect = false;

  constructor(private http: HttpClient,) {
    let _logged = sessionStorage.getItem('logged')
    if (_logged != null) {
      this.logged = JSON.parse(_logged);
    }
  }

  public apiURL = "http://135.125.106.207:5432/"

  public logged = null;

  public getOpt(method) {
    let httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json",
        "Accept": "application/json"
      }),
      method: method
    };
  }
  disconnect() {
    this.logged = null;
    sessionStorage.removeItem('logged');
  }
  createUser(){
    console.log(this.username + this.password);
    this.waiterConnect = true;
    new Promise((resolve, reject) => {
      this.http.post(this.apiURL + "api/utilisateurs", JSON.stringify({ username: this.username, password: this.password }), {
        headers: new HttpHeaders({
          "Content-Type": "application/json",
          "Accept": "application/json"
        })
      }).toPromise().then(resolve, reject)
    }).then(success => {
      this.waiterConnect = false;
      console.log(success);
      alert("L'utilisateur " + this.username + " a bien été créé.")
    }).catch(error => {
      this.waiterConnect = false;
      console.log(error)
      switch(error.status){
        case 409:
          alert("Utilisateur déja existant.")
          break
        default:
          alert("Erreur lors de la création.")
      }
    });
  }

  connect() {
    console.log(this.username + this.password);
    this.waiterConnect = true;
    new Promise((resolve, reject) => {
      this.http.post(this.apiURL + "api/login", JSON.stringify({ username: this.username, password: this.password }), {
        headers: new HttpHeaders({
          "Content-Type": "application/json",
          "Accept": "application/json"
        })
      }).toPromise().then(resolve, reject)
    }).then(success => {
      this.waiterConnect = false;
      this.logged = success;
      sessionStorage.setItem('logged', JSON.stringify(success));
      console.log(success);
    }).catch(error => {
      this.waiterConnect = false;
      alert("Erreur " + error)
    });
  }
  getAnnonce(itemperpage, page, search=""): Promise<any> {
    let url = this.apiURL + "api/annonces?"+"offset="+(page-1)*itemperpage+"&max="+itemperpage;
    if(search != ""){
      url += "&q="+search
    }
    return new Promise((resolve, reject) => {
      this.http.get(url, {
        headers: new HttpHeaders({
          "Content-Type": "application/json",
          "Accept": "application/json"
        })
      }).toPromise().then(resolve, reject)
    });
  }
  getDetailAnnonce(id): Promise<any> {
    return new Promise((resolve, reject) => {
      this.http.get(this.apiURL + "api/annonces?id=" + id, {
        headers: new HttpHeaders({
          "Content-Type": "application/json",
          "Accept": "application/json"
        })
      }).toPromise().then(resolve, reject)
    });
  }
}
