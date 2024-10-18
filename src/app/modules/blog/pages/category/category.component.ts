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
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-category',
  templateUrl: './category.component.html',
  styleUrls: ['./category.component.css']
})
export class CategoryComponent {
  posts:any;
  private category_id: any;
  public category: any;
  private subcategory_id: any;
  create_category = false;
  submitted = false;
  environment =environment;
  //alert
  text: any;
  color: any;
  show=false;
  autocloseTime=2000;
  selectedFile: any;
  loading=false;


  categories!: PostCategory[];
  isDarkEnable = false;
  sidebarOpen= false;

  constructor(
    private router: Router,
    private postService: PostService,
    private postCategoryService: CategoryService,
    private formBuilder: UntypedFormBuilder,
    private sharedService: SharedService,
    private toastr: ToastrService,
    public themeService: ThemeService,
    private route: ActivatedRoute
  ) {
  }

  ngOnInit() {
    console.log('epa');
    this.route.paramMap.subscribe(params => {
      this.category_id = params.get('id');
    this.getParams();
    });
    this.getParams();

  }

  goToCat(id: number, catname: string) {
    const state = { id };
    console.log(state)
    const route = ['/blog/categories', catname];
    this.router.navigate(route, { state });
  }

  getParams(){
    this.category_id = history.state.id;
    console.log(this.category_id);
    this.getPostsByCategory(this.category_id);
  }
  goToPost(id: number, post: any) {
    const state = { id };
    console.log(state)
    const route = ['/blog/posts/'+this.category.name, post.name];
    this.router.navigate(route, { state });
  }

  getPostsByCategory(id:any){
    console.log('getCategorysPaginated')
    console.log(id)

    this.postCategoryService.get(id)
      .subscribe({
        next: res => {
          console.log(res)
          this.category= res.data;
          this.posts= res.data.posts;
          this.loading=true;
        },
        error: (err: any) => { },
        complete: () => { }
      });
  }


}


