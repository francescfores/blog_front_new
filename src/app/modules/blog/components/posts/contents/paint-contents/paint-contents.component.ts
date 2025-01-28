import {Component, ElementRef, EventEmitter, Input, Output, ViewChild} from '@angular/core';
import {environment} from '../../../../../../../environments/environment';
import {PostContent} from "../../../../models/post-content";
import {ViewportRuler} from "@angular/cdk/overlay";
import {PostContentService} from "../../../../services/api/post-content.service";
import {first} from "rxjs/operators";
import { DomSanitizer, SafeHtml } from '@angular/platform-browser';

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
private sanitizer: DomSanitizer
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
    console.log('click')
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
  getList(content: any, att: string): any {
    let list = this.getAtt(content, 'list');
    return list.split(",");
  }  

scroll(id: string) {
    const elmnt = document.getElementById(id);
    if (elmnt) {
        // Si elmnt no es null, se hace scroll
        const yOffset = -80; // Desplazamiento adicional de 40px hacia arriba
        const y = elmnt.getBoundingClientRect().top + window.pageYOffset + yOffset;

        // Desplazar suavemente la ventana a la posición calculada
        window.scrollTo({ top: y, behavior: "smooth" });    } else {
        // Opcional: manejar el caso en que no se encuentra el elemento
        console.warn(`Elemento con id "${id}" no encontrado`);
    }
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
    return this.showEditor?'hover:border-2 hover:border-red-400/50 ':'';
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
    { id: 222, content: 'Item 1.1' },
    { id: 223, content: 'Item 1.2' },
    { id: 224, content: 'Item 1.3' },
    { id: 225, content: 'Item 1.4' },
];

draggingIndex: any | null = null;
draggedElement: any | null = null;
dragStart(event: DragEvent, index: number, content:any) {
    // Detiene la propagación del evento para evitar que el evento de arrastre se propague a otros elementos.
    event.stopPropagation();
    // Guarda el índice del elemento que se está arrastrando.
    this.draggingIndex = content;
    // Guarda el elemento que se está arrastrando basado en su índice.
    console.log(this.draggingIndex.subcomponent_id)
/*     console.log(content.subcomponents.find((x: any) => x.order === index ) )*/
    this.draggedElement = content.subcomponents.find((x: any) => x.order === index )    // Obtiene el elemento HTML que está siendo arrastrado.
    const target = event.target as HTMLElement;
    // Almacena los datos del índice del elemento arrastrado en el objeto dataTransfer para que pueda ser recuperado durante el "drop".
    event.dataTransfer?.setData('text/plain', JSON.stringify({index}));
    // Añade una clase 'dragging' al elemento arrastrado después de un pequeño retraso para aplicarle algún estilo específico si es necesario.
    setTimeout(() => target.classList.add('dragging'), 0);
}

dragOver(event: DragEvent, index: any,content:any) {
    // Previene el comportamiento por defecto del navegador que puede interferir con el evento de arrastre.
    event.preventDefault();
    // Detiene la propagación del evento para evitar que el evento se propague a otros elementos.
    event.stopPropagation();
    // Obtiene el elemento HTML sobre el que se está arrastrando.
    const target = event.target as HTMLElement;
    const elements = document.querySelectorAll('.over');
    elements.forEach(element => {
      element.classList.remove('over');
    });
    //console.log(index.id)
    console.log(content.subcomponent_id)
    if(content.subcomponent_id===this.draggingIndex.subcomponent_id)
      target.classList.add('over');
    // Añade una clase 'over' al elemento objetivo para aplicar algún estilo específico cuando se esté arrastrando un elemento sobre él.
    
  //moveItemInArray(content.subcomponents, this.draggingIndex,index);

}


drop2(event: DragEvent, index: number,content:any) {
  // Previene el comportamiento por defecto del navegador.
  event.preventDefault();
  // Detiene la propagación del evento para evitar que el evento se propague a otros elementos.
  event.stopPropagation();
  // Recupera los datos del índice del elemento arrastrado desde el objeto dataTransfer.
  const draggedData = JSON.parse(event.dataTransfer?.getData('text')!);
  // Verifica que hay un elemento arrastrado.
  console.log(index)
  console.log(draggedData.index)
  // Remueve el elemento arrastrado de su posición original en el array.
  moveItemInArray(content.subcomponents, draggedData.index,index);
  //this.content?.subcomponents[1].subcomponents.splice(draggedData.index, 1);
  //this.content?.subcomponents[1].subcomponents.splice(index, 0, this.draggedElement);
  // Resetea los índices y el elemento arrastrado.
  this.draggingIndex = null;
  this.draggedElement = null;
  if(content.subcomponent_id===this.draggingIndex.subcomponent_id)
    {
    // Remueve la clase 'over' de todos los elementos que puedan tenerla.
    const overElements = document.querySelectorAll('.over');
    overElements.forEach(el => el.classList.remove('over'));
    content.subcomponents.forEach((component: any, index: number) =>
    component.order=index
  );

  this.postContentService.orderSubcomponents(content.id, content.subcomponents)
  .pipe(first())
  .subscribe(
    data => {
      //this.postContent=data.data;
      console.log('getContent',content);
      //this.updatedContent.emit(this.postContent);
    });

  console.log(this.content?.subcomponents[1].subcomponents)
  }
  

}

  svg!:SafeHtml;
  renderSvg(svgContent: string): SafeHtml {
      return this.sanitizer.bypassSecurityTrustHtml(svgContent);

  }


}
