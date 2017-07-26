import Ember from 'ember';

export default Ember.Route.extend({
  session: Ember.inject.service('session'),
  currentUser: Ember.inject.service('current-user'),
  model() {
    return this.get('currentUser').load();
  }
});
