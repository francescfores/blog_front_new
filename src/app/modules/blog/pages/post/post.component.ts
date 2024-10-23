import { Component } from '@angular/core';
import {UntypedFormBuilder, UntypedFormGroup, Validators} from "@angular/forms";
import {Post} from "../../models/post";
import {PostCategory} from "../../models/post-category";
import {Router} from "@angular/router";
import {PostService} from "../../services/api/post.service";
import {CategoryService} from "../../services/api/post-category.service";
import {SharedService} from "../../../../services/shared.service";
import {ToastrService} from "ngx-toastr";
import {ThemeService} from "../../../../services/theme/theme.service";
import {first} from "rxjs/operators";
import {environment} from '../../../../../environments/environment';
import {PostContent} from "../../models/post-content";

@Component({
  selector: 'app-post',
  templateUrl: './post.component.html',
  styleUrls: ['./post.component.css']
})
export class PostComponent {
  loading=true;

  private id: any;
  public post!: Post;
  public postContents: PostContent[] = [];


  constructor(
    private router: Router,
    private postService: PostService,
    private postCategoryService: CategoryService,
  ) {
  }
  getParams(){
    this.id = history.state.id;
    this.getProduct();
  }

  getProduct(){
    this.postService.get(this.id)
      .pipe(first())
      .subscribe(
        data => {
          console.error(data)

          this.post = data.data;
          this.postContents = this.post.components;
          console.log(this.post)
          console.log(this.postContents)
          this.loading=false;
          if (this.post) {
            //this.subcategories= this.category.subcategories;
            //init forms
            // this.form.value.post.name=this.post.name;
            // this.form.value.post.desc=this.post.desc;
            // this.form.value.post.category=this.post.category.id;
          }
        },
        error => {
        });
  }

  ngOnInit() {
    this.getParams();
  }


}
