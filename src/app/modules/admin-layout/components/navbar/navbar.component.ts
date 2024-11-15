import {Component, ElementRef, EventEmitter, HostListener, Input, OnInit, Output} from "@angular/core";
import {BehaviorSubject} from "rxjs";
import $ from 'jquery';
import {Router} from "@angular/router";
import {ThemeService} from "../../../../services/theme/theme.service";
import {SidebarService} from "../../services/sidebar.service";

import {User} from "../../../../models/user";
import {AuthenticationService} from "../../../../services/api/authentication.service";
import {AuthenticationAdminService} from "../../../../services/api/authentication-admin.service";
// import {AuthenticationService} from "../../../services/api/authentication.service";
// import {Cart} from "../../../models/cart";
// import {Client} from "../../../models/client";

@Component({
  selector: "app-navbar",
  templateUrl: "./navbar.component.html",
})

@HostListener('window:scroll', ['$event'])

export class NavbarComponent implements OnInit {
  @Output() onClick: EventEmitter<any> = new EventEmitter<any>();
  isDarkEnable=false;
  @Input() transparent = false;
  sidebarOpen = false;

  loginOpen = false;
  client!:User;
  dark!:boolean;
  constructor(
    private router: Router,
    public themeService: ThemeService,
    public sidebarService: SidebarService,
    public authenticationAdminService: AuthenticationAdminService
  ) {
  }

  ngOnInit(): void {
    this.themeService.getCurrentTheme().subscribe(theme => {
      this.isDarkEnable = theme === 'theme-dark';
    });
    this.dark=this.isDarkEnable

    this.sidebarService.getSidebarState().subscribe(sidebarOpen => {
      this.sidebarOpen = sidebarOpen;
    });
    this.client = this.authenticationAdminService.currentUserValue
    if (!this.client) {
      //this.router.navigate(['/auth/login']);
    }

  
  }

  changeTheme() {
    this.isDarkEnable = !this.isDarkEnable;
    this.animationSunMoon();
    this.themeService.changeTheme(this.isDarkEnable);
  }
  
    animationSunMoon(){
    if(!this.isDarkEnable){
      $('.moon_sun').css("fill", "hsl(var(--twc-textPrimary))");
      $('.moon_sun g circle').css("transform", "scale(1)");
      // $('.moon_sun').css("transform", "rotate(-20deg)");
      setTimeout(function() {
        $('.moon_sun').css("transform", "rotate(90deg)");
        $('#moon-mask-main-nav circle').attr('r', '8');
      }, 500);
      $('#moon-mask-main-nav circle').attr('cx', '25');
      $('#moon-mask-main-nav circle').attr('cy', '0');
      $('#moon-mask-main-nav circle').attr('r', '8');
      $('.moon_sun circle').css("background", "green");
      $('.moon_sun > circle').attr("r", "5");
    }else{
      $('.moon_sun').css("fill", "hsl(var(--twc-textPrimary))");
      $('.moon_sun g circle').css("transform", "scale(0)");
      $('.moon_sun').css("transform", "rotate(90deg)");
      $('#moon-mask-main-nav circle').attr('cx', '10');
      $('#moon-mask-main-nav circle').attr('cy', '2');
      $('#moon-mask-main-nav circle').attr('r', '7');
      $('.moon_sun > circle').attr("r", "8");
      $('.moon_sun').css("transform", "rotate(100deg)");
      setTimeout(function() {
        $('.moon_sun').css("transform", "rotate(50deg)");
      }, 500);
    }
  }
  toggleSidebar() {
    console.log('eeee')
    this.sidebarService.toggleSidebar();
  }

  setLoginOpen() {
    this.loginOpen = !this.loginOpen;
  }

  logOut(){
    this.authenticationAdminService.logout();
  }
}

