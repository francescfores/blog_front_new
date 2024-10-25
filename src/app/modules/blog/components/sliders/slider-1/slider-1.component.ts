import { Component } from '@angular/core';

@Component({
  selector: 'app-slider-1',
  templateUrl: './slider-1.component.html',
  styleUrl: './slider-1.component.css'
})
export class Slider1Component {
  slideNum=4;
  currentIndex = 0;
  transformStyle: string = '';

  ngOnInit() {
    this.updateTransformStyle();
    setInterval(() => this.showNextSlide(), 3000);
  }

  showNextSlide() {
    this.currentIndex = (this.currentIndex + 1) % this.slideNum;
    this.updateTransformStyle();
  }

  updateTransformStyle() {
    this.transformStyle = `translateX(-${this.currentIndex * 100}%)`;
  }
}
