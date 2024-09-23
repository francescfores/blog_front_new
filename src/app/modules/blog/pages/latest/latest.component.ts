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

@Component({
  selector: 'app-latest',
  templateUrl: './latest.component.html',
  styleUrls: ['./latest.component.css']
})
export class LatestComponent {
  posts:any;
  private category_id: any;
  private subcategory_id: any;
  create_category = false;
  public formCategory: UntypedFormGroup;
  submitted = false;
  environment =environment;
  //alert
  text: any;
  color: any;
  show=false;
  autocloseTime=2000;
  private category: Post;
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

  ) {
    this.formCategory = this.formBuilder.group({
      name: ['', Validators.required],
      desc: ['', Validators.required],
      img: ['', Validators.required],
    });
    this.category = new Post();
  }

  get fc() {
    return this.formCategory.controls;
  }

  ngOnInit() {
    this.themeService.getCurrentTheme().subscribe(theme => {
      this.isDarkEnable = theme === 'theme-dark';
    });
    this.getCategorysPaginated(1);

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
  create() {
    this.router.navigate(
      ['/admin/blog/create'],
    );
  }
  edit(id: number, name: string) {
    const state = { id };
    const route = ['/admin/blog/update', name];
    this.router.navigate(route, { state });
  }
  delete(id:number) {
    this.postService.delete(id)
      .subscribe({
        next: (res:any) => {
          this.toastr.info(res.message);
          this.submitted = false;
          this.paginated(this.posts.current_page)
        },
        error: (err: any) => { },
        complete: () => { }
      });
  }

  getCategorysPaginated(page:any){
    console.log('getCategorysPaginated')
    console.log(page)

    this.postService.paginated(page)
      .subscribe({
        next: res => {
          console.log(res)
          this.posts= res.data;
          this.posts.current_page =res.data.current_page+'';

        },
        error: (err: any) => { },
        complete: () => { }
      });
  }

  paginated(pr:any) {
    this.posts.current_page=this.sharedService.paginated(pr, this.posts);
    this.getCategorysPaginated(this.posts.current_page)
  }

  createCategory() {
    this.submitted = true;
    if (this.formCategory.valid){
      this.loading = true;
      this.category.name = this.fc['name'].value;
      this.category.desc = this.fc['desc'].value;
      this.category.img = this.selectedFile;

      this.postService.create(this.category)
        .subscribe({
          next: res => {
            this.toastr.info(res.message);
            this.submitted = false;
            this.loading = false;
            this.paginated(this.posts.current_page)
          },
          error: (err: any) => {
            this.loading = false;
          },
          complete: () => { }
        });
    } else {
      this.loading = false;
      this.toastr.info('Invalid form');
    }
  }

  onFileChanged(event:any) {
    this.selectedFile = event.target.files[0];
  }
}



