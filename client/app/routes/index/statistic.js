import Ember from 'ember';

export default Ember.Route.extend({
  beforeModel() {
    this.store.unloadAll('image');
    this.store.unloadAll('keyword');
    this.store.unloadAll('collection');
  },
  model(params) {
    this.store.adapterFor('keyword').set('namespace', 'collections/' + params.collection_id);
    this.store.adapterFor('image').set('namespace', 'collections/' + params.collection_id);
    return Ember.RSVP.hash({
      collection: this.store.findRecord('collection', params.collection_id, { reload: true }),
      keywords: this.store.findAll('keyword', { reload: true }),
      images: this.store.findAll('image', { reload: true }),
    });
  },
});
