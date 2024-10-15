import {Component, OnDestroy, OnInit,AfterViewInit , ViewEncapsulation} from "@angular/core";
// import {ThemeService} from "../../../services/theme/theme.service";
import {BehaviorSubject} from "rxjs";
import { Post } from "../../models/post";
// import {SidebarService} from "../services/sidebar.service";
import {Router} from "@angular/router";
import { SidebarService } from '../../components/sidebar/services/sidebar.service';

@Component({
  selector: 'app-landings-index',
  templateUrl: './index.component.html',
  styles: [],
  encapsulation: ViewEncapsulation.None
})
export class LandingsIndexComponent implements OnInit, AfterViewInit{
  posts:any[]=[
    {
      id:'landing1',
      name:'Un diseño sencillo y directo de la landing de Slack',
      subname:'',
      desc:'A medida que te desplazas, se muestran las características clave de la plataforma con ilustraciones amigables y animaciones sutiles que refuerzan el mensaje.',
      img: [],
      contents: [],
      components: [],
      category:null,
      user:null,
      client:null,
      date:'5/06/2024',
    },
    {
      id:'landing2',
      name:'Descubre el impacto visual de la landing page de Marvel',
      subname:'',
      desc:'La landing page de Marvel combina imágenes llamativas y colores vibrantes para capturar la esencia de su universo cinematográfico.',
      img: [],
      contents: [],
      components: [],
      category:null,
      user:null,
      client:null,
      date:'10/06/2024',

    },
    {
      id:'landing3',
      name:'Elegancia en la landing de "La Velada del Año"',
      subname:'subname',
      desc:'La landing page de "La Velada del Año" cautiva con un diseño moderno y vibrante, reflejando la emoción del evento de boxeo más esperado entre creadores de contenido. Desde el primer momento.',
      img: [],
      contents: [],
      components: [],
      category:null,
      user:null,
      client:null,
      date:'20/07/2024',
    },
    {
      id:'landing4',
      name:'Creatividad sin límites en la landing de Webflow',
      subname:'subname',
      desc:'La landing page de Webflow combina un diseño moderno y profesional con una navegación fluida que resalta el poder de su plataforma de diseño web.',
      img: [],
      contents: [],
      components: [],
      category:null,
      user:null,
      client:null,
      date:'1/08/2024',
    },
  
  ];
  constructor(
    private router: Router,
    public sidebarService: SidebarService
  ) {
  }
  ngOnInit(): void {
    console.log(this.posts)
    /* this.posts.push(
      {
      id:'landing1',
      name:'landing 1',
      subname:'subname',
      desc:'desc',
      img: [],
      contents: [],
      components: [],
      category:null,
      user:null,
      client:null,
    },
    {
      id:'landing2',
      name:'landing 2',
      subname:'subname',
      desc:'desc',
      img: [],
      contents: [],
      components: [],
      category:null,
      user:null,
      client:null,
    },
    {
      id:'landing3',
      name:'landing 3',
      subname:'subname',
      desc:'desc',
      img: [],
      contents: [],
      components: [],
      category:null,
      user:null,
      client:null,
    },
    {
      id:'landing4',
      name:'landing 4',
      subname:'subname',
      desc:'desc',
      img: [],
      contents: [],
      components: [],
      category:null,
      user:null,
      client:null,
    },
  ) */
  }
  ngAfterViewInit() {
    this.sidebarService.showSidebar(true);
    
  }
  goToLanding(id: number) {
    const state = { id };
    console.log(state)
    const route = ['blog/extra/landings/'+id];
    this.router.navigate(route, { state });
  }
}
