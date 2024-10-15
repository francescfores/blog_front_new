import { Boxer, BOXERS } from './models/boxers';  // Asegúrate de importar desde el archivo correcto
import { CommonModule } from '@angular/common';
import { Component, ViewEncapsulation, OnInit, OnDestroy, ElementRef, Renderer2, AfterViewInit } from '@angular/core';
import * as THREE from 'three';
import { SidebarService } from '../../../components/sidebar/services/sidebar.service';
 
@Component({
  selector: 'app-landing-page3',
  templateUrl: './landing-page3.component.html',
  styleUrls: ['./landing-page3.component.css']
})
export class LandingPage3Component implements OnInit, OnDestroy, AfterViewInit{

  boxers: Boxer[] = BOXERS;
  selected_boxer!: Boxer ;
  onMouseEnter(id:any) {
    const foundBoxer = this.boxers.find(x => x.id === id);
    console.log(foundBoxer);
    if(foundBoxer )
      this.selected_boxer =foundBoxer
    }

    private renderer!: THREE.WebGLRenderer;
  private scene!: THREE.Scene;
  private camera!: THREE.PerspectiveCamera;
  private particles: THREE.Mesh[] = [];
  private particles2: THREE.Mesh[] = [];
  private clock = new THREE.Clock();
  private animationFrameId: number | undefined;

    constructor(private elRef: ElementRef, private renderer2: Renderer2, public sidebarService: SidebarService
) { }
  ngAfterViewInit() {
      this.sidebarService.showSidebar(false);
  }
  
  sidebarOpen=false;
  toggleSidebar(){
    this.sidebarOpen=!this.sidebarOpen;
  }
  ngOnInit(): void {
    this.init();
      this.selected_boxer =this.boxers[16]
  }

  ngOnDestroy(): void {
    if (this.animationFrameId) {
      cancelAnimationFrame(this.animationFrameId);
    }
    // Cleanup Three.js resources if necessary
    this.renderer.dispose();
/*     this.scene.dispose();
 */    this.camera = null!;
  }

  /* private init(): void {
    const container = this.elRef.nativeElement.querySelector('#smoke-container');

    // Crear renderizador
    this.renderer = new THREE.WebGLRenderer({ alpha: true });
    this.renderer.setSize(container.clientWidth, container.clientHeight);
    container.appendChild(this.renderer.domElement);

    // Crear escena
    this.scene = new THREE.Scene();

    // Crear cámara
    this.camera = new THREE.PerspectiveCamera(50, container.clientWidth / container.clientHeight, 1, 100);
    this.camera.position.z = 1;
    this.scene.add(this.camera);

    // Añadir luz
    const light = new THREE.DirectionalLight(0xffffff, 1.0);
    light.position.set(-1, 0, 1);
    this.scene.add(light);

    // Cargar textura de humo
    const assetPath = 'https://s3-us-west-2.amazonaws.com/s.cdpn.io/2666677/';
    const tex = new THREE.TextureLoader().setPath(assetPath).load('smoke_01.png');
    const material = new THREE.MeshLambertMaterial({
      color: 0xb4cd02,
      depthWrite: false,
      map: tex,
      transparent: true,
      opacity: 1 // Inicialmente completamente visible
    });
    //animation1
    const geometry = new THREE.PlaneGeometry(5, 5);
    const size = 5;

    for (let i = 0; i < 10; i++) {
            const particle = new THREE.Mesh(geometry, material.clone()); // Clonar el material para cada partícula
            particle.position.set(
            (Math.random() - 0.5) * size,  // Posición X aleatoria
                (Math.random() - 0.5) * size,  // Posición Y aleatoria
                (Math.random() - 0.5) * size   // 
            );
            particle.rotation.z = Math.random() * Math.PI * 2;
            this.scene.add(particle);
            this.particles2.push(particle);
    }

    this.animate();

    // Redimensionar el renderizador si la ventana cambia de tamaño
    window.addEventListener('resize', this.onResize.bind(this));
  }

  private animate(): void {
    this.animationFrameId = requestAnimationFrame(() => this.animate());
    const dt = this.clock.getDelta();
    //animation1
    this.particles2.forEach(particle => {
      // Subir las partículas lentamente en el eje Y
      particle.position.y += 0.025;
      // Calcular opacidad basada en la posición Y
      const upperLimit = 3;
      const lowerLimit = -3;
      const range = upperLimit - lowerLimit;
      // Ajustar opacidad en función de la posición Y
      const opacity = 1 - (particle.position.y - lowerLimit) / range;


      // Rotar las partículas ligeramente
      particle.rotation.z += dt * 0.05;
    });
    this.renderer.render(this.scene, this.camera);
  } */
  
  private init(): void {
    const container = this.elRef.nativeElement.querySelector('#smoke-container');

    // Crear renderizador
    this.renderer = new THREE.WebGLRenderer({ alpha: true });
    this.renderer.setSize(container.clientWidth, container.clientHeight);
    container.appendChild(this.renderer.domElement);

    // Crear escena
    this.scene = new THREE.Scene();

    // Crear cámara
    this.camera = new THREE.PerspectiveCamera(50, container.clientWidth / container.clientHeight, 1, 100);
    this.camera.position.z = 1;
    this.scene.add(this.camera);

    // Añadir luz
    const light = new THREE.DirectionalLight(0xffffff, 1.0);
    light.position.set(1, 0, 1);
    this.scene.add(light);

    // Cargar textura de humo
    const assetPath = 'https://s3-us-west-2.amazonaws.com/s.cdpn.io/2666677/';
    const tex = new THREE.TextureLoader().setPath(assetPath).load('smoke_01.png');
    const material = new THREE.MeshLambertMaterial({
      color: 0xb4cd02,
      depthWrite: false,
      map: tex,
      transparent: true,
      opacity: 1 // Inicialmente completamente visible
    });
    //animation1
    const geometry = new THREE.PlaneGeometry(5, 5);
    const size = 5;
    for (let i = 0; i < 3; i++) {
      const particle = new THREE.Mesh(geometry, material.clone()); // Clonar el material para cada partícula
      particle.position.set(
        (0.2) * size,  // Posición X aleatoria
        (0) * size,  // Posición Y aleatoria
        (0) * size   // Posición Z aleatoria
      );
      particle.rotation.z = Math.random() * Math.PI * 2;
      this.scene.add(particle);
      this.particles.push(particle);
      
    }
    for (let i = 0; i < 3; i++) {
            const particle = new THREE.Mesh(geometry, material.clone()); // Clonar el material para cada partícula
            particle.position.set(
              (-0.2) * size,  // Posición X aleatoria
              (0) * size,  // Posición Y aleatoria
              (0) * size   // Posición Z aleatoria
            );
            particle.rotation.z = Math.random() * Math.PI * 2;
            this.scene.add(particle);
            this.particles2.push(particle);
    }

    this.animate();

    // Redimensionar el renderizador si la ventana cambia de tamaño
    window.addEventListener('resize', this.onResize.bind(this));
  }

  private animate(): void {
    this.animationFrameId = requestAnimationFrame(() => this.animate());
    const dt = this.clock.getDelta();
    //animation1
    this.particles.forEach(particle => {
      // Subir las partículas lentamente en el eje Y
      particle.position.x += 0.02;
      // Calcular opacidad basada en la posición Y
      const upperLimit = 3;
      const lowerLimit = -3;
      const range = upperLimit - lowerLimit;
      // Ajustar opacidad en función de la posición Y
      const opacity = 1 - (particle.position.y - lowerLimit) / range;
      // Rotar las partículas ligeramente
    });
    this.particles2.forEach(particle => {
      // Subir las partículas lentamente en el eje Y
      particle.position.x -= 0.02;
      // Calcular opacidad basada en la posición Y
      const upperLimit = 3;
      const lowerLimit = -3;
      const range = upperLimit - lowerLimit;
      // Ajustar opacidad en función de la posición Y
      const opacity = 1 - (particle.position.y - lowerLimit) / range;

      // Reciclar las partículas cuando llegan arriba y restablecer la opacidad
    
      // Rotar las partículas ligeramente
     });
    this.renderer.render(this.scene, this.camera);
  } 

  private onResize(): void {
    const container = this.elRef.nativeElement.querySelector('#smoke-container');
    this.camera.aspect = container.clientWidth / container.clientHeight;
    this.camera.updateProjectionMatrix();
    this.renderer.setSize(container.clientWidth, container.clientHeight);
  }
}
