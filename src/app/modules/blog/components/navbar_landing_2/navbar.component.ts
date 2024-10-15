import {Component, ElementRef, EventEmitter, HostListener, Input, OnInit, Output} from "@angular/core";
import {BehaviorSubject} from "rxjs";
import $ from "jquery";
import {Router} from "@angular/router";
import {SidebarService} from "../sidebar/services/sidebar.service";
// import {AuthenticationService} from "../../../services/api/authentication.service";
// import {Cart} from "../../../models/cart";
// import {Client} from "../../../models/client";

@Component({
  selector: "app-navbar_landing_2",
  templateUrl: "./navbar.component.html",
})

@HostListener('window:scroll', ['$event'])


export class NavbarLanding2Component implements OnInit {
  @Output() onClick: EventEmitter<any> = new EventEmitter<any>();
  isDarkEnable=false;
  sidebarOpen = false;
  loginOpen = false;
  // client :Client;

  lastScrollPosition = 0;

  constructor(
    private router: Router,
    public sidebarService: SidebarService
  ) {
  }

  ngOnInit(): void {
    this.sidebarService.getSidebarState().subscribe(sidebarOpen => {
      this.sidebarOpen = sidebarOpen;
    });
    window.addEventListener("scroll", this.detectScrollDirection);

  }

  changeTheme() {
    this.isDarkEnable = !this.isDarkEnable;
  }
  toggleSidebar() {
    this.sidebarService.toggleSidebar();
  }

  setLoginOpen() {
    this.loginOpen = !this.loginOpen;
  }

  logOut(){
    // this.authenticationService.logout();
  }
  detectScrollDirection() {
    var currentScrollPosition = window.pageYOffset || document.documentElement.scrollTop;
    var scrollDistance = currentScrollPosition - this.lastScrollPosition;
    if (currentScrollPosition > this.lastScrollPosition ) {
      console.log(scrollDistance)
      // Scroll hacia abajo
      console.log('abajo');
      $('#navbar2').addClass('-translate-y-[53px]');
      // handleScrollDown();
    } else if (currentScrollPosition < this.lastScrollPosition) {
      // Scroll hacia arriba
      // handleScrollUp();
      $('#navbar2').removeClass('-translate-y-[53px]');

      console.log('arriba')
    }
    this.lastScrollPosition = currentScrollPosition;
  }

}

