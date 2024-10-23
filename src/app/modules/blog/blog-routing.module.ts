import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {IndexComponent} from './index/index.component';
import {BlogModule} from './blog.module';
import {UsersComponent} from "../admin-layout/pages/users/users.component";
import {SettingsComponent} from "../admin-layout/pages/settings/settings.component";
import {CreatePostComponent} from "./components/posts/create-post/create-post.component";
import {UpdatePostComponent} from "./components/posts/update-post/update-post.component";
import {AuthGuard} from "../../services/guards/auth.guard";
import {DashboardComponent} from "../admin-layout/pages/dashboard/dashboard.component";
import {ShowPostComponent} from "./components/posts/show-post/show-post.component";
import {HomeComponent} from "./pages/home/home.component";
import {IndexAdminComponent} from "./index-admin/index-admin.component";
import {ContactComponent} from "./pages/contact/contact.component";
import {CategoryComponent} from "./pages/category/category.component";
import {PostComponent} from "./pages/post/post.component";
import {EditorPostComponent} from "./components/posts/editor-post/editor-post.component";
import {EditorComponent} from "../admin-layout/pages/editor/editor.component";
import {EditorContentComponent} from "./components/posts/contents/editor-content/editor-content.component";
import {LandingPage1Component} from "./pages/landings/landing-page1/landing-page1.component";
import {LandingPage2Component} from "./pages/landings/landing-page2/landing-page2.component";
import {LandingPage3Component} from "./pages/landings/landing-page3/landing-page3.component";
import {Home5Component} from "./pages/landings/home5/home5.component";
import {LandingsIndexComponent} from "./pages/landings/index.component";
import {ShowCategoriesComponent} from "./pages/admin-categories/show-categories/show-categories.component";
import {UpdateCategoriesComponent} from "./pages/admin-categories/update-categories/update-categories.component";
import {CreateCategoriesComponent} from "./pages/admin-categories/create-categories/create-categories.component";

// import {InputsComponent} from "../admin-layout/pages/components/inputs/inputs.component";

const routes: Routes = [
  {
    path: 'blog-admin',
    component: IndexAdminComponent,
    // canActivate: [AuthGuard],
    // canActivateChild: [AuthGuard],
    data: {
      breadcrumb: 'blog-admin'
    },
    children: [
      { path: "posts", component: ShowPostComponent,
        data: {
          breadcrumb: 'posts'
        },
      },
      { path: "create", component: CreatePostComponent,
        data: {
          breadcrumb: 'create'
        },
      },
      { path: "editor-components", component: EditorContentComponent,
        data: {
          breadcrumb: 'editor-components'
        },
      },
      { path: 'update/:name', component: UpdatePostComponent, pathMatch: 'prefix',
        data: {
          breadcrumb: 'update'
        },
      },
      { path: 'editor/:name', component: EditorPostComponent, pathMatch: 'prefix',
        data: {
          breadcrumb: 'editor'
        },
      },

      { path: "categories", component: ShowCategoriesComponent,
        data: {
          breadcrumb: 'posts'
        },
      },
      { path: "categories/create", component: CreateCategoriesComponent,
        data: {
          breadcrumb: 'create'
        },
      },
      { path: 'categories/update/:name', component: UpdateCategoriesComponent, pathMatch: 'prefix',
        data: {
          breadcrumb: 'update'
        },
      },
    ]
  },
  {
    path: 'blog',
    component: IndexComponent,
    // canActivate: [NonAuthGuard],
    // canActivateChild: [NonAuthGuard],
    // data: {
    //   breadcrumb: 'blog'
    // },
    children: [
      { path: "", component: HomeComponent,
         data: {
           breadcrumb: 'home'
         },
      },
      { path: 'categories/:catname', component: CategoryComponent, pathMatch: 'prefix',
        data: {
          breadcrumb: ':category'
        },
      },
      { path: 'posts/:catname/:postname', component: PostComponent, pathMatch: 'prefix',
        data: {
          breadcrumb: ':postname'
        },
      },
      { path: "contact", component: ContactComponent,
        data: {
          breadcrumb: 'contact'
        },
      },
      {
        path: "extra/landings", component: LandingsIndexComponent,
        data: { breadcrumb: 'landings' },
      },
      {
        path: "extra/landings/landing1", component: LandingPage1Component,
        data: { breadcrumb: 'landing1' },
      },
      {
        path: "extra/landings/landing2", component: LandingPage2Component,
        data: { breadcrumb: 'landing2' },
      },
      {
        path: "extra/landings/landing3", component: LandingPage3Component,
        data: { breadcrumb: 'landing3' },
      },
      {
        path: "extra/landings/landing4", component: Home5Component,
        data: { breadcrumb: 'landing4' },
      },
      /* { path: 'posts/landings/:catname', component: LandingPage1Component, pathMatch: 'prefix',
        data: {
          breadcrumb: ':category'
        },
      }, */
    ]
  },
  { path: '',redirectTo: "blog",  pathMatch: "full" },
  { path: "**", redirectTo: "blog", pathMatch: "full" },
  // ],
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],

})
export class BlogRoutingModule { }
