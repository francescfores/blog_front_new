import {Component, Input, OnInit} from "@angular/core";
import {SidebarService} from "../../services/sidebar.service";
import {ThemeService} from "../../../../services/theme/theme.service";
import {AuthenticationAdminService} from "../../../../services/api/authentication-admin.service";
import {User} from "../../../../models/user";

@Component({
  selector: "app-sidebar",
  templateUrl: "./sidebar.component.html",
  styleUrls: ['./sidebar.component.css']
})
export class SidebarComponent implements OnInit {
  sidebarOpen= false;
  isDarkEnable=false;
  loginOpen = false;
  audio = new Audio('assets/sounds/mixkit-mouse-click-close-1113.wav');
  audio2 = new Audio('assets/sounds/mixkit-hard-pop-click-2364.wav');
  dark!:boolean;
  client!:User;

  constructor(
    public sidebarService: SidebarService,
    public themeService: ThemeService,
    public authenticationAdminService: AuthenticationAdminService

  ) {
    this.sidebarOpen= false;
  }

  ngOnInit() {
        this.client = this.authenticationAdminService.currentUserValue
    
    this.sidebarService.getSidebarState().subscribe(sidebarOpen => {
      this.sidebarOpen = sidebarOpen;
    });
    this.themeService.getCurrentTheme().subscribe(theme => {
      this.isDarkEnable = theme === 'theme-dark';
    });
    this.dark=this.isDarkEnable

  }

  toggleSidebar() {
    this.sidebarService.toggleSidebar();
  }

  changeTheme() {
    this.audio.load();
    this.audio.play();
    this.isDarkEnable = !this.isDarkEnable;
    this.animationSunMoon();
    this.themeService.changeTheme(this.isDarkEnable);
  }
  setLoginOpen() {
    this.loginOpen = !this.loginOpen;
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

  logOut(){
    this.authenticationAdminService.logout();
  }

}
