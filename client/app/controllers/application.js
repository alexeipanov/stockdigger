import Ember from 'ember';

export default Ember.Controller.extend({
  session: Ember.inject.service('session'),
  currentUser: Ember.inject.service('current-user'),
  actions: {
    invalidateSession: function() {
      this.get('session').invalidate();
    },
  }
});
