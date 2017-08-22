import Ember from 'ember';
import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  beforeModel() {
    this.store.unloadAll('keyword');
    this.store.unloadAll('image');
  },
  model(params) {
    this.store.adapterFor('keyword').set('namespace', 'collections/' + params.collection_id);
    return Ember.RSVP.hash({
      collection: this.store.findRecord('collection', params.collection_id, { reload: false }),
      keywords: this.store.findAll('keyword', { reload: true }),
      images: this.store.findAll('image', { reload: true }),
    });
  },

});
