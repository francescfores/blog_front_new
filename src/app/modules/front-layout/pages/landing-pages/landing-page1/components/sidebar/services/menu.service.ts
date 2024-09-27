import { Injectable } from '@angular/core';
import {first, map} from 'rxjs/operators';
import {HttpClient, HttpParams} from '@angular/common/http';
import {BehaviorSubject, Observable, pipe} from 'rxjs';
import {MenuItem} from "../models/menu-item";

@Injectable({
  providedIn: 'root'
})

export class MenuService {
  public menuItems() {
    return [

      new MenuItem('Funciones', null,'/landings/landing1',null,'pt-0',false,null),
      new MenuItem('Soluciones', null,'/landings/landing1',null,'pt-0',false,null),
      new MenuItem('Empresa', null,'/landings/landing1',null,'pt-0',false,null),
      new MenuItem('Recursos', null,'/landings/landing1',null,'pt-0',false,null),
      new MenuItem('Precios', null,'/landings/landing1',null,'pt-0',false,null),
    ]
  }
 
}
