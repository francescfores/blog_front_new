import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {FormsModule, ReactiveFormsModule} from "@angular/forms";
import { CreatePostComponent } from './components/posts/create-post/create-post.component';
import { UpdatePostComponent } from './components/posts/update-post/update-post.component';
import {AdminLayoutRoutingModule} from "../admin-layout/admin-layout-routing.module";
import {IndexComponent} from "./index/index.component";
import {BlogRoutingModule} from "./blog-routing.module";
import {ShowPostComponent} from "./components/posts/show-post/show-post.component";
import {ComponentsModule} from "../../components/components.module";
import { CreateContentComponent } from './components/posts/contents/create-content/create-content.component';
import { ShowContentComponent } from './components/posts/contents/show-content/show-content.component';
import { UpdateContentComponent } from './components/posts/contents/update-content/update-content.component';
import { ContactComponent } from './pages/contact/contact.component';
import { HomeComponent } from './pages/home/home.component';
import {ComponentsModuleBlog} from "./components/components.module";
import {IndexAdminComponent} from "./index-admin/index-admin.component";
import { CategoryComponent } from './pages/category/category.component';
import { PostComponent } from './pages/post/post.component';
import {EditorPostComponent} from "./components/posts/editor-post/editor-post.component";
import {EditorContentComponent} from "./components/posts/contents/editor-content/editor-content.component";
import {AddContentComponent} from "./components/posts/contents/add-content/add-content.component";
import {CdkDrag, CdkDropList} from "@angular/cdk/drag-drop";
import {LandingPage1Component} from "./pages/landings/landing-page1/landing-page1.component";
import {LandingPage2Component} from "./pages/landings/landing-page2/landing-page2.component";
import {LandingPage3Component} from "./pages/landings/landing-page3/landing-page3.component";
import {LandingsIndexComponent} from "./pages/landings/index.component";
import {Home5Component} from "./pages/landings/home5/home5.component";
import {SwiperSliderComponent} from "./components/sliders/swiper-slider/swiper-slider.component";

@NgModule({
  declarations: [
    IndexComponent,
    IndexAdminComponent,
    ShowPostComponent,
    CreatePostComponent,
    UpdatePostComponent,
    EditorPostComponent,
    CreateContentComponent,
    ShowContentComponent,
    UpdateContentComponent,
    ContactComponent,
    HomeComponent,
    CategoryComponent,
    PostComponent,
    EditorContentComponent,
    AddContentComponent,
    LandingPage1Component,
    LandingPage2Component,
    LandingPage3Component,
    LandingsIndexComponent,
    Home5Component
  ],
  exports: [
    IndexComponent,
    IndexAdminComponent,
    ShowPostComponent,
    CreatePostComponent,
    UpdatePostComponent,
    EditorPostComponent,
    EditorContentComponent,
  ],
  imports: [
    CommonModule,
    ReactiveFormsModule,
    BlogRoutingModule,
    ComponentsModule,
    FormsModule,
    ComponentsModuleBlog,
    CdkDrag,
    CdkDropList,
    SwiperSliderComponent
    //MatInputModule,
    //MatFormFieldModule,
    //MatAutocompleteModule
  ]
})
export class BlogModule { }
