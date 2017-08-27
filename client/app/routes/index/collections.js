import Ember from 'ember';
import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  pageTitle: 'Image Sets',
  model() {
    return this.store.findAll('collection');
  },
});
