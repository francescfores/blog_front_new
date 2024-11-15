import {Component, OnInit, ViewEncapsulation} from "@angular/core";
import {ThemeService} from "../../../services/theme/theme.service";
import {BehaviorSubject} from "rxjs";

@Component({
  selector: 'app-index',
  templateUrl: './index.component.html',
  styleUrls: ['./index.component.css'],
  encapsulation: ViewEncapsulation.None
})
export class IndexComponent implements OnInit {
  isDarkEnable = false;
  sidebarOpen= false;
  registerOpen = false;

  constructor(
    public themeService: ThemeService,
  ) {}

  ngOnInit(): void {
    this.themeService.getCurrentTheme().subscribe(theme => {
      this.isDarkEnable = theme === 'theme-dark';
    });
  }
  register(){
    console.log('register');
    this.registerOpen = !this.registerOpen;
  }
}
