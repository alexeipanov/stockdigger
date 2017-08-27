import Ember from 'ember';

export default Ember.Route.extend({
  pageTitle: 'Statistics',
  model() {
    return this.store.findAll('collection');
  },
});
