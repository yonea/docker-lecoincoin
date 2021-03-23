import { Component, OnInit } from '@angular/core';
import { RestService } from "../rest.service";

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  constructor(public restApi: RestService,) { }

  ngOnInit(): void {
  }


}
