import {Component, ElementRef, EventEmitter, HostListener, Input, OnInit, Output} from "@angular/core";
import {BehaviorSubject} from "rxjs";
import $ from 'jquery';
import {Router} from "@angular/router";
import {ThemeService} from "../../../../services/theme/theme.service";
import {SidebarService} from "../sidebar/services/sidebar.service";
// import {AuthenticationService} from "../../../services/api/authentication.service";
// import {Cart} from "../../../models/cart";
// import {Client} from "../../../models/client";

@Component({
  selector: "app-navbar-blog",
  templateUrl: "./navbar.component.html",
  styleUrls: ['./navbar.component.css']
})


@HostListener('window:scroll', ['$event'])


export class NavbarComponent implements OnInit {
  @Output() onClick: EventEmitter<any> = new EventEmitter<any>();
  isDarkEnable=false;
  @Input() transparent = false;
  sidebarOpen = false;
  loginOpen = false;
  // client :Client;

  lastScrollPosition = 0;

  constructor(
    private router: Router,
    public themeService: ThemeService,
    public sidebarService: SidebarService
  ) {
  }

  ngOnInit(): void {
    this.themeService.getCurrentTheme().subscribe(theme => {
      this.isDarkEnable = theme === 'theme-dark';
    });
    this.sidebarService.getSidebarState().subscribe(sidebarOpen => {
      this.sidebarOpen = sidebarOpen;
      if(this.transparent && !this.sidebarOpen){
        $('#navbar').addClass('bg-transparent');
        $('#navbar').removeClass('bg-bgPrim');
        window.addEventListener('scroll', this.scroll, true)
      }else {
        $('#navbar').removeClass('bg-transparent');
        $('#navbar').addClass('bg-bgPrim');
      }
    });
    // this.client = this.authenticationService.currentClientValue
    // if (!this.client) {
    //   //this.router.navigate(['/auth/login']);
    // }

    if(this.transparent && !this.sidebarOpen){
      $('#navbar').addClass('bg-transparent');
      $('#navbar').removeClass('bg-bgPrim');
      window.addEventListener('scroll', this.scroll, true)
    }else {
      $('#navbar').removeClass('bg-transparent');
      $('#navbar').addClass('bg-bgPrim');
    }
        // window.addEventListener("scroll", this.detectScrollDirection);
    // window.addEventListener('scroll', this.scroll, true)

    this.animationSunMoon();

    // if(this.isDarkEnable){
    //   $('.moon_sun').click(() => {
    //
    //   });
    // }
  }

  changeTheme() {
    this.isDarkEnable = !this.isDarkEnable;
    this.themeService.changeTheme(this.isDarkEnable);
    this.animationSunMoon();
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
    this.sidebarService.toggleSidebar();
  }
  scroll = (): void => {
    if(window.scrollY <= 450){
      $('#navbar').addClass('bg-transparent');
      $('#navbar').removeClass('bg-bgPrim');
    }else {
      $('#navbar').removeClass('bg-transparent');
      $('#navbar').addClass('bg-bgPrim');
    }
    this.detectScrollDirection()
  }

  setLoginOpen() {
    this.loginOpen = !this.loginOpen;
  }

  logOut(){
    // this.authenticationService.logout();
  }
  detectScrollDirection() {
    var currentScrollPosition = window.pageYOffset || document.documentElement.scrollTop;
    var scrollDistance = document.documentElement.scrollTop;
    if(!this.sidebarOpen){
      if (currentScrollPosition > this.lastScrollPosition && scrollDistance > 450) {
        // Scroll hacia abajo

        $('#navbar').addClass('-translate-y-[60px]');
        $('#navbar').addClass('z-10');
        $('#navbar').removeClass('z-50');

        // handleScrollDown();
      } else if (currentScrollPosition < this.lastScrollPosition) {
        // Scroll hacia arriba
        // handleScrollUp();
        $('#navbar').removeClass('-translate-y-[60px]');
        $('#navbar').addClass('z-50');
        $('#navbar').removeClass('z-30');
      }
      if (currentScrollPosition < this.lastScrollPosition && scrollDistance < 480){
        $('#navbar').addClass('z-30');
        $('#navbar').removeClass('z-50');
      }
    }else{
      $('#navbar').removeClass('-translate-y-[60px]');
      $('#navbar').addClass('z-50');
      $('#navbar').removeClass('z-30');
    }

    this.lastScrollPosition = currentScrollPosition;
  }

}

