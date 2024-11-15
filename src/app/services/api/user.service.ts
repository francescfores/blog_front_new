import { Injectable } from '@angular/core';
import {environment} from '../../../environments/environment';
import {map} from 'rxjs/operators';
import {HttpClient, HttpParams} from '@angular/common/http';
import {BehaviorSubject, Observable, pipe} from 'rxjs';
import { User } from '../../models/user';

@Injectable({
  providedIn: 'root'
})

export class UserService {
  constructor(private http: HttpClient) {
  }
  getAll() {
    return this.http.get<any>(`${environment.apiUrl}api/user`, {  });
  }

  paginated(page:string) {
    return this.http.get<any>(`${environment.apiUrl}api/user?page=`+page, {  });
  }

  get(id:any) {
    console.log('getcategoryById');
    return this.http.get<any>(`${environment.apiUrl}api/user/${id}`, { params: id });
  }

  create(category: any) {
    const params = new FormData();
    Object.keys(category).forEach(key => {
      const value = category[key];

      if (key === 'img') {
        const images = value as FileList;
        for (let i = 0; i < images.length; i++) {
          const file = new File([images[i]], images[i].name);
          params.append('img[]', file);
        }
      } else {
        params.append(key, value);
      }
    });
    return this.http.post<any>(`${environment.apiUrl}api/user`, params);
  }

  update(id:number, category: any) {
    let params = new HttpParams();
    Object.keys(category).forEach(key => {
      params = params.append(key, category[key]);
    });
    return this.http.put<any>(`${environment.apiUrl}api/user/${id}`, category, { params } );
  }

  delete(id:any) {
    console.log('destroycategory');
    return this.http.delete<any>(`${environment.apiUrl}api/user/${id}`, { params: id });
  }

  getAllRoles() {
    return this.http.get<any>(`${environment.apiUrl}api/role`, {  });
  }

  getBetweenDate(date_start:any,date_end:any) {
    let params = new HttpParams();
    params = params.append('date_start', date_start);
    params = params.append('date_end', date_end);

    return this.http.post<any>(`${environment.apiUrl}api/user_between_date`, params)
  }
}
