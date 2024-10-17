import {Component, Input, OnInit, HostListener} from "@angular/core";
import {SidebarService} from"./services/sidebar.service";
import {MenuItem} from "./models/menu-item";
import {ThemeService} from "../../../../services/theme/theme.service";
import {PostCategory} from "../../models/post-category";
import {CategoryService} from "../../services/api/post-category.service";
import {first} from "rxjs/operators";
import {Router} from "@angular/router";

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
  categories: PostCategory[]=[];
  audio = new Audio('assets/sounds/mixkit-mouse-click-close-1113.wav');
  audio2 = new Audio('assets/sounds/mixkit-hard-pop-click-2364.wav');

  constructor(
    public sidebarService: SidebarService,
    public themeService: ThemeService,
    private postCategoryService: CategoryService,
    private router: Router,

  ) {
    this.sidebarOpen= false;
  }
  show_nav!:boolean;

  ngOnInit() {
    this.transparent=true;
    this.sidebarService.getShow().subscribe(show_nav => {
      this.show_nav = show_nav;
    });
    this.sidebarService.getSidebarState().subscribe(sidebarOpen => {
      this.sidebarOpen = sidebarOpen;
    });
    this.themeService.getCurrentTheme().subscribe(theme => {
      this.isDarkEnable = theme === 'theme-dark';
    });
    /* if(this.transparent ){
      $('#navbar').addClass('bg-transparent');
      window.addEventListener('scroll', this.scroll, true)
    }else {
      $('#navbar').removeClass('bg-transparent');
      $('#navbar').addClass('bg-bgPrim');
    } */
    window.addEventListener('scroll', this.scroll, true)

    this.postCategoryService.getAll()
    .pipe(first())
    .subscribe(
      res => {
        console.log(res)
        this.categories = res.data.category;
      },
      error => {
      });
  }

  toggleSidebar() {
    this.sidebarService.toggleSidebar();
      $('#navbar').removeClass('bg-transparent');
        $('#navbar').removeClass('bg-bgSeco/90');
        $('#navbar').addClass('bg-bgSeco');
        $('#navbar').addClass('z-50');
  }

  show_cat=false;
  showCategories(){
    this.audio2.load();
    this.audio2.play();
    this.show_cat=!this.show_cat;
  }
  changeTheme() {
    this.audio.load();
    this.audio.play();
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
      if(!this.sidebarOpen){
        this.detectScrollDirection()
      }else{

      }
  }

  scroll = (): void => {

  }
  detectScrollDirection() {
    var currentScrollPosition = window.pageYOffset || document.documentElement.scrollTop;

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
    }   */

    var scrollDistance = document.documentElement.scrollTop;
    /* if(!this.sidebarOpen){ */

    if(scrollDistance <= 0){
      // $('#navbar').addClass('bg-transparent');
      // $('#navbar').removeClass('bg-bgSeco/90');

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

       //  $('#navbar').removeClass('bg-transparent');
       // $('#navbar').addClass('bg-bgSeco/90');
      }
     this.lastScrollPosition = currentScrollPosition;
   }

   goToCat(id: number, catname: string) {
    const state = { id };
    console.log(state)
    const route = ['/blog/categories', catname];
    this.router.navigate(route, { state });
  }

  goToLandings() {
    const route = ['/blog/bonus/landings'];
    this.router.navigate(route);

  }
}
