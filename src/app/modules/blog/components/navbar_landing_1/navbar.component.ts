import {Component, ElementRef, EventEmitter, HostListener, Input, OnInit, Output} from "@angular/core";
import {BehaviorSubject} from "rxjs";
import $ from "jquery";
import {Router} from "@angular/router";

// import {AuthenticationService} from "../../../services/api/authentication.service";
// import {Cart} from "../../../models/cart";
// import {Client} from "../../../models/client";

@Component({
  selector: "app-navbar_landing_1",
  templateUrl: "./navbar.component.html",
})

@HostListener('window:scroll', ['$event'])

export class NavbarLanding1Component implements OnInit {
  @Output() onClick: EventEmitter<any> = new EventEmitter<any>();
  isDarkEnable=false;
  @Input() transparent = false;
  sidebarOpen = false;

  loginOpen = false;
  // client :Client;

  constructor(
    private router: Router,
  ) {
  }

  ngOnInit(): void {

    $('#navbar').removeClass('bg-transparent');
    $('#navbar').addClass('bg-bgPrim');

    if(this.transparent){
      $('#navbar').addClass('bg-transparent');
      $('#navbar').removeClass('bg-bgPrim');
      window.addEventListener('scroll', this.scroll, true)
    }
  }

  changeTheme() {
    this.isDarkEnable = !this.isDarkEnable;
  }

  scroll = (): void => {
    if(window.scrollY <= 50){
      $('#navbar').addClass('bg-transparent');
      $('#navbar').removeClass('bg-primary');
    }else {
      $('#navbar').removeClass('bg-transparent');
      $('#navbar').addClass('bg-primary');
    }

  }

  setLoginOpen() {
    this.loginOpen = !this.loginOpen;
  }

  logOut(){
    // this.authenticationService.logout();
  }
}
