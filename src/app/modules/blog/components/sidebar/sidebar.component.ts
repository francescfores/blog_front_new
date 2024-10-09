import {Component, Input, OnInit, HostListener} from "@angular/core";
import {SidebarService} from"./services/sidebar.service";
import {MenuItem} from "./models/menu-item";
import {ThemeService} from "../../../../services/theme/theme.service";

@Component({
  selector: "app-sidebar-blog",
  templateUrl: "./sidebar.component.html",
  styleUrls: ['./sidebar.component.css']
})
export class SidebarComponent implements OnInit {
  sidebarOpen= false;
  isDarkEnable=false;
  loginOpen = false;
  @Input() transparent = false;

  
  lastScrollPosition = 0;

  constructor(
    public sidebarService: SidebarService,
    public themeService: ThemeService,

  ) {
    this.sidebarOpen= false;
  }

  ngOnInit() {
    this.transparent=true;
    this.sidebarService.getSidebarState().subscribe(sidebarOpen => {
      this.sidebarOpen = sidebarOpen;
    });
    this.themeService.getCurrentTheme().subscribe(theme => {
      this.isDarkEnable = theme === 'theme-dark';
    });
    if(this.transparent && !this.sidebarOpen){
      $('#navbar').addClass('bg-transparent');
      $('#navbar').removeClass('bg-bgPrim');
      window.addEventListener('scroll', this.scroll, true)
    }else {
      $('#navbar').removeClass('bg-transparent');
      $('#navbar').addClass('bg-bgPrim');
    }
  }

  toggleSidebar() {
    this.sidebarService.toggleSidebar();
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

  setLoginOpen() {
    this.loginOpen = !this.loginOpen;
  }

  logOut(){
    // this.authenticationService.logout();
  }

  @HostListener('window:scroll', ['$event'])
  onWindowScroll(event: Event): void {
      // Código para manejar el scroll
     
    /*   if(window.scrollY >= 400 && window.scrollY <= 500 ){
        $('#navbar').addClass('z-30');
        $('#navbar').removeClass('z-50');
      }else{
        $('#navbar').removeClass('z-30');
        $('#navbar').addClass('z-50');
      } */
  
      this.detectScrollDirection()
  }

  scroll = (): void => {
    
  }
  detectScrollDirection() {
    var currentScrollPosition = window.pageYOffset || document.documentElement.scrollTop;
    console.log(currentScrollPosition > this.lastScrollPosition)
    console.log(currentScrollPosition < this.lastScrollPosition)

    /* if(window.scrollY <= 480){
      $('#navbar').addClass('bg-transparent');
      $('#navbar').removeClass('bg-bgPrim');
      $('#navbar').addClass('z-30');
      $('#navbar').removeClass('z-50');     
    }else {
      $('#navbar').removeClass('bg-transparent');
      $('#navbar').addClass('bg-bgPrim');

      $('#navbar').removeClass('z-30');
      $('#navbar').addClass('z-50');
    }  */

    var scrollDistance = document.documentElement.scrollTop;
    /* if(!this.sidebarOpen){ */

    if(scrollDistance < 0){
       $('#navbar').addClass('bg-transparent');
       $('#navbar').removeClass('bg-bgSeco/90');

      $('#navbar').removeClass('-translate-y-[60px]');
        $('#navbar').addClass('z-30');
        $('#navbar').removeClass('z-50');
    }
      if (currentScrollPosition > this.lastScrollPosition && scrollDistance > 0) {
        // Scroll hacia abajo
        $('#navbar').addClass('-translate-y-16');
          $('#navbar').addClass('z-30');
         $('#navbar').removeClass('z-50');
      } 
      
      if (currentScrollPosition < this.lastScrollPosition && scrollDistance > 0) {
        // Scroll hacia arriba
        $('#navbar').removeClass('-translate-y-16');
        $('#navbar').removeClass('z-30');
        $('#navbar').addClass('z-50');

         $('#navbar').removeClass('bg-transparent');
        $('#navbar').addClass('bg-bgSeco/90');
      }
     this.lastScrollPosition = currentScrollPosition;
   }

}
