import Ember from 'ember';
import RSVP from 'rsvp';

export default Ember.Service.extend({
  session: Ember.inject.service('session'),
  store: Ember.inject.service(),
  load() {
    if (this.get('session.isAuthenticated')) {
      return RSVP.hash({
        user: this.get('store').queryRecord('user', {
          me: true
        })
      });
    }
  }

});
