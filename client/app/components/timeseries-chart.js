import Ember from 'ember';
import moment from 'moment';
import c3 from 'c3';

export default Ember.Component.extend({
  store: Ember.inject.service(),
  didInsertElement() {
    this.send('keywordSelect', this.get('data.keywords.firstObject.id'));
  },
  actions: {
    keywordSelect(keyword) {
      var g = this;
      this.get('store').adapterFor('position').set('namespace', 'collections/' + this.get('data.collection.id'));
      let images = this.get('data.images');
      this.get('store').query('position', { keyword_id: keyword }).then((positions) => {
        let positionArray = [['created_at']
          .concat(positions.filter(function(item) { return item.get('image_id') == positions.get('firstObject.image_id') })
          .mapBy('created_at'))
        ];

        images.forEach(function(image) {
          positionArray.push([image.get('image')].concat(positions.filter(function(item) {
            return item.get('image_id') == image.get('id') }).mapBy('position')));
        });
        c3.generate({
          bindto: '#chart',
          data: {
            x: 'created_at',
            xFormat: '%Y-%m-%d',
            columns: positionArray
          },
          axis: {
            x: {
              type: 'timeseries',
              label: {
                text: 'Date',
                position: 'outer-center'
              },
              tick: {
                format: '%Y-%m-%d',
                count: 5
              }
            },
            y: {
                inverted: true,
                default: [1, 50],
                label: {
                  text: 'Position',
                  position: 'outer-middle'
                }
              }
          },
          grid: {
            y: {
              lines: [
                {value: 10, text: 'Top 10'},
                {value: 25, text: 'Top 25', class: 'label-200'},
                {value: 50, text: 'Top 50', position: 'middle'}
              ]
            }
          },
          legend: {
            item: {
              onmouseover: function(id) {
                g.set('currentImage', images.findBy('image', id).get('url'));
              }
            }
          }
        });
      });
    }
  }
});
