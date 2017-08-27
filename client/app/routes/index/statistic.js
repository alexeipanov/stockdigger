import Ember from 'ember';

export default Ember.Route.extend({
  model(params) {
    this.store.adapterFor('position').set('namespace', 'collections/' + params.collection_id);
    return Ember.RSVP.hash({
      positions: this.store.findAll('position', { reload: false }),
    });
  },
});
