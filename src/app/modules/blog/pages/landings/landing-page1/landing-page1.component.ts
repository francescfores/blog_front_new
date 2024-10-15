import {Component, OnInit} from '@angular/core';
import { SidebarService } from '../../../components/sidebar/services/sidebar.service';

@Component({
  selector: 'app-landing-page1',
  templateUrl: './landing-page1.component.html',
  styleUrls: ['./landing-page1.component.css']
})
export class LandingPage1Component implements OnInit {
  show_nav= false;

  constructor(
    public sidebarService: SidebarService,
  ) {}

  ngOnInit(): void {
    this.sidebarService.showSidebar(false);
  }
}
