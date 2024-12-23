import {AfterViewInit, Component, EventEmitter, OnInit, Output, Renderer2} from "@angular/core";
import {first} from "rxjs/operators";
import {UntypedFormControl, UntypedFormGroup, Validators} from "@angular/forms";
import {Router} from "@angular/router";
import {AuthenticationAdminService} from "../../../../../services/api/authentication-admin.service";

import {ToastrService} from "ngx-toastr";
import {
  SocialAuthService,
  GoogleLoginProvider,
  SocialUser,
} from '@abacritt/angularx-social-login';
import {of} from "rxjs";
import {ThemeService} from "../../../../../services/theme/theme.service";

@Component({
  selector: "app-login",
  templateUrl: "./login.component.html",
})


export class LoginComponent implements OnInit, AfterViewInit {
  @Output() onClick: EventEmitter<any> = new EventEmitter<any>();
  public loginForm!: UntypedFormGroup;
  loading = false;
  submited = false;

  //social login
  socialUser!: SocialUser;
  //isLoggedin?: boolean;
  isLoggedin=false;
  declare  gapi: any;
  errorMessage!: string;

  isDarkEnable=false;



  constructor(
    public router: Router,
    public authenticationService: AuthenticationAdminService,
    public socialAuthService: SocialAuthService,
    private toastr: ToastrService,
  public themeService: ThemeService,
) {
  }

  ngAfterViewInit():void{
    if (this.authenticationService.currentUserValue) {
      this.router.navigate(['/shop/products']);
    }
  }

  ngOnInit(): void {
    this.themeService.getCurrentTheme().subscribe(theme => {
      this.isDarkEnable = theme === 'theme-dark';
    });
    this.loginForm = new UntypedFormGroup({
      email: new UntypedFormControl('client_ecommerce@gmail.com',
        [Validators.required,Validators.pattern('[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$')]),
      password: new UntypedFormControl('123456', Validators.required)
    });
    this.socialAuthService.authState.subscribe((user) => {
      this.socialUser = user;
      this.isLoggedin = user != null;
      console.log(this.socialUser);
      this.authenticationService.loginGoogle(this.socialUser.email, this.socialUser.idToken)
        //this.authenticationService.login(this.f.email.value, this.f.password.value)
        .pipe(first())
        .subscribe(
          data => {
            console.log(data);
            this.loading = false;
            this.router.navigate(['/shop/products']);
          },
          error => {
            //this.toastr.error('Invalid request', 'Toastr fun!');
            // this.loading = false;
          });
    });

  }

  // loginWithGoogle(): void {
  //   this.socialAuthService.signIn(GoogleLoginProvider.PROVIDER_ID);
  // }
  logOut(): void {
    this.socialAuthService.signOut();
  }

  get f() { return this.loginForm.controls; }
  logIn() {
    this.submited = true;
    if (this.loginForm.valid) {
      this.loading = true;
      this.authenticationService.loginUser(this.f['email'].value, this.f['password'].value)
        .pipe(first())
        .subscribe(
          data => {
            this.loading = false;
            this.router.navigate(['/shop/products']);
          },
          error => {
            this.loading = false;
            this.errorMessage = 'Invalid username or password';
            this.toastr.error(this.errorMessage);
          });
    } else {
      this.errorMessage = 'Email and password are required!';
      // if(this.f['email']['errors']['pattern']){
      //   this.errorMessage = 'Email not valid!';
      // }
      this.loading=false;
      this.toastr.error(this.errorMessage);
    }
  }
}
