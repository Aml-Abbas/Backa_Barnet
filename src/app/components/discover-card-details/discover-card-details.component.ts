import { Component, OnInit } from '@angular/core';
import { DiscoverCard } from 'src/app/models/DiscoverCard';

@Component({
  selector: 'app-discover-card-details',
  templateUrl: './discover-card-details.component.html',
  styleUrls: ['./discover-card-details.component.scss']
})
export class DiscoverCardDetailsComponent implements OnInit {
  discoverCard: DiscoverCard= new DiscoverCard('2021', 'AML','cgi','utvecklare',
                                                'Ahmad', '19930819',
                                                'Baraa', '93081987643',
                                                'Baraa2','1993093833',
                                                '0', 'uyagfaugfa', '12', '4', 'dhrh');

  constructor() { }

  ngOnInit(): void {
  }

}
