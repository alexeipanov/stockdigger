import Ember from 'ember';
import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  model(params) {
    return Ember.RSVP.hash({
      collection: this.store.findRecord('collection', params.collection_id, { reload: false }),
    });
  },
  renderTemplate() {
    this._super();
    this.render('collections-submenu', {
      into: 'index',
      outlet: 'collections-submenu'
    });
  }
});
