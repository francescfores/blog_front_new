import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import {RouterModule} from "@angular/router";
import {FormsModule} from "@angular/forms";
import {FooterAuthComponent} from "./footer/footer-auth.component";
import {NavbarComponent} from "./navbar/navbar.component";

@NgModule({
  declarations: [
    FooterAuthComponent,
    NavbarComponent,
    FooterAuthComponent,
  ],
  imports: [
    CommonModule,
    RouterModule,
    FormsModule,
  ],
    exports: [
        FooterAuthComponent,
        NavbarComponent,
    ]
})
export class ComponentsAuthModule { }
