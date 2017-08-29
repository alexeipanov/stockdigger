import Ember from 'ember';
import moment from 'moment';
import c3 from 'c3';

export default Ember.Component.extend({
  didInsertElement() {
    let timeAxis = ['created_at'];
    console.log(timeAxis.concat(this.get('data').mapBy('created_at').map((date) => { return moment().format('YYYY-MM-DD'); })));
    c3.generate({
      bindto: '#chart',
      data: {
        x: 'created_at',
        xFormat: '%Y-%m-%d',
        columns: [
          timeAxis.concat(this.get('data').mapBy('created_at').map((date) => { return moment().format('YYYY-MM-DD'); })),
          ['position'].concat(this.get('data').mapBy('position'))
        ],
      },
      axis: {
        x: {
          type: 'timeseries',
          label: 'Date',
          tick: {
            format: '%Y-%m-%d'
          }
        }
      }
    });
  },
});
