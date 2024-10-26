import { Component } from '@angular/core';
import { OnInit, CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { register } from 'swiper/element/bundle';
/* import { Button3dComponent } from 'button3d';
 */import { Button3dComponent } from '../../../../../components/buttons/button3d/button3d.component';

register();

@Component({
  selector: 'app-swiper-slider',
  templateUrl: './swiper-slider.component.html',
  styleUrls: ['./swiper-slider.component.css'],
  schemas: [CUSTOM_ELEMENTS_SCHEMA],
  standalone: true,
  imports:[]
})
export class SwiperSliderComponent {

}
