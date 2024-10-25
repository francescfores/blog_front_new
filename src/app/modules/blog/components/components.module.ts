import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import {RouterModule} from "@angular/router";
import {FormsModule} from "@angular/forms";
import {FooterAdminComponent} from "./footer-admin/footer-admin.component";
import {SidebarComponent} from "./sidebar/sidebar.component";
import {NavbarLanding1Component} from "./navbar_landing_1/navbar.component";
import {NavbarLanding2Component} from "./navbar_landing_2/navbar.component";

import {Slider3Component} from "./slider-3/slider-3.component";
import {ComponentsModule} from "../../../components/components.module";
import { PaintContentsComponent } from './posts/contents/paint-contents/paint-contents.component';
import { EditorPostComponent } from './posts/editor-post/editor-post.component';
import { EditorContentComponent } from './posts/contents/editor-content/editor-content.component';
// import {ComponentsModule} from "../../../../../../components/components.module";
import {DragDropModule} from '@angular/cdk/drag-drop';
import {SliderMarvelComponent} from "./slider-marvel/slider-marvel.component";
import {Slider1Component} from "./sliders/slider-1/slider-1.component";

@NgModule({
  declarations: [
    FooterAdminComponent,
    SidebarComponent,
    FooterAdminComponent,
    Slider3Component,
    PaintContentsComponent,
    NavbarLanding1Component,
    NavbarLanding2Component,
    SliderMarvelComponent,
    Slider1Component
  ],
  imports: [
    CommonModule,
    RouterModule,
    FormsModule,
    ComponentsModule,
    DragDropModule
    // ComponentsModule,
  ],
    exports: [
        FooterAdminComponent,
        SidebarComponent,
        Slider3Component,
        PaintContentsComponent,
        NavbarLanding1Component,
        NavbarLanding2Component,
        SliderMarvelComponent,
      Slider1Component
    ]
})
export class ComponentsModuleBlog { }
