import { Component, OnInit } from "@angular/core";
import {SidebarService} from"./../sidebar/services/sidebar.service";
import {CategoryService} from "../../services/api/post-category.service";
import {first} from "rxjs/operators";
import {PostCategory} from "../../models/post-category";
import {Router} from "@angular/router";

@Component({
  selector: "app-footer-blog",
  templateUrl: "./footer-admin.component.html",
})
export class FooterAdminComponent implements OnInit {
    date = new Date().getFullYear();
    constructor(
    public sidebarService: SidebarService,
    private postCategoryService: CategoryService,
    private router: Router,
    ) {}
  
    show_footer!:boolean;
    categories!: PostCategory[];

    ngOnInit(): void {
      this.sidebarService.getShow().subscribe(show_nav => {
        this.show_footer = show_nav;
      });

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
    goToCat(id: number, catname: string) {
      const state = { id };
      console.log(state)
      const route = ['/blog/categories', catname];
      this.router.navigate(route, { state });
    }
}
