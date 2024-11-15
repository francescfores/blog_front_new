import { Component, OnInit, AfterViewInit } from "@angular/core";
import Chart from "chart.js/auto";
import { first } from "rxjs/operators";
import moment from "moment";
import { PostService } from "../../../blog/services/api/post.service";
import { UserService } from "../../../../services/api/user.service";
import { Post } from "../../../../models/post";
import { User } from "../../../../models/user";

@Component({
  selector: "app-dashboard",
  templateUrl: "./dashboard.component.html",
})
export class DashboardComponent implements OnInit, AfterViewInit {
  selectedDateStart = new Date(
    new Date().getFullYear(),
    new Date().getMonth(),
    1
  );
  selectedDateEnd = new Date(
    new Date().getFullYear(),
    new Date().getMonth() + 1,
    0
  );
  selectedTypeFilter = "days";
  endDate: any;
  startDate: any;
  orders: any;
  public post: any[] = [];
  public users: any[] = [];
  
  constructor(
    private postService: PostService,
    private userService: UserService
  ) {}

  ngOnInit(): void {
    this.startDate = moment(this.selectedDateStart).format("YYYY-MM-DD");
    this.endDate = moment(this.selectedDateEnd).format("YYYY-MM-DD");
    this.loadCharts()
    this.getPosts();
    this.getUsersBetweenDate();


   
  }
  ngAfterViewInit(): void {}

  getPosts() {
     this.postService
      .getAll()
      .pipe(first())
      .subscribe(
        (res) => {
          this.post = res.data;
          console.log(this.post);
          this.loadCharsPosts();
        },
        (error) => {
          //this.toastr.error('Invalid request', 'Toastr fun!');
          // this.loading = false;
        }
      );
  }
  getUsersBetweenDate() {
     this.userService
      .getBetweenDate(this.startDate, this.endDate)
      .pipe(first())
      .subscribe(
        (res) => {
          this.users = res.data;
          console.log(this.users);
          this.loadCharsUsers();
        },
        (error) => {
          //this.toastr.error('Invalid request', 'Toastr fun!');
          // this.loading = false;
        }
      );
  }

  configLineChart: any;
  chart1: any;

  loadCharsPosts() {
    this.configLineChart = new Chart(
      document.getElementById("myChart") as HTMLCanvasElement,
      {
        type: "doughnut",
        data: {
          labels: [],
          datasets: [
            {
              data: [],
              borderWidth: 2,
              backgroundColor: [],
              hoverOffset: 4,
            },
          ],
        },
      }
    );

    this.post.forEach((post) => {
      this.configLineChart.data.labels.push(post.name);
      this.configLineChart.data.datasets[0].data.push(post.views);
      this.configLineChart.data.datasets[0].backgroundColor.push(
        this.getRandomColor()
      );
    });
    this.configLineChart.update(); // Calling update now animates the position of March from 90 to 50.
  }

  loadCharts(){
     this.chart1 = new Chart(
      document.getElementById("chart1") as HTMLCanvasElement,
      {
        type: "line",
        data: {
          labels: [],
          datasets: [
            {
              data: [],
                 borderWidth: 2,
                  borderColor: 'rgb(75, 192, 192)',
           backgroundColor: ['rgb(75, 192, 192)'],
              label:'Usuarios'
            },
          ],
        },
      }
    );
  }
  loadCharsUsers() {
   
    let startDate;
    let endDate
    let difference;
    this.chart1.data.datasets[0].data=[]
    this.chart1.data.labels=[]
    startDate = moment(this.startDate);
        endDate = moment(this.endDate);
        difference = endDate.diff(startDate, 'days');
        //pintamos los pedidos/dias
        for(let i = 0; i <= difference; i++) {
          let datasets = this.users.filter(x => moment(x.created_at).format('YYYY-MM-DD') === startDate.format('YYYY-MM-DD'))
          this.chart1.data.labels.push(startDate.format('DD'));
          if(datasets){
            this.chart1.data.datasets[0].data.push(datasets.length);
          }
          startDate.add(1, 'days');
          }

    console.log(difference)

    this.chart1.update(); // Calling update now animates the position of March from 90 to 50.
  }
  onDateChangeStart(event: any) {
    this.selectedDateStart = event.target.value;
    this.startDate = moment(this.selectedDateStart).format("YYYY-MM-DD")
    console.log(this.selectedDateStart);
    this.getUsersBetweenDate();
  }
  onDateChangeEnd(event: any) {
    this.selectedDateEnd = event.target.value;
    this.endDate = moment(this.selectedDateEnd).format("YYYY-MM-DD")

    console.log(this.selectedDateEnd);
    this.getUsersBetweenDate();
  }

  onTypeFilter(event: any) {
    this.selectedTypeFilter = event.target.value;
    console.log(this.selectedTypeFilter);
    this.getUsersBetweenDate();
  }

  getRandomColor() {
    const r = Math.floor(Math.random() * 256);
    const g = Math.floor(Math.random() * 256);
    const b = Math.floor(Math.random() * 256);
    return `rgb(${r}, ${g}, ${b})`;
  }
}
