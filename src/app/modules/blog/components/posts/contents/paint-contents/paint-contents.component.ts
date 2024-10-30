import {Component, ElementRef, EventEmitter, Input, Output, ViewChild} from '@angular/core';
import {environment} from '../../../../../../../environments/environment';
import {PostContent} from "../../../../models/post-content";
import {ViewportRuler} from "@angular/cdk/overlay";
import {PostContentService} from "../../../../services/api/post-content.service";
import {first} from "rxjs/operators";

import {
  CdkDrag,
  CdkDragDrop,
  CdkDragPlaceholder,
  CdkDropList,
  moveItemInArray,
} from '@angular/cdk/drag-drop';
@Component({
  selector: 'app-paint-contents',
  templateUrl: './paint-contents.component.html',
  styleUrls: ['./paint-contents.component.css']
})
export class PaintContentsComponent {
  environment =environment;

  constructor(
    private postContentService: PostContentService,
  ){
  }

  setDynamicBackground(component:any) {
    const figureElement = document.querySelector('.'+component.name+'-'+component.id) as HTMLElement;
    if (figureElement) {
      figureElement?.style.setProperty('--color', 'url('+ this.getAtt(component, 'img_bg_url') +') top/cover')
    }
    return '';
  }
  @Input() content: any;
  subcomponent: any;
  @Output() selectContent = new EventEmitter<number>();

  @Input() emitClick = true;
  clicked = false;
  showTree=false;
  @Input() showEditor=false;

  onClick(content: any) {
    this.selectContent.emit(content);
    this.showTree=false;
  }

  onClick2(content: any) {
    this.selectContent.emit(content);
    this.showTree=false;
  }
  // onClick(content:any) {
  //   this.selectContent.emit(content);
  // }
  getAtt(content: any, att: string): any {
    let attribute;
    if (content?.subcomponent_attributes?.length>0) {
      attribute = content.subcomponent_attributes.find((x: any) => x.name === att);
      if(attribute?.value===undefined){
        attribute = content.attributes.find((x: any) => x.name === att);
      }
    }
    else{
      attribute = content.attributes.find((x: any) => x.name === att);
    }
    return attribute ? attribute.value : null;
  }

  //refactor
  normalizarSubcomponente(subcomponente: any): any {

    return {
      id: subcomponente.component.id,
      subcomponent_id: subcomponente.id,
      name: subcomponente.component.name,
      desc: subcomponente.component.desc,
      order: subcomponente.order,
      subcomponent_attributes: subcomponente.subcomponent_attributes,
      subcomponents: subcomponente.subcomponents,
      attributes: subcomponente.component.attributes,
      type: subcomponente.component.type,
    };
  }

  editing() {
    return this.showEditor?'hover:border-2 border-red-400/50 ':'';
  }

  drop(event: CdkDragDrop<string[]>,content:any) {
    moveItemInArray(content.subcomponents, event.previousIndex, event.currentIndex);
    this.content.subcomponents.forEach((sub: any) => {
      console.log(sub.component.name)
    });
    this.postContentService.orderSubcomponents(content.id, content.subcomponents)
      .pipe(first())
      .subscribe(
        data => {
          //this.postContent=data.data;
          console.log('getContent',content);
          //this.updatedContent.emit(this.postContent);
        });
  }

  removeContent(subcontent: PostContent) {
    this.postContentService.deleteSubComponent(subcontent.id)
      .subscribe({
        next: (res:any) => {
          this.content =res.data;
          //this.updatedContent.emit(this.content);
        },
        error: (err: any) => { },
        complete: () => { }
      });
  }
}

