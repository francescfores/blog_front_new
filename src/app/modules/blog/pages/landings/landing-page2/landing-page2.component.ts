import {AfterViewInit, Component, HostListener, OnInit} from '@angular/core';
import {ThemeService} from "../../../../../services/theme/theme.service";
import { SidebarService } from '../../../components/sidebar/services/sidebar.service';
@Component({
  selector: 'app-landing-page2',
  templateUrl: './landing-page2.component.html',
  styleUrls: ['./landing-page2.component.css']
})
export class LandingPage2Component implements OnInit , AfterViewInit{
  scrolling_horizontal=true

  constructor(
     public sidebarService: SidebarService
) {}
  ngAfterViewInit() {
    this.sidebarService.showSidebar(false);
    const scrollContainers = document.querySelectorAll('.scroll-container') as NodeListOf<HTMLElement>;
    scrollContainers.forEach((scrollContainer) => {
      scrollContainer.addEventListener('wheel', this.onWheel.bind(this));
    });
  }



  private onWheel(event: WheelEvent) {
    const scrollContainer = event.currentTarget as HTMLElement;
    if (!scrollContainer)  return;

    const scrollAmount = event.deltaY*3; 
    const scrollLeft = scrollContainer.scrollLeft;
    const maxScrollLeft = scrollContainer.scrollWidth - scrollContainer.clientWidth;
    if (scrollAmount !== 0 ) {
      event.preventDefault();
      if (scrollLeft + scrollAmount >= maxScrollLeft) {
        scrollContainer.scrollLeft = maxScrollLeft;
      } else if (scrollLeft + scrollAmount <= 0) {
        scrollContainer.scrollLeft = 0;
      } else {
        scrollContainer.scrollLeft += scrollAmount;
      }
    }else {
    }
  }

  ngOnInit(): void {
   
    // this.sidebarService.getSidebarState().subscribe(sidebarOpen => {
    //   this.sidebarOpen = sidebarOpen;
    // });

  }
  // Función para detectar el scroll y determinar la dirección

// Evento de desplazamiento

}
