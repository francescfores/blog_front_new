import { Component, Input } from '@angular/core';
import { DomSanitizer, SafeHtml } from '@angular/platform-browser';

@Component({
  selector: 'app-component-render',
  templateUrl: './component-render.component.html',
  styleUrl: './component-render.component.css'
})
export class ComponentRenderComponent {

@Input() component :any;
@Input() subcomponent :any;
@Input() index :any;
@Input() showEditor=false;

  constructor(
    private sanitizer: DomSanitizer
  )
  {}

  onClick(content: any) {
    console.log('click')
  }

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

  editing() {
    return this.showEditor?'hover:border-2 hover:border-red-400/50 ':'';
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
  svg!:SafeHtml;
  renderSvg(svgContent: string): SafeHtml {
      return this.sanitizer.bypassSecurityTrustHtml(svgContent);

  }

}
