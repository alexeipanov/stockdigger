import Ember from 'ember';
import ApplicationRouteMixin from 'ember-simple-auth/mixins/application-route-mixin';

export default Ember.Route.reopen(ApplicationRouteMixin, {
  actions: {
    didTransition() {
      this.controller.set('pageTitle', this.get('pageTitle'));
      return true;
    }
  },

});
