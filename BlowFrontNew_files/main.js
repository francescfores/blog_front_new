import {
  AuthenticationService,
  NonAuthGuard
} from "/chunk-N7HCM4WC.js";
import {
  AuthenticationAdminService,
  SharedService
} from "/chunk-PETFMM4Q.js";
import {
  BreadcrumbService,
  ComponentsModule
} from "/chunk-PPC3MYZE.js";

// src/main.ts
import * as __NgCli_bootstrap_1 from "/@fs/home/fran/Documentos/Code/projects/blog/blow_front_new/.angular/cache/18.2.5/vite/deps/@angular_platform-browser.js?v=ccc36b0a";

// src/app/app.module.ts
import { NgModule as NgModule2 } from "/@fs/home/fran/Documentos/Code/projects/blog/blow_front_new/.angular/cache/18.2.5/vite/deps/@angular_core.js?v=ccc36b0a";
import { BrowserModule } from "/@fs/home/fran/Documentos/Code/projects/blog/blow_front_new/.angular/cache/18.2.5/vite/deps/@angular_platform-browser.js?v=ccc36b0a";

// src/app/app.component.ts
import { Component } from "/@fs/home/fran/Documentos/Code/projects/blog/blow_front_new/.angular/cache/18.2.5/vite/deps/@angular_core.js?v=ccc36b0a";
import * as i0 from "/@fs/home/fran/Documentos/Code/projects/blog/blow_front_new/.angular/cache/18.2.5/vite/deps/@angular_core.js?v=ccc36b0a";
import * as i1 from "/@fs/home/fran/Documentos/Code/projects/blog/blow_front_new/.angular/cache/18.2.5/vite/deps/@angular_router.js?v=ccc36b0a";
var AppComponent = class _AppComponent {
  title = "blog";
  static \u0275fac = function AppComponent_Factory(__ngFactoryType__) {
    return new (__ngFactoryType__ || _AppComponent)();
  };
  static \u0275cmp = /* @__PURE__ */ i0.\u0275\u0275defineComponent({ type: _AppComponent, selectors: [["app-root"]], decls: 1, vars: 0, template: function AppComponent_Template(rf, ctx) {
    if (rf & 1) {
      i0.\u0275\u0275element(0, "router-outlet");
    }
  }, dependencies: [i1.RouterOutlet] });
};
(() => {
  (typeof ngDevMode === "undefined" || ngDevMode) && i0.\u0275setClassDebugInfo(AppComponent, { className: "AppComponent", filePath: "src/app/app.component.ts", lineNumber: 8 });
})();

// src/app/app-routing.module.ts
import { NgModule } from "/@fs/home/fran/Documentos/Code/projects/blog/blow_front_new/.angular/cache/18.2.5/vite/deps/@angular_core.js?v=ccc36b0a";
import { RouterModule } from "/@fs/home/fran/Documentos/Code/projects/blog/blow_front_new/.angular/cache/18.2.5/vite/deps/@angular_router.js?v=ccc36b0a";
import * as i02 from "/@fs/home/fran/Documentos/Code/projects/blog/blow_front_new/.angular/cache/18.2.5/vite/deps/@angular_core.js?v=ccc36b0a";
var routes = [
  {
    canActivate: [NonAuthGuard],
    canActivateChild: [NonAuthGuard],
    path: "admin",
    loadChildren: () => import("/chunk-PV6OTJUJ.js").then((m) => m.AdminLayoutModule)
  },
  {
    canActivate: [NonAuthGuard],
    canActivateChild: [NonAuthGuard],
    path: "auth",
    loadChildren: () => import("/chunk-VV3W7KX7.js").then((m) => m.AuthModule)
  },
  {
    canActivate: [NonAuthGuard],
    canActivateChild: [NonAuthGuard],
    path: "",
    loadChildren: () => import("/chunk-YAOMYNP2.js").then((m) => m.FrontLayoutModule)
  },
  {
    canActivate: [NonAuthGuard],
    canActivateChild: [NonAuthGuard],
    path: "",
    loadChildren: () => import("/chunk-ZDAEXBXW.js").then((m) => m.BlogModule)
  }
  // {
  //   canActivate: [NonAuthGuard],
  //   canActivateChild: [NonAuthGuard],
  //   path: '',
  //   loadChildren: () => import('./modules/blog2/blog.module').then(m => m.BlogModule2)
  // },
  // admin views
  // { path: "**", redirectTo: "", pathMatch: "full" }, 
];
var AppRoutingModule = class _AppRoutingModule {
  static \u0275fac = function AppRoutingModule_Factory(__ngFactoryType__) {
    return new (__ngFactoryType__ || _AppRoutingModule)();
  };
  static \u0275mod = /* @__PURE__ */ i02.\u0275\u0275defineNgModule({ type: _AppRoutingModule });
  static \u0275inj = /* @__PURE__ */ i02.\u0275\u0275defineInjector({ imports: [RouterModule.forRoot(routes), RouterModule] });
};

// src/app/app.module.ts
import { HttpClientModule } from "/@fs/home/fran/Documentos/Code/projects/blog/blow_front_new/.angular/cache/18.2.5/vite/deps/@angular_common_http.js?v=ccc36b0a";
import { GoogleLoginProvider } from "/@fs/home/fran/Documentos/Code/projects/blog/blow_front_new/.angular/cache/18.2.5/vite/deps/@abacritt_angularx-social-login.js?v=ccc36b0a";
import { ToastrModule } from "/@fs/home/fran/Documentos/Code/projects/blog/blow_front_new/.angular/cache/18.2.5/vite/deps/ngx-toastr.js?v=ccc36b0a";
import { BrowserAnimationsModule } from "/@fs/home/fran/Documentos/Code/projects/blog/blow_front_new/.angular/cache/18.2.5/vite/deps/@angular_platform-browser_animations.js?v=ccc36b0a";
import * as i03 from "/@fs/home/fran/Documentos/Code/projects/blog/blow_front_new/.angular/cache/18.2.5/vite/deps/@angular_core.js?v=ccc36b0a";
var googleLoginOptions = { oneTapEnabled: false };
var AppModule = class _AppModule {
  static \u0275fac = function AppModule_Factory(__ngFactoryType__) {
    return new (__ngFactoryType__ || _AppModule)();
  };
  static \u0275mod = /* @__PURE__ */ i03.\u0275\u0275defineNgModule({ type: _AppModule, bootstrap: [AppComponent] });
  static \u0275inj = /* @__PURE__ */ i03.\u0275\u0275defineInjector({ providers: [
    AuthenticationService,
    SharedService,
    AuthenticationAdminService,
    BreadcrumbService,
    {
      provide: "SocialAuthServiceConfig",
      useValue: {
        autoLogin: false,
        providers: [
          {
            id: GoogleLoginProvider.PROVIDER_ID,
            provider: new GoogleLoginProvider("124147147180-roi438596d3n7af2o66bpj2oospc68fl.apps.googleusercontent.com", googleLoginOptions)
          }
        ],
        onError: (err) => {
          console.error(err);
        }
      }
    }
  ], imports: [
    BrowserModule,
    ComponentsModule,
    AppRoutingModule,
    HttpClientModule,
    BrowserAnimationsModule,
    ToastrModule.forRoot({
      positionClass: "toast-bottom-right",
      closeButton: true,
      progressBar: true
    })
  ] });
};

// src/main.ts
__NgCli_bootstrap_1.platformBrowser().bootstrapModule(AppModule).catch((err) => console.error(err));


//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbInNyYy9hcHAvYXBwLm1vZHVsZS50cyIsInNyYy9hcHAvYXBwLmNvbXBvbmVudC50cyIsInNyYy9hcHAvYXBwLmNvbXBvbmVudC5odG1sIiwic3JjL2FwcC9hcHAtcm91dGluZy5tb2R1bGUudHMiLCJzcmMvbWFpbi50cyJdLCJzb3VyY2VzQ29udGVudCI6WyJpbXBvcnQgeyBOZ01vZHVsZSB9IGZyb20gJ0Bhbmd1bGFyL2NvcmUnO1xuaW1wb3J0IHsgQnJvd3Nlck1vZHVsZSB9IGZyb20gJ0Bhbmd1bGFyL3BsYXRmb3JtLWJyb3dzZXInO1xuXG5pbXBvcnQgeyBBcHBDb21wb25lbnQgfSBmcm9tICcuL2FwcC5jb21wb25lbnQnO1xuaW1wb3J0IHtDb21wb25lbnRzTW9kdWxlfSBmcm9tIFwiLi9jb21wb25lbnRzL2NvbXBvbmVudHMubW9kdWxlXCI7XG5pbXBvcnQge1JvdXRlck91dGxldH0gZnJvbSBcIkBhbmd1bGFyL3JvdXRlclwiO1xuaW1wb3J0IHtBcHBSb3V0aW5nTW9kdWxlfSBmcm9tIFwiLi9hcHAtcm91dGluZy5tb2R1bGVcIjtcbmltcG9ydCB7SHR0cENsaWVudE1vZHVsZX0gZnJvbSBcIkBhbmd1bGFyL2NvbW1vbi9odHRwXCI7XG5pbXBvcnQge0F1dGhlbnRpY2F0aW9uU2VydmljZX0gZnJvbSBcIi4vc2VydmljZXMvYXBpL2F1dGhlbnRpY2F0aW9uLnNlcnZpY2VcIjtcbmltcG9ydCB7R29vZ2xlSW5pdE9wdGlvbnMsIEdvb2dsZUxvZ2luUHJvdmlkZXIsIFNvY2lhbEF1dGhTZXJ2aWNlQ29uZmlnfSBmcm9tIFwiQGFiYWNyaXR0L2FuZ3VsYXJ4LXNvY2lhbC1sb2dpblwiO1xuaW1wb3J0IHtUb2FzdHJNb2R1bGV9IGZyb20gXCJuZ3gtdG9hc3RyXCI7XG5pbXBvcnQge0Jyb3dzZXJBbmltYXRpb25zTW9kdWxlfSBmcm9tIFwiQGFuZ3VsYXIvcGxhdGZvcm0tYnJvd3Nlci9hbmltYXRpb25zXCI7XG5pbXBvcnQge0F1dGhlbnRpY2F0aW9uQWRtaW5TZXJ2aWNlfSBmcm9tIFwiLi9zZXJ2aWNlcy9hcGkvYXV0aGVudGljYXRpb24tYWRtaW4uc2VydmljZVwiO1xuaW1wb3J0IHtTaGFyZWRTZXJ2aWNlfSBmcm9tIFwiLi9zZXJ2aWNlcy9zaGFyZWQuc2VydmljZVwiO1xuaW1wb3J0IHtCcmVhZGNydW1iU2VydmljZX0gZnJvbSBcIi4vY29tcG9uZW50cy9icmVhZGNydW1icy9icmVhZGNydW1TZXJ2aWNlXCI7XG4vLyBpbXBvcnQge0NsaWVudFNlcnZpY2V9IGZyb20gXCIuL3NlcnZpY2VzL2FwaS9jbGllbnQuc2VydmljZVwiO1xuXG5jb25zdCBnb29nbGVMb2dpbk9wdGlvbnM6IEdvb2dsZUluaXRPcHRpb25zID0geyBvbmVUYXBFbmFibGVkOiBmYWxzZX0vLyBkZWZhdWx0IGlzIHRydWUgfTtcblxuQE5nTW9kdWxlKHtcbiAgZGVjbGFyYXRpb25zOiBbXG4gICAgQXBwQ29tcG9uZW50LFxuICBdLFxuICBpbXBvcnRzOiBbXG4gICAgQnJvd3Nlck1vZHVsZSxcbiAgICBDb21wb25lbnRzTW9kdWxlLFxuICAgIEFwcFJvdXRpbmdNb2R1bGUsXG4gICAgSHR0cENsaWVudE1vZHVsZSxcbiAgICBCcm93c2VyQW5pbWF0aW9uc01vZHVsZSxcbiAgICBUb2FzdHJNb2R1bGUuZm9yUm9vdCh7XG4gICAgICBwb3NpdGlvbkNsYXNzOiAndG9hc3QtYm90dG9tLXJpZ2h0JyxcbiAgICAgIGNsb3NlQnV0dG9uOiB0cnVlLFxuICAgICAgcHJvZ3Jlc3NCYXI6IHRydWVcbiAgICB9KSxcbiAgXSxcbiAgcHJvdmlkZXJzOiBbXG4gICAgQXV0aGVudGljYXRpb25TZXJ2aWNlLFxuICAgIFNoYXJlZFNlcnZpY2UsXG4gICAgQXV0aGVudGljYXRpb25BZG1pblNlcnZpY2UsXG4gICAgQnJlYWRjcnVtYlNlcnZpY2UsXG4gICAge1xuICAgICAgcHJvdmlkZTogJ1NvY2lhbEF1dGhTZXJ2aWNlQ29uZmlnJyxcbiAgICAgIHVzZVZhbHVlOiB7XG4gICAgICAgIGF1dG9Mb2dpbjogZmFsc2UsXG4gICAgICAgIHByb3ZpZGVyczogW1xuICAgICAgICAgIHtcbiAgICAgICAgICAgIGlkOiBHb29nbGVMb2dpblByb3ZpZGVyLlBST1ZJREVSX0lELFxuICAgICAgICAgICAgcHJvdmlkZXI6IG5ldyBHb29nbGVMb2dpblByb3ZpZGVyKFxuICAgICAgICAgICAgICAnMTI0MTQ3MTQ3MTgwLXJvaTQzODU5NmQzbjdhZjJvNjZicGoyb29zcGM2OGZsLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tJyxcbiAgICAgICAgICAgICAgZ29vZ2xlTG9naW5PcHRpb25zICksXG4gICAgICAgICAgfVxuICAgICAgICBdLFxuICAgICAgICBvbkVycm9yOiAoZXJyOmFueSkgPT4ge1xuICAgICAgICAgIGNvbnNvbGUuZXJyb3IoZXJyKTtcbiAgICAgICAgfVxuICAgICAgfSBhcyBTb2NpYWxBdXRoU2VydmljZUNvbmZpZyxcbiAgICB9LFxuICBdLFxuICBib290c3RyYXA6IFtBcHBDb21wb25lbnRdXG59KVxuZXhwb3J0IGNsYXNzIEFwcE1vZHVsZSB7IH1cblxuIiwiaW1wb3J0IHsgQ29tcG9uZW50IH0gZnJvbSAnQGFuZ3VsYXIvY29yZSc7XG5cbkBDb21wb25lbnQoe1xuICBzZWxlY3RvcjogJ2FwcC1yb290JyxcbiAgdGVtcGxhdGVVcmw6ICcuL2FwcC5jb21wb25lbnQuaHRtbCcsXG4gIHN0eWxlVXJsczogWycuL2FwcC5jb21wb25lbnQuY3NzJ11cbn0pXG5leHBvcnQgY2xhc3MgQXBwQ29tcG9uZW50IHtcbiAgdGl0bGUgPSAnYmxvZyc7XG59XG4iLCI8cm91dGVyLW91dGxldD48L3JvdXRlci1vdXRsZXQ+XG5cbiIsImltcG9ydCB7IE5nTW9kdWxlIH0gZnJvbSBcIkBhbmd1bGFyL2NvcmVcIjtcbmltcG9ydCB7IFJvdXRlcywgUm91dGVyTW9kdWxlIH0gZnJvbSBcIkBhbmd1bGFyL3JvdXRlclwiO1xuaW1wb3J0IHsgQXBwQ29tcG9uZW50IH0gZnJvbSBcIi4vYXBwLmNvbXBvbmVudFwiO1xuaW1wb3J0IHsgQXV0aE1vZHVsZSB9IGZyb20gXCIuL21vZHVsZXMvYXV0aC9hdXRoLm1vZHVsZVwiO1xuaW1wb3J0IHsgTG9naW5BZG1pbkNvbXBvbmVudCB9IGZyb20gXCIuL21vZHVsZXMvYXV0aC9wYWdlcy9hZG1pbi9sb2dpbi1hZG1pbi9sb2dpbi1hZG1pbi5jb21wb25lbnRcIjtcbmltcG9ydCB7IE5vbkF1dGhHdWFyZCB9IGZyb20gXCIuL3NlcnZpY2VzL2d1YXJkcy9ub24tYXV0aC5ndWFyZFwiO1xuLy8gaW1wb3J0IHtCbG9nTW9kdWxlMn0gZnJvbSBcIi4vbW9kdWxlcy9ibG9nMi9ibG9nLm1vZHVsZVwiO1xuXG5jb25zdCByb3V0ZXM6IFJvdXRlcyA9IFtcbiAgIHtcbiAgICBjYW5BY3RpdmF0ZTogW05vbkF1dGhHdWFyZF0sXG4gICAgY2FuQWN0aXZhdGVDaGlsZDogW05vbkF1dGhHdWFyZF0sXG4gICAgcGF0aDogJ2FkbWluJyxcbiAgICBsb2FkQ2hpbGRyZW46ICgpID0+IGltcG9ydCgnLi9tb2R1bGVzL2FkbWluLWxheW91dC9hZG1pbi1sYXlvdXQubW9kdWxlJykudGhlbihtID0+IG0uQWRtaW5MYXlvdXRNb2R1bGUpXG4gIH0sXG4gICB7XG4gICAgY2FuQWN0aXZhdGU6IFtOb25BdXRoR3VhcmRdLFxuICAgIGNhbkFjdGl2YXRlQ2hpbGQ6IFtOb25BdXRoR3VhcmRdLFxuICAgIHBhdGg6ICdhdXRoJyxcbiAgICBsb2FkQ2hpbGRyZW46ICgpID0+IGltcG9ydCgnLi9tb2R1bGVzL2F1dGgvYXV0aC5tb2R1bGUnKS50aGVuKG0gPT4gbS5BdXRoTW9kdWxlKVxuICB9LCBcbiAge1xuICAgIGNhbkFjdGl2YXRlOiBbTm9uQXV0aEd1YXJkXSxcbiAgICBjYW5BY3RpdmF0ZUNoaWxkOiBbTm9uQXV0aEd1YXJkXSxcbiAgICBwYXRoOiAnJyxcbiAgICBsb2FkQ2hpbGRyZW46ICgpID0+IGltcG9ydCgnLi9tb2R1bGVzL2Zyb250LWxheW91dC9mcm9udC1sYXlvdXQubW9kdWxlJykudGhlbihtID0+IG0uRnJvbnRMYXlvdXRNb2R1bGUpXG4gIH0sIFxuICB7XG4gICAgY2FuQWN0aXZhdGU6IFtOb25BdXRoR3VhcmRdLFxuICAgIGNhbkFjdGl2YXRlQ2hpbGQ6IFtOb25BdXRoR3VhcmRdLFxuICAgIHBhdGg6ICcnLFxuICAgIGxvYWRDaGlsZHJlbjogKCkgPT4gaW1wb3J0KCcuL21vZHVsZXMvYmxvZy9ibG9nLm1vZHVsZScpLnRoZW4obSA9PiBtLkJsb2dNb2R1bGUpXG4gIH0sXG4gIC8vIHtcbiAgLy8gICBjYW5BY3RpdmF0ZTogW05vbkF1dGhHdWFyZF0sXG4gIC8vICAgY2FuQWN0aXZhdGVDaGlsZDogW05vbkF1dGhHdWFyZF0sXG4gIC8vICAgcGF0aDogJycsXG4gIC8vICAgbG9hZENoaWxkcmVuOiAoKSA9PiBpbXBvcnQoJy4vbW9kdWxlcy9ibG9nMi9ibG9nLm1vZHVsZScpLnRoZW4obSA9PiBtLkJsb2dNb2R1bGUyKVxuICAvLyB9LFxuICAvLyBhZG1pbiB2aWV3c1xuICAvLyB7IHBhdGg6IFwiKipcIiwgcmVkaXJlY3RUbzogXCJcIiwgcGF0aE1hdGNoOiBcImZ1bGxcIiB9LCBcbl07XG5cbkBOZ01vZHVsZSh7XG4gIGltcG9ydHM6IFtSb3V0ZXJNb2R1bGUuZm9yUm9vdChyb3V0ZXMpXSxcbiAgZXhwb3J0czogW1JvdXRlck1vZHVsZV0sXG5cbn0pXG5leHBvcnQgY2xhc3MgQXBwUm91dGluZ01vZHVsZSB7IH1cblxuIiwiaW1wb3J0IHsgcGxhdGZvcm1Ccm93c2VyRHluYW1pYyB9IGZyb20gJ0Bhbmd1bGFyL3BsYXRmb3JtLWJyb3dzZXItZHluYW1pYyc7XG5cbmltcG9ydCB7IEFwcE1vZHVsZSB9IGZyb20gJy4vYXBwL2FwcC5tb2R1bGUnO1xuLy8gaW1wb3J0ICdjb2RlbWlycm9yL2xpYi9jb2RlbWlycm9yJztcbi8vIGltcG9ydCAnY29kZW1pcnJvci9tb2RlL2phdmFzY3JpcHQvamF2YXNjcmlwdCc7XG4vLyBpbXBvcnQgJ2NvZGVtaXJyb3IvbW9kZS9tYXJrZG93bi9tYXJrZG93bic7XG4vLyBpbXBvcnQgJ2NvZGVtaXJyb3IvbW9kZS9odG1sbWl4ZWQvaHRtbG1peGVkJztcbi8vIGltcG9ydCAnY29kZW1pcnJvci9tb2RlL2Nzcy9jc3MnO1xuXG5pbXBvcnQgeyBlbmFibGVQcm9kTW9kZSB9IGZyb20gXCJAYW5ndWxhci9jb3JlXCI7XG4vKiBpbXBvcnQgeyBlbnZpcm9ubWVudCB9IGZyb20gXCIuL2Vudmlyb25tZW50cy9lbnZpcm9ubWVudFwiO1xuXG5pZiAoZW52aXJvbm1lbnQucHJvZHVjdGlvbikge1xuICBlbmFibGVQcm9kTW9kZSgpO1xufSAqL1xuXG5wbGF0Zm9ybUJyb3dzZXJEeW5hbWljKCkuYm9vdHN0cmFwTW9kdWxlKEFwcE1vZHVsZSlcbiAgLmNhdGNoKGVyciA9PiBjb25zb2xlLmVycm9yKGVycikpO1xuIl0sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7Ozs7OztBQUFBLFNBQVMsWUFBQUEsaUJBQWdCO0FBQ3pCLFNBQVMscUJBQXFCOzs7QUNEOUIsU0FBUyxpQkFBaUI7OztBQU9wQixJQUFPLGVBQVAsTUFBTyxjQUFZO0VBQ3ZCLFFBQVE7O3FDQURHLGVBQVk7RUFBQTs0RUFBWixlQUFZLFdBQUEsQ0FBQSxDQUFBLFVBQUEsQ0FBQSxHQUFBLE9BQUEsR0FBQSxNQUFBLEdBQUEsVUFBQSxTQUFBLHNCQUFBLElBQUEsS0FBQTtBQUFBLFFBQUEsS0FBQSxHQUFBO0FDUHpCLE1BQUEsdUJBQUEsR0FBQSxlQUFBOzs7OztnRkRPYSxjQUFZLEVBQUEsV0FBQSxnQkFBQSxVQUFBLDRCQUFBLFlBQUEsRUFBQSxDQUFBO0FBQUEsR0FBQTs7O0FFUHpCLFNBQVMsZ0JBQWdCO0FBQ3pCLFNBQWlCLG9CQUFvQjs7QUFPckMsSUFBTSxTQUFpQjtFQUNwQjtJQUNDLGFBQWEsQ0FBQyxZQUFZO0lBQzFCLGtCQUFrQixDQUFDLFlBQVk7SUFDL0IsTUFBTTtJQUNOLGNBQWMsTUFBTSxPQUFPLHFCQUE0QyxFQUFFLEtBQUssT0FBSyxFQUFFLGlCQUFpQjs7RUFFdkc7SUFDQyxhQUFhLENBQUMsWUFBWTtJQUMxQixrQkFBa0IsQ0FBQyxZQUFZO0lBQy9CLE1BQU07SUFDTixjQUFjLE1BQU0sT0FBTyxxQkFBNEIsRUFBRSxLQUFLLE9BQUssRUFBRSxVQUFVOztFQUVqRjtJQUNFLGFBQWEsQ0FBQyxZQUFZO0lBQzFCLGtCQUFrQixDQUFDLFlBQVk7SUFDL0IsTUFBTTtJQUNOLGNBQWMsTUFBTSxPQUFPLHFCQUE0QyxFQUFFLEtBQUssT0FBSyxFQUFFLGlCQUFpQjs7RUFFeEc7SUFDRSxhQUFhLENBQUMsWUFBWTtJQUMxQixrQkFBa0IsQ0FBQyxZQUFZO0lBQy9CLE1BQU07SUFDTixjQUFjLE1BQU0sT0FBTyxxQkFBNEIsRUFBRSxLQUFLLE9BQUssRUFBRSxVQUFVOzs7Ozs7Ozs7OztBQWlCN0UsSUFBTyxtQkFBUCxNQUFPLGtCQUFnQjs7cUNBQWhCLG1CQUFnQjtFQUFBOzRFQUFoQixrQkFBZ0IsQ0FBQTtnRkFKakIsYUFBYSxRQUFRLE1BQU0sR0FDM0IsWUFBWSxFQUFBLENBQUE7Ozs7QUh0Q3hCLFNBQVEsd0JBQXVCO0FBRS9CLFNBQTJCLDJCQUFtRDtBQUM5RSxTQUFRLG9CQUFtQjtBQUMzQixTQUFRLCtCQUE4Qjs7QUFNdEMsSUFBTSxxQkFBd0MsRUFBRSxlQUFlLE1BQUs7QUEyQzlELElBQU8sWUFBUCxNQUFPLFdBQVM7O3FDQUFULFlBQVM7RUFBQTs0RUFBVCxZQUFTLFdBQUEsQ0FGUixZQUFZLEVBQUEsQ0FBQTtpRkF2QmI7SUFDVDtJQUNBO0lBQ0E7SUFDQTtJQUNBO01BQ0UsU0FBUztNQUNULFVBQVU7UUFDUixXQUFXO1FBQ1gsV0FBVztVQUNUO1lBQ0UsSUFBSSxvQkFBb0I7WUFDeEIsVUFBVSxJQUFJLG9CQUNaLDRFQUNBLGtCQUFrQjs7O1FBR3hCLFNBQVMsQ0FBQyxRQUFXO0FBQ25CLGtCQUFRLE1BQU0sR0FBRztRQUNuQjs7O0tBR0wsU0FBQTtJQWpDQztJQUNBO0lBQ0E7SUFDQTtJQUNBO0lBQ0EsYUFBYSxRQUFRO01BQ25CLGVBQWU7TUFDZixhQUFhO01BQ2IsYUFBYTtLQUNkO0VBQUMsRUFBQSxDQUFBOzs7O0FJakJOLG9DQUFBLEVBQXlCLGdCQUFnQixTQUFTLEVBQy9DLE1BQU0sU0FBTyxRQUFRLE1BQU0sR0FBRyxDQUFDOyIsIm5hbWVzIjpbIk5nTW9kdWxlIl19