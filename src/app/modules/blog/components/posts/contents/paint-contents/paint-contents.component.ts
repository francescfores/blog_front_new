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
items: any[] = [
    { id: 1, content: 'Item 1.1' },
    { id: 2, content: 'Item 1.2' },
    { id: 3, content: 'Item 1.3' },
    { 
        id: 4, content: 'Item 1.4', items: [
            { id: 1, content: 'Item 2.1' },
            { id: 2, content: 'Item 2.2' },
            { id: 3, content: 'Item 2.3' },
            { id: 4, content: 'Item 2.4' }
        ]
    }
];

draggingIndex: number | null = null;
draggedElement: any | null = null;

dragStart(event: DragEvent, index: number, subIndex: number | null = null) {
    event.stopPropagation();
    this.draggingIndex = index;
    if (subIndex === null) {
        this.draggedElement = this.items[index];
    } else {
        this.draggedElement = this.items[index].items![subIndex];
    }
    const target = event.target as HTMLElement;
    event.dataTransfer?.setData('text/plain', JSON.stringify({ index, subIndex }));
    setTimeout(() => target.classList.add('dragging'), 0);
}

dragOver(event: DragEvent) {
    event.preventDefault();
    event.stopPropagation();
    const target = event.target as HTMLElement;
    target.classList.add('over');
}

dragLeave(event: DragEvent) {
    event.stopPropagation();
    const target = event.target as HTMLElement;
    target.classList.remove('over');
}

drop2(event: DragEvent, index: number, subIndex: number | null = null) {
    event.preventDefault();
    event.stopPropagation();
    const draggedData = JSON.parse(event.dataTransfer?.getData('text')!);
    if (this.draggedElement) {
        if (draggedData.subIndex === null) {
            this.items.splice(draggedData.index, 1);
            this.items.splice(index, 0, this.draggedElement);
        } else {
            this.items[draggedData.index].items?.splice(draggedData.subIndex, 1);
            if (subIndex === null) {
                this.items[index].items?.push(this.draggedElement);
            } else {
                this.items[index].items?.splice(subIndex, 0, this.draggedElement);
            }
        }
        this.draggingIndex = null;
        this.draggedElement = null;
        const overElements = document.querySelectorAll('.over');
        overElements.forEach(el => el.classList.remove('over'));
    }
}


}