import Ember from 'ember';
import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  currentUser: Ember.inject.service('current-user'),
  model() {
    let user_id = this.get('currentUser.user.id');
    this.store.adapterFor('image').set('namespace', 'users/' + user_id );
    let images = this.store.findAll('image');
    // this.store.adapterFor('image').set('namespace', '');
    return images;
  }
});
