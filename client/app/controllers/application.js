import Ember from 'ember';

export default Ember.Controller.extend({
  currentUser: Ember.inject.service('current-user'),
  session: Ember.inject.service('session'),
  actions: {
    invalidateSession: function() {
      this.get('session').invalidate();
    }
  }
});
